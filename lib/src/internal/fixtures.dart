import '../models/enums.dart';
import '../models/models.dart';

final defaultMerchantUrls = MerchantUrl(
  success: 'https://checkout.tabby.ai/success.html',
  failure: 'https://checkout.tabby.ai/failure.html',
  cancel: 'https://checkout.tabby.ai/cancel.html',
  notification: 'https://checkout.tabby.ai/notification.html',
);

final snippetWebUrls = <TamaraLang, String>{
  TamaraLang.en:
      'https://cdn.tamara.co/widget/tamara-introduction.html?colorType=default&showBorder=true&paymentType=installment&numberOfInstallments=3&disableInstallment=false&disablePaylater=true&widgetType=product-widget',
  TamaraLang.ar:
      'https://cdn.tamara.co/widget/tamara-introduction.html?colorType=default&showBorder=true&paymentType=installment&numberOfInstallments=3&disableInstallment=false&disablePaylater=true&widgetType=product-widget',
};
