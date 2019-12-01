import './app.dart';
import './model/app_state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_driver/driver_extension.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );

  AppStateModel _model = AppStateModel();
  _model.loadProducts();

  enableFlutterDriverExtension();
  runApp(
    ChangeNotifierProvider(
      create: (context) => _model,
      child: ShrineApp(),
    )
  );
}
