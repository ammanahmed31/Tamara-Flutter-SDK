// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../tamara_sdk_flutter.dart';

IOSNavigationResponseAction iosNavigationResponseHandler({
  required TamaraCheckoutCompletion onResult,
  required String nextUrl,
}) {
  if (nextUrl.contains(defaultMerchantUrls.cancel)) {
    onResult(TamaraWebViewResult.close);
    return IOSNavigationResponseAction.CANCEL;
  }
  if (nextUrl.contains(defaultMerchantUrls.failure)) {
    onResult(TamaraWebViewResult.rejected);
    return IOSNavigationResponseAction.CANCEL;
  }
  if (nextUrl.contains(defaultMerchantUrls.success)) {
    onResult(TamaraWebViewResult.authorized);
    return IOSNavigationResponseAction.CANCEL;
  }
  onResult(TamaraWebViewResult.rejected);
  return IOSNavigationResponseAction.ALLOW;
}

void javaScriptHandler(
  List<dynamic> message,
  TamaraCheckoutCompletion onResult,
) {
  try {
    log('JavaScriptHandler: $message');
    inspect(message);
    final List<dynamic> events = message.first;
    final msg = events.first as String;
    final resultCode = TamaraWebViewResult.values.firstWhere(
      (value) => value.name == msg.toLowerCase(),
    );
    onResult(resultCode);
  } catch (e, s) {
    printTamaraError(e, s);
  }
}

void printTamaraError(Object error, StackTrace stackTrace) {
  debugPrint('Exception: $error');
  debugPrint('StackTrace: $stackTrace');
}

List<String> getLocalStrings({
  required String price,
  required TamaraCurrency currency,
  required TamaraLang lang,
}) {
  final fullPrice = (double.parse(price) / 4).toStringAsFixed(currency.decimals);
  if (lang == TamaraLang.ar) {
    return ['أو قسّمها على 4 دفعات شهرية بقيمة ', fullPrice, ' ${currency.displayName} ', 'بدون رسوم أو فوائد. ', 'لمعرفة المزيد'];
  } else {
    return ['or 4 interest-free payments of ', fullPrice, ' ${currency.displayName}', '. ', 'Learn more'];
  }
}

const space = ' ';

String getPrice({
  required String price,
  required TamaraCurrency currency,
}) {
  final installmentPrice = (double.parse(price) / 4).toStringAsFixed(currency.decimals);
  return installmentPrice;
}
