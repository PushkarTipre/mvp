import 'package:mvp/data/crypto_mock_repository.dart';

import 'package:mvp/data/crypto_prod_repository.dart';
import 'package:mvp/data/presenter/crypto_model_abstract.dart';

enum Flavour { MOCK, PRODUCTION }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavour _flavour = Flavour.PRODUCTION;

  static void configure(Flavour flavour) {
    _flavour = flavour;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  CryptoRepository get cryptoRepository {
    switch (_flavour) {
      case Flavour.MOCK:
        return MockCryptoRepository();
      default:
        return ProdCryptoRepository();
    }
  }
}
