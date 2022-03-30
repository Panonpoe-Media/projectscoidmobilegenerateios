// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionConfirmPaymentMyOrders _$ModelActionConfirmPaymentMyOrdersFromJson(
        Map<String, dynamic> json) =>
    ModelActionConfirmPaymentMyOrders(
      json['id'] as String?,
      json['order_id'] as String?,
      json['our_account_id'] as int?,
      json['our_account_str'] as String?,
      (json['our_account_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['our_account_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['bank_id'] as int?,
      json['bank_str'] as String?,
      (json['bank_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['bank_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['account_no'] as String?,
      json['account_name'] as String?,
      json['transfer_date'] == null
          ? null
          : DateTime.parse(json['transfer_date'] as String),
      (json['amount'] as num?)?.toDouble(),
      json['message'] as String?,
      json['attachment'] == null
          ? null
          : Photo.fromJson(json['attachment'] as Map<String, dynamic>),
      json['attachment_url'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionConfirmPaymentMyOrdersToJson(
        ModelActionConfirmPaymentMyOrders instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'order_id': instance.order_id,
      'our_account_id': instance.our_account_id,
      'our_account_str': instance.our_account_str,
      'our_account_list': instance.our_account_list,
      'our_account_list_str': instance.our_account_list_str,
      'bank_id': instance.bank_id,
      'bank_str': instance.bank_str,
      'bank_list': instance.bank_list,
      'bank_list_str': instance.bank_list_str,
      'account_no': instance.account_no,
      'account_name': instance.account_name,
      'transfer_date': instance.transfer_date?.toIso8601String(),
      'amount': instance.amount,
      'message': instance.message,
      'attachment_url': instance.attachment_url,
      'attachment': instance.attachment,
    };

ConfirmPaymentMyOrdersSuperBase _$ConfirmPaymentMyOrdersSuperBaseFromJson(
        Map<String, dynamic> json) =>
    ConfirmPaymentMyOrdersSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ModelActionConfirmPaymentMyOrders.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfirmPaymentMyOrdersSuperBaseToJson(
        ConfirmPaymentMyOrdersSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelMyOrders _$ModelMyOrdersFromJson(Map<String, dynamic> json) =>
    ModelMyOrders(
      json['id'] as String?,
      json['order_id'] as String?,
      json['buyer_id'] as int?,
      json['buyer_str'] as String?,
      (json['buyer_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['buyer_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['payment_method_id'] as int?,
      json['payment_method_str'] as String?,
      (json['payment_method_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['payment_method_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['buyer_payment_id'] as int?,
      json['buyer_payment_str'] as String?,
      (json['buyer_payment_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['buyer_payment_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
      (json['coupon_value'] as num?)?.toDouble(),
      json['coupon_value_str'] as String?,
      (json['used_balance'] as num?)?.toDouble(),
      json['used_balance_str'] as String?,
      (json['total_sum'] as num?)?.toDouble(),
      json['total_sum_str'] as String?,
      (json['unique_code'] as num?)?.toDouble(),
      json['unique_code_str'] as String?,
      json['cimb_ref'] as int?,
      json['cimb_ref_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..track_code = json['track_code'] as String?
      ..buyer_url = json['buyer_url'] as String?
      ..date =
          json['date'] == null ? null : DateTime.parse(json['date'] as String)
      ..buyer_payment_url = json['buyer_payment_url'] as String?
      ..coupon = json['coupon'] as String?
      ..table = json['table'] as String?
      ..notes = json['notes'] as String?
      ..is_test = json['is_test'] as bool?;

Map<String, dynamic> _$ModelMyOrdersToJson(ModelMyOrders instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'order_id': instance.order_id,
      'track_code': instance.track_code,
      'buyer_id': instance.buyer_id,
      'buyer_url': instance.buyer_url,
      'buyer_str': instance.buyer_str,
      'buyer_list': instance.buyer_list,
      'buyer_list_str': instance.buyer_list_str,
      'date': instance.date?.toIso8601String(),
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'payment_method_id': instance.payment_method_id,
      'payment_method_str': instance.payment_method_str,
      'payment_method_list': instance.payment_method_list,
      'payment_method_list_str': instance.payment_method_list_str,
      'buyer_payment_id': instance.buyer_payment_id,
      'buyer_payment_url': instance.buyer_payment_url,
      'buyer_payment_str': instance.buyer_payment_str,
      'buyer_payment_list': instance.buyer_payment_list,
      'buyer_payment_list_str': instance.buyer_payment_list_str,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'coupon': instance.coupon,
      'coupon_value': instance.coupon_value,
      'coupon_value_str': instance.coupon_value_str,
      'used_balance': instance.used_balance,
      'used_balance_str': instance.used_balance_str,
      'total_sum': instance.total_sum,
      'total_sum_str': instance.total_sum_str,
      'unique_code': instance.unique_code,
      'unique_code_str': instance.unique_code_str,
      'table': instance.table,
      'notes': instance.notes,
      'cimb_ref': instance.cimb_ref,
      'cimb_ref_str': instance.cimb_ref_str,
      'is_test': instance.is_test,
    };

MyOrdersSuperBase _$MyOrdersSuperBaseFromJson(Map<String, dynamic> json) =>
    MyOrdersSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ModelMyOrders.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyOrdersSuperBaseToJson(MyOrdersSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelMyOrders _$ViewModelMyOrdersFromJson(Map<String, dynamic> json) =>
    ViewModelMyOrders(
      json['id'] as String?,
      json['track_code'] as String?,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['payment_method_id'] as int?,
      json['payment_method_str'] as String?,
      (json['payment_method_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['payment_method_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['total_price'] as num?)?.toDouble(),
      json['total_price_str'] as String?,
      (json['used_balance'] as num?)?.toDouble(),
      json['used_balance_str'] as String?,
      (json['total_sum'] as num?)?.toDouble(),
      json['total_sum_str'] as String?,
      json['table'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyOrdersToJson(ViewModelMyOrders instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'track_code': instance.track_code,
      'date': instance.date?.toIso8601String(),
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'payment_method_id': instance.payment_method_id,
      'payment_method_str': instance.payment_method_str,
      'payment_method_list': instance.payment_method_list,
      'payment_method_list_str': instance.payment_method_list_str,
      'total_price': instance.total_price,
      'total_price_str': instance.total_price_str,
      'used_balance': instance.used_balance,
      'used_balance_str': instance.used_balance_str,
      'total_sum': instance.total_sum,
      'total_sum_str': instance.total_sum_str,
      'table': instance.table,
    };

MyOrdersViewSuperBase _$MyOrdersViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyOrdersViewSuperBase(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['model'] == null
          ? null
          : ViewModelMyOrders.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyOrdersViewSuperBaseToJson(
        MyOrdersViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyOrdersListingTools _$MyOrdersListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyOrdersListingTools(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ItemMyOrders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersListingToolsToJson(
        MyOrdersListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };

MyOrdersIndexTools _$MyOrdersIndexToolsFromJson(Map<String, dynamic> json) =>
    MyOrdersIndexTools(
      json['id'] as String?,
      (json['buttons'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Button.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['paging'] == null
          ? null
          : Paging.fromJson(json['paging'] as Map<String, dynamic>),
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ItemIndexMyOrders.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersIndexToolsToJson(MyOrdersIndexTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
