import 'dart:convert';

import 'package:currency/models/currency_model.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<List<CurrencyModel>> fetchResult() async {
    const String postsURL = "https://nbu.uz/uz/exchange-rates/json/";
    final res = await http.get(Uri.parse(postsURL));
    final body = jsonDecode(res.body);
    if (body is List) {
      return body.map((e) => CurrencyModel.fromJson(e)).toList();
    } else {
      return [].cast<CurrencyModel>();
    }
  }
}
