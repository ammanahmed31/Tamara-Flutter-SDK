import '../models/enums.dart';

class TamaraCheckoutPayload {
  final String orderReferenceId; // The unique order id from merchant side, this will be used with the settlement and reports
  final String description; // The description of the order. Limited to 256 characters.
  final CountryCode countryCode; // The country code of the merchant. ISO 3166-1 alpha-2 country code. e.g SA or AE
  final String paymentTypes = 'PAY_BY_INSTALMENTS'; // The payment types that the merchant accepts. Only one value 'PAY_BY_INSTALMENTS'
  final String locale; // The language of the checkout page. ISO 639-1 language code. e.g en or ar
  final Amount totalAmount; // The total amount of the order.
  final Amount taxAmount; // The total amount of the tax.
  final Amount shippingAmount; // The total amount of the shipping.
  final MerchantUrl merchantUrls; // The merchant urls for the checkout page.
  final TamaraShippingAddress shippingAddress; // The shipping address of the order.
  final Consumer consumer; // The consumer information.
  final List<TamaraItem> items; // The items of the order.

  TamaraCheckoutPayload({
    required this.orderReferenceId,
    required this.description,
    required this.countryCode,
    required this.locale,
    required this.totalAmount,
    required this.taxAmount,
    required this.shippingAmount,
    required this.merchantUrls,
    required this.shippingAddress,
    required this.consumer,
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return {
      'order_reference_id': orderReferenceId,
      'description': description,
      'country_code': countryCode.displayName,
      'payment_type': paymentTypes,
      'locale': locale,
      'total_amount': totalAmount.toMap(),
      'tax_amount': taxAmount.toMap(),
      'shipping_amount': shippingAmount.toMap(),
      'merchant_url': merchantUrls.toJson(),
      'shipping_address': shippingAddress.toJson(),
      'consumer': consumer.toJson(),
      'items': items.map((x) => x.toJson()).toList(),
    };
  }
}

class Amount {
  final double value;
  final TamaraCurrency currency;

  Amount({
    required this.value,
    required this.currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'currency': currency.displayName,
    };
  }
}

class MerchantUrl {
  String success;
  String failure;
  String cancel;
  String notification;

  MerchantUrl({
    required this.success,
    required this.failure,
    required this.cancel,
    required this.notification,
  });

  Map<String, dynamic> toJson() => {
        "success": success,
        "failure": failure,
        "cancel": cancel,
        "notification": notification,
      };
}

class TamaraShippingAddress {
  String firstName;
  String lastName;
  String line1;
  String? line2;
  String? region;
  String? postalCode;
  String city;
  String countryCode;
  String? phoneNumber;

  TamaraShippingAddress({
    required this.firstName,
    required this.lastName,
    required this.line1,
    this.line2,
    this.region,
    this.postalCode,
    required this.city,
    required this.countryCode,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "line1": line1,
        if (line2 != null) "line2": line2,
        if (region != null) "region": region,
        if (postalCode != null) "postal_code": postalCode,
        "city": city,
        "country_code": countryCode,
        if (phoneNumber != null) "phone_number": phoneNumber,
      };
}

class Consumer {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;

  Consumer({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "email": email,
      };
}

class TamaraItem {
  String referenceId;
  String type;
  String name;
  String sku;
  String? imageUrl;
  String? itemUrl;
  int quantity;
  Amount? unitPrice;
  Amount? discountAmount;
  Amount? taxAmount;
  Amount totalAmount;

  TamaraItem({
    required this.referenceId,
    required this.type,
    required this.name,
    required this.sku,
    this.imageUrl,
    this.itemUrl,
    required this.quantity,
    this.unitPrice,
    this.discountAmount,
    this.taxAmount,
    required this.totalAmount,
  });

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "type": type,
        "name": name,
        "sku": sku,
        if (imageUrl != null) "image_url": imageUrl,
        if (imageUrl != null) "item_url": itemUrl,
        "quantity": quantity,
        if (imageUrl != null) "unit_price": unitPrice?.toMap(),
        if (imageUrl != null) "discount_amount": discountAmount?.toMap(),
        if (imageUrl != null) "tax_amount": taxAmount?.toMap(),
        "total_amount": totalAmount.toMap(),
      };
}

class TamaraSession {
  String? orderId;
  String? checkoutId;
  String? checkoutUrl;
  String? status;

  TamaraSession({required this.orderId, required this.checkoutId, required this.checkoutUrl, required this.status});

  factory TamaraSession.fromJson(Map<String, dynamic> json) {
    return TamaraSession(
      orderId: json.containsKey('order_id') ? json['order_id'] : null,
      checkoutId: json.containsKey('checkout_id') ? json['checkout_id'] : null,
      checkoutUrl: json.containsKey('checkout_url') ? json['checkout_url'] : null,
      status: json.containsKey('status') ? json['status'] : null,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TamaraSession && runtimeType == other.runtimeType && orderId == other.orderId && checkoutId == other.checkoutId && checkoutUrl == other.checkoutUrl && status == other.status;

  @override
  int get hashCode => orderId.hashCode ^ checkoutId.hashCode ^ checkoutUrl.hashCode ^ status.hashCode;
}
