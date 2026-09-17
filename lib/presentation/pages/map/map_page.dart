import 'package:chat_pet/presentation/pages/map/cubit/map_cubit.dart';
import 'package:chat_pet/presentation/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    this.oldAddress,
    super.key,
  });

  final String? oldAddress;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapCubit cubit;
  late final MapController _mapController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cubit = MapCubit(oldAddress: widget.oldAddress);
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

  Future<void> onMarkerTap(BuildContext context, LatLng myLocation) async {
    final location = await cubit.getAddressFromLatLng(myLocation);
    _controller.text = location ?? '';

    if (!context.mounted) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: BottomSheetWidget(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpacingFoundation.verticalSpace12,
                Text(
                  S.of(context).YourAddress,
                  style: context.uiKitTheme?.carosTextTheme.mediumBold,
                ),
                UiKitTextField(
                  controller: _controller,
                  validator: (address) {
                    final newAddress = address?.trim();
                    if (newAddress == null || newAddress.isEmpty) return S.of(context).AddressCannotBeEmpty;

                    return null;
                  },
                ).paddingHorizontal(SpacingFoundation.horizontalSpacing12),
                SpacingFoundation.verticalSpace12,
                UiKitButton.primary(
                  text: S.of(context).Save,
                  size: UiKitButtonSize.lFull,
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      GoRouter.of(context).pop();
                      GoRouter.of(context).pop(_controller.text.trim());
                    }
                  },
                ).paddingHorizontal(SpacingFoundation.horizontalSpacing12),
                SpacingFoundation.verticalSpace30,
              ],
            ),
          ),
        );
      },
    );
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
                            onLongPress: (tapPosition, point) => cubit.updateMyPosition(point),
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.chat_pet',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: myLocation,
                                  width: 40,
                                  height: 40,
                                  child: InkWell(
                                    onTap: () => onMarkerTap(context, myLocation),
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
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: .min,
                            spacing: SpacingFoundation.horizontalSpacing12,
                            children: [
                              Material(
                                color: theme?.colorScheme.surface1,
                                borderRadius: BorderRadius.circular(
                                  SpacingFoundation.horizontalSpacing12,
                                ),
                                child: InkWell(
                                  onTap: () => updateZoom(true),
                                  child: Icon(
                                    Icons.add,
                                    color: theme?.colorScheme.darkNeutral,
                                    size: 28.0.w,
                                  ).paddingAll(EdgeInsetsFoundation.all4),
                                ),
                              ),
                              Material(
                                color: theme?.colorScheme.surface1,
                                borderRadius: BorderRadius.circular(
                                  SpacingFoundation.horizontalSpacing12,
                                ),
                                child: InkWell(
                                  onTap: () => updateZoom(false),
                                  child: Icon(
                                    Icons.remove,
                                    color: theme?.colorScheme.darkNeutral,
                                    size: 28.0.w,
                                  ).paddingAll(EdgeInsetsFoundation.all4),
                                ),
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
