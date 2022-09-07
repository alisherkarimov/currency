
import '../../data/models/currency_model.dart';

abstract class CurrencyUseCase{
  Future<List<CurrencyModel>> getData();
}