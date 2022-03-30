// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_products_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelActionAddNewProductMyProducts _$ModelActionAddNewProductMyProductsFromJson(
        Map<String, dynamic> json) =>
    ModelActionAddNewProductMyProducts(
      json['id'] as String?,
      json['product_id'] as String?,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionAddNewProductMyProductsToJson(
        ModelActionAddNewProductMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'tags_list': instance.tags_list,
      'tags_list_str': instance.tags_list_str,
    };

AddNewProductMyProductsSuperBase _$AddNewProductMyProductsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    AddNewProductMyProductsSuperBase(
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
          : ModelActionAddNewProductMyProducts.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddNewProductMyProductsSuperBaseToJson(
        AddNewProductMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionPublishProductMyProducts
    _$ModelActionPublishProductMyProductsFromJson(Map<String, dynamic> json) =>
        ModelActionPublishProductMyProducts(
          json['id'] as String?,
          json['product_id'] as String?,
          json['logo'] == null
              ? null
              : Photo.fromJson(json['logo'] as Map<String, dynamic>),
          json['logo_url'] as String?,
          json['title'] as String?,
          json['description'] as String?,
          (json['deliverable'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['deliverable_url'] as String?,
          json['deliverable_name'] as String?,
          (json['trial_version'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['trial_version_url'] as String?,
          json['trial_version_name'] as String?,
          (json['price'] as num?)?.toDouble(),
          json['price_str'] as String?,
          (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
          (json['tags_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          (json['tags_url'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionPublishProductMyProductsToJson(
        ModelActionPublishProductMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'price_str': instance.price_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
    };

PublishProductMyProductsSuperBase _$PublishProductMyProductsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    PublishProductMyProductsSuperBase(
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
          : ModelActionPublishProductMyProducts.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublishProductMyProductsSuperBaseToJson(
        PublishProductMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionEditProductMyProducts _$ModelActionEditProductMyProductsFromJson(
        Map<String, dynamic> json) =>
    ModelActionEditProductMyProducts(
      json['id'] as String?,
      json['product_id'] as String?,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionEditProductMyProductsToJson(
        ModelActionEditProductMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'tags_list': instance.tags_list,
      'tags_list_str': instance.tags_list_str,
    };

EditProductMyProductsSuperBase _$EditProductMyProductsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    EditProductMyProductsSuperBase(
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
          : ModelActionEditProductMyProducts.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EditProductMyProductsSuperBaseToJson(
        EditProductMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionBumpUpMyProducts _$ModelActionBumpUpMyProductsFromJson(
        Map<String, dynamic> json) =>
    ModelActionBumpUpMyProducts(
      json['id'] as String?,
      json['product_id'] as String?,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionBumpUpMyProductsToJson(
        ModelActionBumpUpMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'price_str': instance.price_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
    };

BumpUpMyProductsSuperBase _$BumpUpMyProductsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    BumpUpMyProductsSuperBase(
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
          : ModelActionBumpUpMyProducts.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BumpUpMyProductsSuperBaseToJson(
        BumpUpMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionUnlistMyProducts _$ModelActionUnlistMyProductsFromJson(
        Map<String, dynamic> json) =>
    ModelActionUnlistMyProducts(
      json['id'] as String?,
      json['product_id'] as String?,
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionUnlistMyProductsToJson(
        ModelActionUnlistMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'price_str': instance.price_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
    };

UnlistMyProductsSuperBase _$UnlistMyProductsSuperBaseFromJson(
        Map<String, dynamic> json) =>
    UnlistMyProductsSuperBase(
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
          : ModelActionUnlistMyProducts.fromJson(
              json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UnlistMyProductsSuperBaseToJson(
        UnlistMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelActionReactivateProductMyProducts
    _$ModelActionReactivateProductMyProductsFromJson(
            Map<String, dynamic> json) =>
        ModelActionReactivateProductMyProducts(
          json['id'] as String?,
          json['product_id'] as String?,
          json['logo'] == null
              ? null
              : Photo.fromJson(json['logo'] as Map<String, dynamic>),
          json['logo_url'] as String?,
          json['title'] as String?,
          json['description'] as String?,
          (json['deliverable'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['deliverable_url'] as String?,
          json['deliverable_name'] as String?,
          (json['trial_version'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : FileField.fromJson(e as Map<String, dynamic>))
              .toList(),
          json['trial_version_url'] as String?,
          json['trial_version_name'] as String?,
          (json['price'] as num?)?.toDouble(),
          json['price_str'] as String?,
          (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
          (json['tags_str'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
          (json['tags_url'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList(),
        )
          ..age = json['age'] as int?
          ..cnt = json['cnt'] as int?
          ..page = json['page'] as int?
          ..ttl = json['ttl'] as String?
          ..pht = json['pht'] as String?
          ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ModelActionReactivateProductMyProductsToJson(
        ModelActionReactivateProductMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'price_str': instance.price_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
    };

ReactivateProductMyProductsSuperBase
    _$ReactivateProductMyProductsSuperBaseFromJson(Map<String, dynamic> json) =>
        ReactivateProductMyProductsSuperBase(
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
              : ModelActionReactivateProductMyProducts.fromJson(
                  json['model'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$ReactivateProductMyProductsSuperBaseToJson(
        ReactivateProductMyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ModelMyProducts _$ModelMyProductsFromJson(Map<String, dynamic> json) =>
    ModelMyProducts(
      json['id'] as String?,
      json['product_id'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['category_id'] as int?,
      json['category_str'] as String?,
      (json['category_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['category_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_name'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['registered_by_id'] as int?,
      json['registered_by_str'] as String?,
      (json['registered_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['registered_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['verified_by_id'] as int?,
      json['verified_by_str'] as String?,
      (json['verified_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['verified_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['approved_by_id'] as int?,
      json['approved_by_str'] as String?,
      (json['approved_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['approved_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['published_by_id'] as int?,
      json['published_by_str'] as String?,
      (json['published_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['published_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['rejected_by_id'] as int?,
      json['rejected_by_str'] as String?,
      (json['rejected_by_list'] as List<dynamic>?)
          ?.map((e) => e as int?)
          .toList(),
      (json['rejected_by_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['sales_amount'] as num?)?.toDouble(),
      json['sales_amount_str'] as String?,
      json['points'] as int?,
      json['points_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      (json['rating_num'] as num?)?.toDouble(),
      json['rating_num_str'] as String?,
      json['rating_sum'] as int?,
      json['rating_sum_str'] as String?,
      json['rating_div'] as int?,
      json['rating_div_str'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?
      ..seller_url = json['seller_url'] as String?
      ..category_url = json['category_url'] as String?
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..short_description = json['short_description'] as String?
      ..registered_by_url = json['registered_by_url'] as String?
      ..registered_date = json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String)
      ..registered_from_ip = json['registered_from_ip'] as String?
      ..verified_by_url = json['verified_by_url'] as String?
      ..verified_date = json['verified_date'] == null
          ? null
          : DateTime.parse(json['verified_date'] as String)
      ..verified_from_ip = json['verified_from_ip'] as String?
      ..verifier_note = json['verifier_note'] as String?
      ..approved_by_url = json['approved_by_url'] as String?
      ..approved_date = json['approved_date'] == null
          ? null
          : DateTime.parse(json['approved_date'] as String)
      ..approved_from_ip = json['approved_from_ip'] as String?
      ..approver_note = json['approver_note'] as String?
      ..published_by_url = json['published_by_url'] as String?
      ..published_date = json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String)
      ..published_from_ip = json['published_from_ip'] as String?
      ..rejected_by_url = json['rejected_by_url'] as String?
      ..rejected_date = json['rejected_date'] == null
          ? null
          : DateTime.parse(json['rejected_date'] as String)
      ..rejected_from_ip = json['rejected_from_ip'] as String?
      ..admin_note = json['admin_note'] as String?
      ..last_bump = json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String)
      ..rating = json['rating'] as int?;

Map<String, dynamic> _$ModelMyProductsToJson(ModelMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'product_id': instance.product_id,
      'seller_id': instance.seller_id,
      'seller_url': instance.seller_url,
      'seller_str': instance.seller_str,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'logo': instance.logo,
      'logo_url': instance.logo_url,
      'category_id': instance.category_id,
      'category_url': instance.category_url,
      'category_str': instance.category_str,
      'category_list': instance.category_list,
      'category_list_str': instance.category_list_str,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'deliverable_name': instance.deliverable_name,
      'deliverable': instance.deliverable,
      'trial_version_name': instance.trial_version_name,
      'trial_version': instance.trial_version,
      'price': instance.price,
      'price_str': instance.price_str,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'tags_list': instance.tags_list,
      'tags_list_str': instance.tags_list_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'registered_by_id': instance.registered_by_id,
      'registered_by_url': instance.registered_by_url,
      'registered_by_str': instance.registered_by_str,
      'registered_by_list': instance.registered_by_list,
      'registered_by_list_str': instance.registered_by_list_str,
      'registered_date': instance.registered_date?.toIso8601String(),
      'registered_from_ip': instance.registered_from_ip,
      'verified_by_id': instance.verified_by_id,
      'verified_by_url': instance.verified_by_url,
      'verified_by_str': instance.verified_by_str,
      'verified_by_list': instance.verified_by_list,
      'verified_by_list_str': instance.verified_by_list_str,
      'verified_date': instance.verified_date?.toIso8601String(),
      'verified_from_ip': instance.verified_from_ip,
      'verifier_note': instance.verifier_note,
      'approved_by_id': instance.approved_by_id,
      'approved_by_url': instance.approved_by_url,
      'approved_by_str': instance.approved_by_str,
      'approved_by_list': instance.approved_by_list,
      'approved_by_list_str': instance.approved_by_list_str,
      'approved_date': instance.approved_date?.toIso8601String(),
      'approved_from_ip': instance.approved_from_ip,
      'approver_note': instance.approver_note,
      'published_by_id': instance.published_by_id,
      'published_by_url': instance.published_by_url,
      'published_by_str': instance.published_by_str,
      'published_by_list': instance.published_by_list,
      'published_by_list_str': instance.published_by_list_str,
      'published_date': instance.published_date?.toIso8601String(),
      'published_from_ip': instance.published_from_ip,
      'rejected_by_id': instance.rejected_by_id,
      'rejected_by_url': instance.rejected_by_url,
      'rejected_by_str': instance.rejected_by_str,
      'rejected_by_list': instance.rejected_by_list,
      'rejected_by_list_str': instance.rejected_by_list_str,
      'rejected_date': instance.rejected_date?.toIso8601String(),
      'rejected_from_ip': instance.rejected_from_ip,
      'admin_note': instance.admin_note,
      'last_bump': instance.last_bump?.toIso8601String(),
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'sales_amount': instance.sales_amount,
      'sales_amount_str': instance.sales_amount_str,
      'rating': instance.rating,
      'points': instance.points,
      'points_str': instance.points_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'rating_num': instance.rating_num,
      'rating_num_str': instance.rating_num_str,
      'rating_sum': instance.rating_sum,
      'rating_sum_str': instance.rating_sum_str,
      'rating_div': instance.rating_div,
      'rating_div_str': instance.rating_div_str,
    };

MyProductsSuperBase _$MyProductsSuperBaseFromJson(Map<String, dynamic> json) =>
    MyProductsSuperBase(
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
          : ModelMyProducts.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductsSuperBaseToJson(
        MyProductsSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

ViewModelMyProducts _$ViewModelMyProductsFromJson(Map<String, dynamic> json) =>
    ViewModelMyProducts(
      json['id'] as String?,
      json['seller_id'] as int?,
      json['seller_str'] as String?,
      json['seller_url'] as String?,
      (json['seller_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['seller_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['logo'] == null
          ? null
          : Photo.fromJson(json['logo'] as Map<String, dynamic>),
      json['logo_url'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['short_description'] as String?,
      (json['tags_id'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['tags_str'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['tags_url'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      (json['deliverable'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['deliverable_url'] as String?,
      json['deliverable_name'] as String?,
      (json['trial_version'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : FileField.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['trial_version_url'] as String?,
      json['trial_version_name'] as String?,
      json['registered_date'] == null
          ? null
          : DateTime.parse(json['registered_date'] as String),
      json['published_date'] == null
          ? null
          : DateTime.parse(json['published_date'] as String),
      json['last_bump'] == null
          ? null
          : DateTime.parse(json['last_bump'] as String),
      (json['price'] as num?)?.toDouble(),
      json['price_str'] as String?,
      json['status_id'] as int?,
      json['status_str'] as String?,
      (json['status_list'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      (json['status_list_str'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      json['sales_count'] as int?,
      json['sales_count_str'] as String?,
      (json['sales_amount'] as num?)?.toDouble(),
      json['sales_amount_str'] as String?,
      json['rating'] as int?,
      json['points'] as int?,
      json['points_str'] as String?,
      json['ranking'] as int?,
      json['ranking_str'] as String?,
      json['admin_note'] as String?,
    )
      ..age = json['age'] as int?
      ..cnt = json['cnt'] as int?
      ..page = json['page'] as int?
      ..ttl = json['ttl'] as String?
      ..pht = json['pht'] as String?
      ..sbttl = json['sbttl'] as String?;

Map<String, dynamic> _$ViewModelMyProductsToJson(
        ViewModelMyProducts instance) =>
    <String, dynamic>{
      'age': instance.age,
      'cnt': instance.cnt,
      'page': instance.page,
      'id': instance.id,
      'ttl': instance.ttl,
      'pht': instance.pht,
      'sbttl': instance.sbttl,
      'seller_id': instance.seller_id,
      'seller_str': instance.seller_str,
      'seller_url': instance.seller_url,
      'seller_list': instance.seller_list,
      'seller_list_str': instance.seller_list_str,
      'logo_url': instance.logo_url,
      'logo': instance.logo,
      'title': instance.title,
      'description': instance.description,
      'short_description': instance.short_description,
      'tags_id': instance.tags_id,
      'tags_str': instance.tags_str,
      'tags_url': instance.tags_url,
      'deliverable': instance.deliverable,
      'deliverable_url': instance.deliverable_url,
      'deliverable_name': instance.deliverable_name,
      'trial_version': instance.trial_version,
      'trial_version_url': instance.trial_version_url,
      'trial_version_name': instance.trial_version_name,
      'registered_date': instance.registered_date?.toIso8601String(),
      'published_date': instance.published_date?.toIso8601String(),
      'last_bump': instance.last_bump?.toIso8601String(),
      'price': instance.price,
      'price_str': instance.price_str,
      'status_id': instance.status_id,
      'status_str': instance.status_str,
      'status_list': instance.status_list,
      'status_list_str': instance.status_list_str,
      'sales_count': instance.sales_count,
      'sales_count_str': instance.sales_count_str,
      'sales_amount': instance.sales_amount,
      'sales_amount_str': instance.sales_amount_str,
      'rating': instance.rating,
      'points': instance.points,
      'points_str': instance.points_str,
      'ranking': instance.ranking,
      'ranking_str': instance.ranking_str,
      'admin_note': instance.admin_note,
    };

MyProductsViewSuperBase _$MyProductsViewSuperBaseFromJson(
        Map<String, dynamic> json) =>
    MyProductsViewSuperBase(
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
          : ViewModelMyProducts.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyProductsViewSuperBaseToJson(
        MyProductsViewSuperBase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'model': instance.model,
    };

MyProductsListingTools _$MyProductsListingToolsFromJson(
        Map<String, dynamic> json) =>
    MyProductsListingTools(
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
              : ItemMyProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyProductsListingToolsToJson(
        MyProductsListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
