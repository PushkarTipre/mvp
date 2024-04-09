import 'package:mvp/data/presenter/crypto_model.dart';
import 'package:mvp/data/presenter/crypto_model_abstract.dart';

class MockCryptoRepository implements CryptoRepository {
  @override
  Future<List<CryptoModel>> fetchCurrencies() {
    return Future.value(currencies);
  }

  var currencies = <CryptoModel>[
    CryptoModel(
        name: 'Bitcoin',
        quote: Quote(uSD: USD(price: 900.654, percentChange1h: 10.0))),
    CryptoModel(
        name: 'Ethereum',
        quote: Quote(uSD: USD(price: 700.038, percentChange1h: -15.0))),
    CryptoModel(
        name: 'Solana',
        quote: Quote(uSD: USD(price: 6000.220, percentChange1h: 16.0)))
  ];
}
