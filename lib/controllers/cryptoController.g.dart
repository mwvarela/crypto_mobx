// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptoController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CryptoController on _CryptoControllerBase, Store {
  final _$cryptoDataAtom = Atom(name: '_CryptoControllerBase.cryptoData');

  @override
  List<CryptoData> get cryptoData {
    _$cryptoDataAtom.context.enforceReadPolicy(_$cryptoDataAtom);
    _$cryptoDataAtom.reportObserved();
    return super.cryptoData;
  }

  @override
  set cryptoData(List<CryptoData> value) {
    _$cryptoDataAtom.context.conditionallyRunInAction(() {
      super.cryptoData = value;
      _$cryptoDataAtom.reportChanged();
    }, _$cryptoDataAtom, name: '${_$cryptoDataAtom.name}_set');
  }

  final _$_CryptoControllerBaseActionController =
      ActionController(name: '_CryptoControllerBase');

  @override
  void changeCryptoData(List<CryptoData> value) {
    final _$actionInfo = _$_CryptoControllerBaseActionController.startAction();
    try {
      return super.changeCryptoData(value);
    } finally {
      _$_CryptoControllerBaseActionController.endAction(_$actionInfo);
    }
  }
}
