import 'package:flutter/material.dart';
import 'package:no_name/constants/route_name.dart';
import 'package:no_name/locator.dart';
import 'package:no_name/services/alert_service.dart';
import 'package:no_name/services/navigation_service.dart';
import 'package:no_name/services/storage_service.dart';
import 'package:no_name/viewmodels/base_model.dart';

class DashboardViewModel extends BaseModel {
  final StorageService _storageService = locator<StorageService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AlertService _alertService = locator<AlertService>();

  String name="";
  String K_NAME = 'name';

  void initData(BuildContext context) async{
    setBusy(true);
    name = await _storageService.getString('name');
    setBusy(false);
  }

  void clearBeforeSignOut() async {
    await _storageService.clearStorage();
    _navigationService.replaceTo(LoginViewRoute);
  }

  void signOut(BuildContext context){
    setBusy(true);
    _alertService.showSignOut(context, 'Sign Out?', '', clearBeforeSignOut, _navigationService.pop);
    setBusy(false);
  }

}