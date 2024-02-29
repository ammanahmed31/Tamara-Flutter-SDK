import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../tamara_sdk_flutter.dart';

const tabbyColor = Color.fromRGBO(221, 196, 146, 1);

typedef TamaraCheckoutCompletion = void Function(WebViewResult resultCode);

final options = InAppWebViewGroupOptions(
  crossPlatform: InAppWebViewOptions(
    incognito: true,
  ),
  ios: IOSInAppWebViewOptions(
    applePayAPIEnabled: true,
    useOnNavigationResponse: true,
  ),
);

class TamaraWebView extends StatefulWidget {
  const TamaraWebView({
    required this.webUrl,
    required this.onResult,
    Key? key,
  }) : super(key: key);

  final String webUrl;
  final TamaraCheckoutCompletion onResult;

  @override
  State<TamaraWebView> createState() => _TamaraWebViewState();

  static void showWebView({
    required BuildContext context,
    required String webUrl,
    required TamaraCheckoutCompletion onResult,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.94,
          child: TamaraWebView(
            webUrl: webUrl,
            onResult: onResult,
          ),
        );
      },
    );
  }
}

class _TamaraWebViewState extends State<TamaraWebView> {
  final GlobalKey webViewKey = GlobalKey();
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_progress < 1) ...[
          LinearProgressIndicator(
            value: _progress,
            color: tabbyColor,
            backgroundColor: Colors.white,
          )
        ],
        Expanded(
          child: InAppWebView(
            key: webViewKey,
            initialUrlRequest: URLRequest(url: Uri.parse(widget.webUrl)),
            initialOptions: options,
            onProgressChanged: (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
            iosOnNavigationResponse: (controller, response) async {
              final nextUrl = response.response?.url?.toString() ?? '';
              return iosNavigationResponseHandler(
                onResult: widget.onResult,
                nextUrl: nextUrl,
              );
            },
            onWebViewCreated: (controller) async {
              controller.addJavaScriptHandler(
                handlerName: 'tamaraMobileSDK',
                callback: (message) => javaScriptHandler(message, widget.onResult),
              );
            },
          ),
        ),
      ],
    );
  }
}
