import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country {
  String name;
  String nativeName;
  String flag;
  String capital;
  Country({this.name, this.flag, this.capital,this.nativeName});
  factory Country.fromJson(Map<String, dynamic> json) {
    return new Country(
      name: json['name'] as String,
      nativeName: json['nativeName'] as String,
      flag: json['flag'] as String,
      capital: json['capital'] as String,
    );
  }
}

Future<List<Country>> fetchCountry(http.Client client) async {
  final response = await client.get('http://restcountries.eu/rest/v2/all');
  // Use the compute function to run parsePhotos in a separate isolate
  return compute(parseData, response.body);
}

// A function that will convert a response body into a List<Country>
List<Country> parseData(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  List<Country> list =
  parsed.map<Country>((json) => new Country.fromJson(json)).toList();
  return list;
}

class CountyGridView extends StatelessWidget {
  final List<Country> country;

  CountyGridView({Key key, this.country}) : super(key: key);

  Card getStructuredGridCell(Country country) {
    return new Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new SvgPicture.network(
              country.flag.replaceAll('https', 'http'),
              height: 130.0,
              width: 100.0,
              placeholderBuilder: (BuildContext context) => new Container(
                  padding: const EdgeInsets.all(60.0),
                  child: const CircularProgressIndicator()),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(country.name),
                  new Text(country.nativeName),
                  new Text(country.capital),
                ],
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 2,
      childAspectRatio: 0.80,
      children: List.generate(country.length, (index) {
        return getStructuredGridCell(country[index]);
      }),
    );
  }
}
