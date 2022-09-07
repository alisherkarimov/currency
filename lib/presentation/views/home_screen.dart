import 'package:currency/core/colors.dart';
import 'package:currency/core/icons.dart';
import 'package:currency/core/strings.dart';
import 'package:currency/presentation/provider/home_provider.dart';
import 'package:currency/presentation/widgets/build_currency_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/currency_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context).getData();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
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
      body: Consumer<HomePageViewModel>(builder: (context, data, child) {
        if (data.data.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        } else {
          List<CurrencyModel> dataList = data.data;
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (_, index) {
              return buildCurrencyList(
                code: dataList[index].code,
                nbuCellPrice: dataList[index].nbuCellPrice,
                nbuBuyPrice: dataList[index].nbuBuyPrice,
                cbPrice: dataList[index].cbPrice,
              );
            },
          );
        }
      }),
    );
  }
}
