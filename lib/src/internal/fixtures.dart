import '../models/enums.dart';
import '../models/models.dart';

final defaultMerchantUrls = MerchantUrl(
  success: 'https://checkout.tabby.ai/success.html',
  failure: 'https://checkout.tabby.ai/failure.html',
  cancel: 'https://checkout.tabby.ai/cancel.html',
  notification: 'https://checkout.tabby.ai/notification.html',
);

final snippetWebUrls = <TamaraLang, String>{
  TamaraLang.en: 'https://cdn-sandbox.tamara.co/widget-v2/tamara-widget.html?lang=en_US&inline_type=2',
  TamaraLang.ar: 'https://cdn-sandbox.tamara.co/widget-v2/tamara-widget.html?lang=ar_SA&inline_type=1',
};
