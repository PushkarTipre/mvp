import 'package:mvp/data/presenter/crypto_model.dart';

abstract class CryptoRepository {
  Future<List<CryptoModel>> fetchCurrencies();
}
