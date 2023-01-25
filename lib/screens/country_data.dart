import 'package:covid_tacker/models/countries.dart';
import 'package:flutter/material.dart';

class CountryDataScreen extends StatefulWidget {
  final CountriesModel detail;
  const CountryDataScreen({super.key, required this.detail});

  @override
  State<CountryDataScreen> createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      appBar: AppBar(
        title: Text(widget.detail.country),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 65, 65, 65),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Column(children: [
            Container(
              width: width,
              margin: EdgeInsets.only(top: height * 0.25),
              color: Color.fromARGB(255, 65, 65, 65),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Cases",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.cases.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 85, 84, 84),
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
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.recovered.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 85, 84, 84),
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
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.deaths.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 85, 84, 84),
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
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.active.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 85, 84, 84),
                    thickness: 1,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "Critical",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.critical.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    indent: 0,
                    endIndent: 0,
                    color: Color.fromARGB(255, 85, 84, 84),
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
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(child: Center()),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.detail.todayRecovered.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: height * 0.21,
                ),
                width: width * 0.3,
                height: height * 0.08,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Image.network(widget.detail.countryInfo.flag),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
