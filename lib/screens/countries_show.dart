import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:covid_tacker/models/countries.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:shimmer/shimmer.dart';

import 'country_data.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<CountriesModel> countriesList = [];
  Future<List<CountriesModel>> getCountries() async {
    Uri uri = Uri.parse("https://disease.sh/v3/covid-19/countries");
    http.Response response = await http.get(uri);
    var decodeBody = jsonDecode(response.body) as List;
    for (int i = 0; i < decodeBody.length; i++) {
      CountriesModel obj = CountriesModel.fromJson(decodeBody[i]);

      countriesList.add(obj);
    }

    return countriesList;
  }

  List<CountriesModel> searchCountry = [];

  @override
  // void initState() {
  //   // TODO: implement initState
  //   searchCountry = countriesList;
  //   super.initState();
  // }

  search(String value) {
    for (var i = 0; i < countriesList.length; i++) {
      if (value == countriesList[i].country) {
        CountriesModel obj = countriesList[i];
        searchCountry.add(obj);
        break;
      } else if (value == "") {
        searchCountry = countriesList;
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController seacrhController = new TextEditingController();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 49, 49, 49),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
            child: TextFormField(
                onFieldSubmitted: (value) {
                  setState(() {
                    search(seacrhController.text);
                  });
                },
                controller: seacrhController,
                cursorColor: Colors.white,
                style: TextStyle(fontSize: 18, color: Colors.white),
                decoration: InputDecoration(
                    constraints: BoxConstraints(maxHeight: height * 0.06),
                    hintText: 'Search with country name',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    labelStyle: TextStyle(fontSize: 24, color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(width: 1, color: Colors.grey)))),
          ),
          FutureBuilder<List<CountriesModel>>(
              future: getCountries(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<CountriesModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          backgroundColor: Colors.green,
                          color: Colors.grey,
                        ),
                        Text(
                          "Loading...",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  return searchCountry.isEmpty
                      ? ListView.builder(
                          itemCount: snapshot.data!.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            CountriesModel countrydetail =
                                snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return CountryDataScreen(
                                    detail: countrydetail,
                                  );
                                }));
                              },
                              child: Container(
                                width: width,
                                margin: EdgeInsets.only(
                                    top: height * 0.03, left: width * 0.05),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.05,
                                      width: width * 0.15,
                                      child: Image.network(
                                        countrydetail.countryInfo.flag,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                      // color: Colors.blue,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              countrydetail.country,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: height * 0.007),
                                            child: Text(
                                              countrydetail.cases.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                      : ListView.builder(
                          itemCount: searchCountry.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            CountriesModel countrydetail = searchCountry[index];
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) {
                                  return CountryDataScreen(
                                    detail: countrydetail,
                                  );
                                }));
                              },
                              child: Container(
                                width: width,
                                margin: EdgeInsets.only(
                                    top: height * 0.03, left: width * 0.05),
                                child: Row(
                                  children: [
                                    Container(
                                      height: height * 0.05,
                                      width: width * 0.15,
                                      child: Image.network(
                                        countrydetail.countryInfo.flag,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.05,
                                    ),
                                    Container(
                                      // color: Colors.blue,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Text(
                                              countrydetail.country,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: height * 0.007),
                                            child: Text(
                                              countrydetail.cases.toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error"),
                  );
                }
                return Container();
              }),
        ]),
      ),
    );
  }
}
