import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvp/crypto_mode.dart';

class Home_Page extends StatefulWidget {
  final List currencies;
  Home_Page({Key? key, required this.currencies}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Tracker'),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: widget.currencies.length,
              itemBuilder: (context, index) {
                final CryptoModel currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItem(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItem(CryptoModel currency, MaterialColor color) {
    final String name = currency.name ?? '';
    final String price = currency.quote?.uSD?.price.toString() ?? '';
    final String percentChange =
        currency.quote?.uSD?.percentChange1h.toString() ?? '';
    print("price: $price, percentChange: $percentChange");
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(name[0]),
      ),
      title: Text(
        currency.name ?? 'N/A',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(price, percentChange),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String priceUSD, String percentageChange) {
    TextSpan priceTextWidget = TextSpan(
      text: "\$$priceUSD\n",
      style: TextStyle(color: Colors.black),
    );

    if (percentageChange.isNotEmpty &&
        double.tryParse(percentageChange) != null) {
      double changeValue = double.parse(percentageChange);

      String percentageChangeText = "1h: $percentageChange%";
      TextSpan percentageChangeTextWidget;

      if (changeValue > 0) {
        percentageChangeTextWidget = TextSpan(
          text: percentageChangeText,
          style: TextStyle(color: Colors.green),
        );
      } else {
        percentageChangeTextWidget = TextSpan(
          text: percentageChangeText,
          style: TextStyle(color: Colors.red),
        );
      }

      return RichText(
        text: TextSpan(children: [priceTextWidget, percentageChangeTextWidget]),
      );
    } else {
      // Handle the case where percentageChange is not a valid numeric string
      return RichText(
        text: priceTextWidget,
      );
    }
  }
}
