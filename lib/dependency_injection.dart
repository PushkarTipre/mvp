import 'package:mvp/data/crypto_mock_repository.dart';
import 'package:mvp/data/crypto_model_abstract.dart';

import 'package:mvp/data/crypto_prod_repository.dart';

enum Flavour { MOCK, PRODUCTION }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavour _flavour = Flavour.MOCK;

  static void configure(Flavour flavour) {
    _flavour = flavour;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  // CryptoRepository get cryptoRepository {
  //   switch (_flavour) {
  //     case Flavour.MOCK:
  //       return MockCryptoRepository();
  //     default:
  //       return ProdCryptoRepository();
  //   }
  // }
  CryptoRepository get cryptoRepository {
    switch (_flavour) {
      case Flavour.MOCK:
        return MockCryptoRepository();
      default:
        return ProdCryptoRepository();
    }
  }
}
