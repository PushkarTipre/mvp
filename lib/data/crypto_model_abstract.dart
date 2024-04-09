import 'package:mvp/data/crypto_model.dart';

abstract class CryptoRepository {
  Future<List<CryptoModel>> fetchCurrencies();
}
