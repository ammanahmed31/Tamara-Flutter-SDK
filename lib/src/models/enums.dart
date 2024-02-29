enum Lang { en, ar }

enum Currency { aed, sar }

enum CountryCode { sa, ae }

extension CurrencyExt on Currency {
  String get displayName {
    switch (this) {
      case Currency.aed:
        return 'AED';
      case Currency.sar:
        return 'SAR';
    }
  }

  int get decimals {
    switch (this) {
      case Currency.aed:
        return 2;
      case Currency.sar:
        return 2;
    }
  }
}

extension LangExt on Lang {
  String get displayName {
    switch (this) {
      case Lang.en:
        return 'en_US';
      case Lang.ar:
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
