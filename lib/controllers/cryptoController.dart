import 'package:crypto_mobx/models/cryptoModel.dart';
import 'package:mobx/mobx.dart';
part 'cryptoController.g.dart';

class CryptoController = _CryptoControllerBase with _$CryptoController;

abstract class _CryptoControllerBase with Store {
  @observable
  List<CryptoData> cryptoData;

  @action
  void changeCryptoData(List<CryptoData> value) => cryptoData = value;
}
