// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../models/enums.dart';

void printError(Object error, StackTrace stackTrace) {
  debugPrint('Exception: $error');
  debugPrint('StackTrace: $stackTrace');
}

List<String> getLocalStrings({
  required String price,
  required Currency currency,
  required Lang lang,
}) {
  final fullPrice = (double.parse(price) / 4).toStringAsFixed(currency.decimals);
  if (lang == Lang.ar) {
    return ['أو قسّمها على 4 دفعات شهرية بقيمة ', fullPrice, ' ${currency.displayName} ', 'بدون رسوم أو فوائد. ', 'لمعرفة المزيد'];
  } else {
    return ['or 4 interest-free payments of ', fullPrice, ' ${currency.displayName}', '. ', 'Learn more'];
  }
}

const space = ' ';

String getPrice({
  required String price,
  required Currency currency,
}) {
  final installmentPrice = (double.parse(price) / 4).toStringAsFixed(currency.decimals);
  return installmentPrice;
}
