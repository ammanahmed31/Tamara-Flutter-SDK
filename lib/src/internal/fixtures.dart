import '../models/enums.dart';
import '../models/models.dart';

final defaultMerchantUrls = MerchantUrl(
  cancel: 'paymentStatus=canceled',
  failure: 'paymentStatus=failed',
  notification: 'paymentStatus=notification',
  success: 'paymentStatus=success',
);

final snippetWebUrls = <TamaraLang, String>{
  TamaraLang.en:
      'https://cdn.tamara.co/widget/tamara-introduction.html?colorType=default&showBorder=true&paymentType=installment&numberOfInstallments=3&disableInstallment=false&disablePaylater=true&widgetType=product-widget',
  TamaraLang.ar:
      'https://cdn.tamara.co/widget/tamara-introduction.html?colorType=default&showBorder=true&paymentType=installment&numberOfInstallments=3&disableInstallment=false&disablePaylater=true&widgetType=product-widget',
};
