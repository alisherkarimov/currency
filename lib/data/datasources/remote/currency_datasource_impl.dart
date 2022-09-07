import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/currency_model.dart';
import 'currency_datasource.dart';



class CurrencyDataSourceImpl extends CurrencyDataSource{
  @override
  Future<List<CurrencyModel>> getData() async {
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
