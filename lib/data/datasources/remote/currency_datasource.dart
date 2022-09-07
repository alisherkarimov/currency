import '../../models/currency_model.dart';

abstract class CurrencyDataSource{
  Future<List<CurrencyModel>> getData();
}