import 'dart:convert';

import 'package:mvp/apiKey.dart';

import 'package:http/http.dart' as http;

import 'package:mvp/data/presenter/crypto_model.dart';
import 'package:mvp/data/presenter/crypto_model_abstract.dart';

class ProdCryptoRepository implements CryptoRepository {
  @override
  Future<List<CryptoModel>> fetchCurrencies() async {
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
}
