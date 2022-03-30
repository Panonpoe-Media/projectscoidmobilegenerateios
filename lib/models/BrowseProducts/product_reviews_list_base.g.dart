// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_reviews_list_base.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReviewsListingTools _$ProductReviewsListingToolsFromJson(
        Map<String, dynamic> json) =>
    ProductReviewsListingTools(
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
              : ItemProductReviews.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductReviewsListingToolsToJson(
        ProductReviewsListingTools instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meta': instance.meta,
      'buttons': instance.buttons,
      'paging': instance.paging,
      'items': instance.items,
    };
