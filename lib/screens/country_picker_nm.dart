import 'package:flutter/material.dart';
import 'package:flutter_country_picker_nm/flutter_country_picker_nm.dart';

import 'home.dart';

class CountryPickerScreen extends StatefulWidget {
  const CountryPickerScreen({super.key});

  @override
  State<CountryPickerScreen> createState() => _CountryPickerScreenState();
}

class _CountryPickerScreenState extends State<CountryPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: CountryPicker(
              onChanged: (value) {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return HomeScreen();
                })));
              },
              dense: false,
              showFlag: true, //displays flag, true by default
              showDialingCode: false, //displays dialing code, false by default
              showName: true, //displays country name, true by default
              showCurrency: false, //eg. 'British pound'
              showCurrencyISO: true)),
    );
  }
}
