import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:no_name/services/alert_service.dart';
import 'package:no_name/services/api_service.dart';
import 'package:no_name/services/geolocator_service.dart';
import 'package:no_name/services/location_service.dart';
import 'package:no_name/services/navigation_service.dart';
import 'package:no_name/services/storage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => GeolocatorService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => AlertService());
  locator.registerLazySingleton(() => StorageService());
}