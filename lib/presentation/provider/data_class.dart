import 'package:currency/service/service_class.dart';
import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier {
  getData() {
    return Service.fetchResult();
  }
}
