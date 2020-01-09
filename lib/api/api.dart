import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:crypto_mobx/models/cryptoModel.dart';

class CryptoApi {
  static final String API_URL = 'https://api.nomics.com/v1';
  static final String API_KEY = '5912296aa430ebf2da887b4ea5d4cf80';
  static final String GET_CURRENCIES = '$API_URL/currencies/ticker';

  static Future<CryptoModel> getData(context) async {
    try {
      final response = await http.get('$GET_CURRENCIES?key=$API_KEY'
          '&ids=BTC,ETH,ETC,MTC,LTC,ICO,ETC,XRP'
          '&interval=1d,30d&convert=USD');
      print(response.body);

      if (response.statusCode == 200) {
        return CryptoModel.fromJson(json.decode('{"data":${response.body}}'));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }
}
