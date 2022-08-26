
import 'package:currency/core/colors.dart';
import 'package:currency/core/icons.dart';
import 'package:currency/core/strings.dart';
import 'package:flutter/material.dart';

Container buildCurrencyList({
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
            notificationIcon
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
        Text(title, style: const TextStyle(color: currencyTitleColor)),
        const SizedBox(height: 2),
        Text(
          cur,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}
