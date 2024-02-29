// ignore_for_file: lines_longer_than_80_chars, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../tamara_sdk_flutter.dart';
import '../models/enums.dart';
import 'utils.dart';

class TamaraPresentationSnippet extends StatelessWidget {
  TamaraPresentationSnippet({
    required this.price,
    required this.currency,
    required this.lang,
    this.borderColor = const Color(0xFFD6DED6),
    this.backgroundColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF292929),
    Key? key,
  }) : super(key: key);
  final String price;
  final TamaraCurrency currency;
  final TamaraLang lang;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final browser = ChromeSafariBrowser();

  void openWebBrowser() {
    browser.open(
      url: Uri.parse(
        '${lang == TamaraLang.ar ? snippetWebUrls[1] : snippetWebUrls[0]}?amount=$price&currency=$currency&lang=${lang.displayName}',
      ),
      options: ChromeSafariBrowserClassOptions(
        android: AndroidChromeCustomTabsOptions(shareState: CustomTabsShareState.SHARE_STATE_OFF),
        ios: IOSSafariOptions(
          presentationStyle: IOSUIModalPresentationStyle.POPOVER,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localStrings = getLocalStrings(price: price, currency: currency, lang: lang);
    return GestureDetector(
      onTap: openWebBrowser,
      child: Container(
        constraints: const BoxConstraints(minWidth: 300, maxWidth: 720),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: localStrings[0],
                  style: TextStyle(
                    color: textColor,
                    fontFamily: lang == TamaraLang.ar ? 'Arial' : 'Inter',
                    fontSize: 15,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: localStrings[1],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: localStrings[2],
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: localStrings[3]),
                    TextSpan(
                      text: localStrings[4],
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 16),
              child: Image(
                image: AssetImage(
                  'assets/images/tamara.png',
                  package: 'tamara_sdk_flutter',
                ),
                width: 70,
                height: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
