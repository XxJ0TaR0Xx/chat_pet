import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

part 'map_cubit.freezed.dart';
part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState.initial()) {
    initMyLocation();
  }

  Future<void> initMyLocation() async {
    emit(MapState.loading());

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
}
