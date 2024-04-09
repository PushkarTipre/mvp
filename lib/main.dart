import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mvp/crypto_mode.dart';
import 'package:mvp/home_screen.dart';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCryptoPrices();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget {
  final List _currencies;

  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
        home: Home_Page(
          currencies: _currencies,
        ));
  }
}

Future<List<CryptoModel>> getCryptoPrices() async {
  String apiKey = 'd29ce175-7536-4d1e-aff6-2c5a869bcc4d';
  String cryptoUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  final response = await http.get(
    Uri.parse(cryptoUrl),
    headers: {
      'X-CMC_PRO_API_KEY': apiKey,
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> dataList = json.decode(response.body)['data'];
    var cryptoList =
        dataList.map((json) => CryptoModel.fromJson(json)).toList();
    return cryptoList;
  } else {
    // If the response is not successful, throw an error or return an empty list
    throw Exception('Failed to load crypto prices');
    // return []; // You may choose to return an empty list instead of throwing an error
  }
}
