import 'package:currency/core/colors.dart';
import 'package:currency/core/icons.dart';
import 'package:currency/core/strings.dart';
import 'package:currency/models/currency_model.dart';
import 'package:currency/presentation/provider/data_class.dart';
import 'package:currency/presentation/widgets/build_currency_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
          },
          child: arrowBackIcon,
        ),
        actions: [
          GestureDetector(onTap: () {}, child: searchIcon),
          const SizedBox(width: 20),
        ],
        title: const Text(
          appBarTitle,
          style: TextStyle(color: appBarTitleColor),
        ),
      ),
      body: FutureBuilder(
          future: context.read<DataClass>().getData(), //fetchResult(),
          builder: (_, AsyncSnapshot<List<CurrencyModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (snapshot.hasError) {
              if (kDebugMode) {
                print("---------> ${snapshot.error}");
              }
            }
            List<CurrencyModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return buildCurrencyList(
                  code: data[index].code,
                  nbuCellPrice: data[index].nbuCellPrice,
                  nbuBuyPrice: data[index].nbuBuyPrice,
                  cbPrice: data[index].cbPrice,
                );
              },
            );
          }),
    );
  }
}
