import 'package:flutter/cupertino.dart';
import 'package:rocio_app/pages/crop/crop.dart';
import 'package:rocio_app/pages/login/login.dart';
import 'package:rocio_app/pages/report/report.dart';
import 'package:rocio_app/pages/sensor/link_sensor.dart';
import 'package:rocio_app/pages/sensor/sensor.dart';
import 'package:rocio_app/pages/signup/signup.dart';
import 'package:rocio_app/pages/field/field.dart';
import 'package:rocio_app/pages/field/create_field.dart';
import 'package:rocio_app/pages/crop/create_crop.dart';
import 'package:rocio_app/pages/sprinkler/link_sprinkler.dart';
import 'package:rocio_app/pages/sprinkler/sprinkler.dart';

final Map<String, WidgetBuilder> routes = {
  '/login': (BuildContext context) => LoginPage(),
  '/signup': (BuildContext context) => SignupPage(),
  '/field': (BuildContext context) => const FieldPage(),
  '/field/create': (BuildContext context) => const CreateFieldPage(),
  '/crop/create': (BuildContext context) => const CreateCropPage(),
  '/crop': (BuildContext context) => const CropPage(),
  '/sensor': (BuildContext context) => const SensorPage(),
  '/sprinkles': (BuildContext context) => const SprinklerPage(),
  '/sprinkles/link': (BuildContext context) => const LinkSprinklerPage(),
  '/report': (BuildContext context) => const ReportPage(),
  '/sensor/link': (BuildContext context) => const LinkSensorPage()
};
