import 'package:mvp/data/crypto_model.dart';
import 'package:mvp/data/crypto_model_abstract.dart';

import 'package:mvp/dependency_injection.dart';

abstract class CryptoListView {
  void onLoadCryptoComplete(List<CryptoModel> items);
  void onLoadCryptoError();
}

class CryptoListPresenter {
  final CryptoListView _view;
  late CryptoRepository _repository;

  CryptoListPresenter(this._view) {
    _repository = Injector().cryptoRepository;
  }

  void LoadCurrency() {
    _repository
        .fetchCurrencies()
        .then((c) => _view.onLoadCryptoComplete(c))
        .catchError((onError) => _view.onLoadCryptoError());
  }
}
