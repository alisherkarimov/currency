import 'package:currency/doman/repositories/currency_repository.dart';

import '../../data/models/currency_model.dart';
import 'currency_use_case.dart';

class CurrencyUseCaseImpl extends CurrencyUseCase {
  CurrencyRepository currencyRepository;

  CurrencyUseCaseImpl(this.currencyRepository);

  @override
  Future<List<CurrencyModel>> getData() {
    return currencyRepository.getData();
  }
}
