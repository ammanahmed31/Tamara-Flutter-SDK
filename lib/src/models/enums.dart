enum TamaraLang { en, ar }

enum TamaraCurrency { aed, sar }

enum CountryCode { sa, ae }

extension CurrencyExt on TamaraCurrency {
  String get displayName {
    switch (this) {
      case TamaraCurrency.aed:
        return 'AED';
      case TamaraCurrency.sar:
        return 'SAR';
    }
  }

  int get decimals {
    switch (this) {
      case TamaraCurrency.aed:
        return 2;
      case TamaraCurrency.sar:
        return 2;
    }
  }
}

extension LangExt on TamaraLang {
  String get displayName {
    switch (this) {
      case TamaraLang.en:
        return 'en_US';
      case TamaraLang.ar:
        return 'ar_SA';
    }
  }
}

extension CountryExt on CountryCode {
  String get displayName {
    switch (this) {
      case CountryCode.sa:
        return 'SA';
      case CountryCode.ae:
        return 'AE';
    }
  }
}

enum TamaraPurchaseType {
  installments,
}

extension TabbyPurchaseTypeExt on TamaraPurchaseType {
  String get name {
    switch (this) {
      case TamaraPurchaseType.installments:
        return 'installments';
    }
  }
}

enum OrderHistoryItemStatus {
  newOne,
  processing,
  complete,
  refunded,
  canceled,
  unknown,
}

extension OrderHistoryItemStatusExt on OrderHistoryItemStatus {
  String get name {
    switch (this) {
      case OrderHistoryItemStatus.newOne:
        return 'new';
      case OrderHistoryItemStatus.processing:
        return 'processing';
      case OrderHistoryItemStatus.complete:
        return 'complete';
      case OrderHistoryItemStatus.refunded:
        return 'refunded';
      case OrderHistoryItemStatus.canceled:
        return 'canceled';
      case OrderHistoryItemStatus.unknown:
        return 'unknown';
    }
  }
}

enum OrderHistoryItemPaymentMethod {
  card,
  cod,
}

enum Environment {
  stage,
  production,
}

extension EnvironmentExt on Environment {
  String get host {
    switch (this) {
      case Environment.stage:
        return 'https://api-sandbox.tamara.co/';
      case Environment.production:
        return 'https://api.tamara.co/';
    }
  }
}

enum WebViewResult {
  close,
  authorized,
  rejected,
  expired,
}
