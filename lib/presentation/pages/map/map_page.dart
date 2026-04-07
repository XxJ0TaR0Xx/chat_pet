import 'package:chat_pet/presentation/pages/map/cubit/map_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapCubit cubit;
  late final MapController _mapController;

  final List<Marker> markers = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    cubit = MapCubit();
    _mapController = MapController();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  void updateZoom(bool isPlus) {
    double newZoom = _mapController.camera.zoom;
    if (isPlus) {
      newZoom += 0.4;
    } else if (newZoom >= 1) {
      newZoom -= 0.4;
    }

    _mapController.move(_mapController.camera.center, newZoom);
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    setState(() {
      markers.add(
        Marker(
          point: point,
          width: 40,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.uiKitTheme;

    return Scaffold(
      backgroundColor: theme?.colorScheme.darkNeutral,
      appBar: UiKitAppBar(
        leadingColor: theme?.colorScheme.surface1,
        preferredSize: const Size(double.infinity, 60),
        child: Text(
          S.of(context).SelectYourAddress,
          style: theme?.carosTextTheme.medium.copyWith(
            fontSize: 20.w,
            color: theme.colorScheme.surfaceBase,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<MapCubit, MapState>(
            builder: (context, state) => state.when(
              initial: SizedBox.shrink,
              loading: () => Center(
                child: SizedBox(
                  width: 32.w,
                  height: 32.w,
                  child: CircularProgressIndicator(
                    color: theme?.colorScheme.primary,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              loaded: (myLocation) => Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        FlutterMap(
                          mapController: _mapController,
                          options: MapOptions(
                            initialCenter: myLocation,
                            cameraConstraint: const CameraConstraint.containLatitude(),
                            onLongPress: _onMapTap,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.chat_pet',
                            ),
                            MarkerLayer(
                              markers: markers,
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: .min,
                            spacing: SpacingFoundation.horizontalSpacing12,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: theme?.colorScheme.surface1,
                                  borderRadius: BorderRadius.circular(
                                    SpacingFoundation.horizontalSpacing12,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () => updateZoom(true),
                                  child: Icon(
                                    Icons.add,
                                    color: theme?.colorScheme.darkNeutral,
                                    size: 28.0.w,
                                  ),
                                ).paddingAll(EdgeInsetsFoundation.all4),
                              ),
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: theme?.colorScheme.surface1,
                                  borderRadius: BorderRadius.circular(
                                    SpacingFoundation.horizontalSpacing12,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () => updateZoom(false),
                                  child: Icon(
                                    Icons.remove,
                                    color: theme?.colorScheme.darkNeutral,
                                    size: 28.0.w,
                                  ),
                                ).paddingAll(EdgeInsetsFoundation.all4),
                              ),
                            ],
                          ),
                        ).paddingAll(EdgeInsetsFoundation.vertical8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
