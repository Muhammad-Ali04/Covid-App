import 'package:covid_tacker/screens/countries_show.dart';
import 'package:covid_tacker/screens/country_data.dart';
import 'package:covid_tacker/screens/country_picker_nm.dart';
import 'package:covid_tacker/screens/home.dart';
import 'package:covid_tacker/screens/shimmer_use.dart';
import 'package:covid_tacker/screens/splash.dart';
import 'package:covid_tacker/widgets/button.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
