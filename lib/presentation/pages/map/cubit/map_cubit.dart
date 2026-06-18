import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'map_cubit.freezed.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({required this.oldAddress}) : super(const MapState.initial()) {
    initMyLocation();
  }

  final String? oldAddress;

  Future<String?> getAddressFromLatLng(LatLng point) async {
    final client = HttpClient();
    try {
      final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=${point.latitude}&lon=${point.longitude}&format=json&accept-language=ru',
      );
      final request = await client.getUrl(uri);
      request.headers.set('User-Agent', 'ChatPetApp/1.0');
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      final data = jsonDecode(body) as Map<String, dynamic>;
      return data['display_name'] as String?;
    } catch (_) {
      return null;
    } finally {
      client.close();
    }
  }

  void updateMyPosition(LatLng point) {
    emit(MapState.loaded(point));
  }

  Future<void> initMyLocation() async {
    emit(const MapState.loading());

    if (oldAddress != null && oldAddress!.isNotEmpty) {
      final location = await _latLngFromAddress(oldAddress!);
      if (location != null) {
        emit(MapState.loaded(location));
        return;
      }
    }

    final LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      await Geolocator.requestPermission();
      await initMyLocation();
    }

    final lastPosition = await Geolocator.getLastKnownPosition();

    if (lastPosition == null) {
      final currentPosition = await Geolocator.getCurrentPosition();

      emit(MapState.loaded(LatLng(currentPosition.latitude, currentPosition.longitude)));
    } else {
      emit(MapState.loaded(LatLng(lastPosition.latitude, lastPosition.longitude)));
    }
  }

  Future<LatLng?> _latLngFromAddress(String address) async {
    final client = HttpClient();
    try {
      final uri = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=${Uri.encodeComponent(address)}&format=json&limit=1',
      );
      final request = await client.getUrl(uri);
      request.headers.set('User-Agent', 'ChatPetApp/1.0');
      final response = await request.close();
      final body = await response.transform(utf8.decoder).join();
      final data = jsonDecode(body) as List<dynamic>;
      if (data.isEmpty) return null;
      final first = data.first as Map<String, dynamic>;
      return LatLng(
        double.parse(first['lat'] as String),
        double.parse(first['lon'] as String),
      );
    } catch (_) {
      return null;
    } finally {
      client.close();
    }
  }
}
