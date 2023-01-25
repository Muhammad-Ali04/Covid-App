import 'dart:convert';

import 'package:covid_tacker/models/global_model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:country_picker/country_picker.dart';
import '../widgets/button.dart';
import 'countries_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colorList = [
    Color.fromARGB(255, 24, 146, 240),
    Color.fromARGB(255, 23, 161, 92),
    Color.fromARGB(255, 252, 66, 53)
  ];

  Future<GlobalModel> globalData() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/all");
    http.Response response = await http.get(uri);
    var decodeBody = jsonDecode(response.body);

    GlobalModel obj = GlobalModel.fromJson(decodeBody);

    return obj;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 49, 49, 49),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder<GlobalModel>(
                    future: globalData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<GlobalModel> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          child: Center(
                            child: CircularProgressIndicator(
                                color: Color.fromARGB(255, 0, 166, 91),
                                backgroundColor: Colors.cyanAccent),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height * 0.05),
                              child: PieChart(
                                dataMap: <String, double>{
                                  "Total": double.parse(
                                      snapshot.data!.cases.toString()),
                                  "Recovered": double.parse(
                                      snapshot.data!.recovered.toString()),
                                  "Deaths": double.parse(
                                      snapshot.data!.deaths.toString()),
                                },
                                colorList: colorList,
                                chartType: ChartType.ring,
                                ringStrokeWidth: 13,
                                chartLegendSpacing: 52,
                                chartRadius: width / 3.5,
                                chartValuesOptions: ChartValuesOptions(
                                  showChartValueBackground: true,
                                  showChartValues: true,
                                  showChartValuesInPercentage: true,
                                  showChartValuesOutside: false,
                                  decimalPlaces: 1,
                                ),
                                legendOptions: LegendOptions(
                                    legendPosition: LegendPosition.left,
                                    legendTextStyle:
                                        TextStyle(color: Colors.white)),
                              ),
                            ),
                            Container(
                              width: width,
                              // height: height * 0.48,
                              margin: EdgeInsets.only(
                                  left: width * 0.04,
                                  right: width * 0.04,
                                  top: height * 0.05),
                              color: Color.fromARGB(255, 65, 65, 65),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Expanded(child: Center()),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            snapshot.data!.cases.toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Recovered",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.recovered.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Deaths",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.deaths.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Active",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.active.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Critical",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.critical.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Today Deaths",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.todayDeaths.toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    indent: 0,
                                    endIndent: 0,
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "Today Recoverd",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Expanded(child: Center()),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          snapshot.data!.todayRecovered
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return Container();
                    }),
                Container(
                    margin: EdgeInsets.only(top: height * 0.07),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CountriesScreen();
                        }));
                      },
                      child: CustomButton(
                        title: 'Track Countries',
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
