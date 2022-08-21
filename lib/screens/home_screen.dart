import 'dart:convert';

import 'package:currency/core/colors.dart';
import 'package:currency/core/strings.dart';
import 'package:currency/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    getData();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.arrow_back_outlined,
              color: Colors.black, size: 28),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.search_rounded,
                color: Colors.black, size: 28),
          ),
          const SizedBox(width: 20),
        ],
        title: const Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (_, AsyncSnapshot<List<CurrencyModel>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            } else if (snapshot.hasError) {
              print("---------> ${snapshot.error}");
            }
            List<CurrencyModel> data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, index) {
                return buildList(
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

  Container buildList({
    String? code = '',
    String? cbPrice = '',
    String? nbuBuyPrice = '',
    String? nbuCellPrice = '',
  }) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade100,
                blurRadius: 20,
                spreadRadius: 1,
                offset: const Offset(0, 0))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                      fit: BoxFit.fitHeight,
                      height: 30,
                      image: AssetImage('assets/icons/ic_$code.png')),
                  const SizedBox(width: 12),
                  Text(
                    code!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Icon(
                Icons.notifications_active_outlined,
                color: Colors.grey.shade400,
                size: 30,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildPosition(nbuBuy, nbuBuyPrice!),
              _buildPosition(stablePrice, cbPrice!),
              _buildPosition(nbuCell, nbuCellPrice!),
            ],
          )
        ],
      ),
    );
  }

  Padding _buildPosition(String title, String cur) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 2),
          Text(
            cur,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
