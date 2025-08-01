import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/extensions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/form_spinner.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ContributeBoulderMapScreen extends StatelessWidget {
  const ContributeBoulderMapScreen({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(child: Text(localizations.specifyBoulderLocation)),
      ),
      body: BlocProvider(
        create:
            (context) => ContributeBoulderMapViewModel(
              form: ContributeBoulderLocationForm(
                latitude: boulder.rock.location.latitude,
                longitude: boulder.rock.location.longitude,
              ),
              boulderFeedbackRepository: GetIt.I<BoulderFeedbackRepository>(),
              boulder: boulder,
            ),
        child: BlocConsumer<
          ContributeBoulderMapViewModel,
          ContributeBoulderMapState
        >(
          listener: (context, state) {
            if (state.done) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    localizations.thanksWeWillReviewYourContribution,
                  ),
                ),
              );
              context
                ..pop()
                ..pop();
              return;
            }
            if (state.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(localizations.anErrorOccured)),
              );
            }
          },
          builder: (context, state) {
            return ReactiveForm(
              formGroup: state.form,
              child: Column(
                children: [
                  ListTile(
                    subtitle: Text(
                      localizations.mapFormHelper(boulderName: boulder.name),
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        MyMap(
                          cameraOptions: CameraOptions(
                            zoom: 15,
                            center: Point(
                              coordinates: Position(
                                boulder.rock.location.longitude,
                                boulder.rock.location.latitude,
                              ),
                            ),
                          ),
                          onMapCreated: (mapboxMap) async {
                            final pointAnnotationManager =
                                await mapboxMap.annotations
                                    .createPointAnnotationManager();

                            if (!context.mounted) {
                              return;
                            }
                            final imageData = await context
                                .getResponsiveImageData(
                                  imagePath: Assets.locationIcon,
                                );

                            final pointAnnotationOptions =
                                PointAnnotationOptions(
                                  geometry: Point(
                                    coordinates: Position(
                                      boulder.rock.location.longitude,
                                      boulder.rock.location.latitude,
                                    ),
                                  ),
                                  image: imageData,
                                  iconSize: 1.3,
                                  iconAnchor: IconAnchor.BOTTOM,
                                  isDraggable: true,
                                );

                            await pointAnnotationManager.create(
                              pointAnnotationOptions,
                            );
                            pointAnnotationManager.dragEvents(
                              onEnd: (annotation) {
                                context.read<ContributeBoulderMapViewModel>()
                                  ..add(
                                    UpdateLatitudeEvent(
                                      latitude:
                                          annotation.geometry.coordinates.lat
                                              .toDouble(),
                                    ),
                                  )
                                  ..add(
                                    UpdateLongitudeEvent(
                                      longitude:
                                          annotation.geometry.coordinates.lng
                                              .toDouble(),
                                    ),
                                  );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(localizations.latitude),
                              ReactiveFormConsumer(
                                builder: (context, _, child) {
                                  return Text(
                                    state.form.latitude.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                localizations.longitude,
                                textAlign: TextAlign.right,
                              ),
                              ReactiveFormConsumer(
                                builder: (context, _, _) {
                                  return Text(
                                    state.form.longitude.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.right,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.centerLeft,
                      children: [
                        if (state.pending)
                          const Positioned(left: -50, child: FormSpinner()),
                        ReactiveFormConsumer(
                          builder: (context, form, _) {
                            return FilledButton(
                              onPressed:
                                  !state.pending && form.valid
                                      ? () {
                                        context
                                            .read<
                                              ContributeBoulderMapViewModel
                                            >()
                                            .add(SubmitLocationEvent());
                                      }
                                      : null,
                              child: Text(localizations.submitLocation),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
