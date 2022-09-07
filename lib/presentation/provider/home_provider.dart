import 'package:currency/data/models/currency_model.dart';
import 'package:currency/doman/usecases/currency_use_case.dart';
import 'package:flutter/cupertino.dart';

class HomePageViewModel extends ChangeNotifier {
  CurrencyUseCase currencyUseCase;

  HomePageViewModel(this.currencyUseCase);

  List<CurrencyModel> data = [];

  getData() async {
    List<CurrencyModel> data = await currencyUseCase.getData();
    this.data.clear();
    this.data.addAll(data);
    notifyListeners();
  }
}
