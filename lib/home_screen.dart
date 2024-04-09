import 'package:flutter/material.dart';
import 'package:mvp/data/crypto_model.dart';

import 'package:mvp/modules/crypto_presenter/crypto_presenter.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> implements CryptoListView {
  List<CryptoModel> currencies = [];
  late CryptoListPresenter _presenter;

  final List<Color> _colors = [Colors.blue, Colors.indigo, Colors.red];
  _Home_PageState() {
    _presenter = CryptoListPresenter(this);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _presenter.LoadCurrency();
  }

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
              itemCount: currencies.length,
              itemBuilder: (context, index) {
                final CryptoModel currency = currencies[index];
                final Color color = _colors[index % _colors.length];

                return _getListItem(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItem(CryptoModel currency, Color color) {
    final String name = currency.name ?? '';
    final String price = currency.quote?.uSD?.price?.toStringAsFixed(5) ?? '';
    final String percentChange =
        currency.quote?.uSD?.percentChange1h.toString() ?? '';
    //  print("price: $price, percentChange: $percentChange");
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
      text: "\$${priceUSD}\n",
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

  @override
  void onLoadCryptoComplete(List<CryptoModel> items) {
    // TODO: implement onLoadCryptoComplete
    setState(() {
      currencies = items;
    });
  }

  @override
  void onLoadCryptoError() {
    // TODO: implement onLoadCryptoError
  }
}
