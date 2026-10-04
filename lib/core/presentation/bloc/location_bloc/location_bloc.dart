import 'dart:async';

import 'package:compassly/core/domain/entities/location_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? subscription;

  bool _wanted = false;

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }

  LocationBloc() : super(const LocationState.init()) {
    on<_Start>((event, emit) async {
      if (subscription != null) return;
      if (_wanted) return;

      _wanted = true;

      bool isValidPermissions(LocationPermission p) => {
        LocationPermission.always,
        LocationPermission.whileInUse,
      }.contains(p);

      final permission = await Geolocator.checkPermission();

      if (!isValidPermissions(permission)) {
        if (permission == LocationPermission.deniedForever) {
          _wanted = false;
          return emit(
            LocationState.error(
              message:
                  'Permission Denied. Please allow it from your device settings',
            ),
          );
        }

        final requestPermission = await Geolocator.requestPermission();
        if (!isValidPermissions(requestPermission)) {
          _wanted = true;
          return emit(
            LocationState.error(
              message: 'You denied this permission, please try again',
            ),
          );
        }
      }

      if (!_wanted || subscription != null) return;

      subscription =
          Geolocator.getPositionStream().listen((data) {
            final locationData = LocationData(
              lat: data.latitude,
              long: data.longitude,
            );
            add(LocationEvent.update(locationData));
          })..onError((error) {
            add(LocationEvent.failed(error.toString()));
          });
    });

    on<_Update>((event, emit) {
      emit(LocationState.data(data: event.location.toJson()));
    });

    on<_Stop>((event, emit) async {
      _wanted = false;
      await subscription?.cancel();
      subscription = null;
      emit(LocationState.init());
    });

    on<_Failed>((event, emit) {
      emit(LocationState.error(message: event.message));
    });
  }
}
