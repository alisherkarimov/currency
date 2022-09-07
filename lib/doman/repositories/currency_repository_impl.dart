import '../../data/datasources/remote/currency_datasource_impl.dart';
import '../../data/models/currency_model.dart';
import 'currency_repository.dart';

class CurrencyRepositoryImpl extends CurrencyRepository {
  CurrencyDataSourceImpl service;

  CurrencyRepositoryImpl(this.service);

  @override
  Future<List<CurrencyModel>> getData() {
    return service.getData();
  }
}
