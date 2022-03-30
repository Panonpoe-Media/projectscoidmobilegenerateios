// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectItemModel _$ProjectItemModelFromJson(Map<String, dynamic> json) =>
    ProjectItemModel(
      json['avatar'] as String?,
      json['url'] as String?,
      json['title'] as String?,
      json['budget'] as String?,
      json['owner'] as String?,
      json['deadline'] as String?,
    );

Map<String, dynamic> _$ProjectItemModelToJson(ProjectItemModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'url': instance.url,
      'title': instance.title,
      'budget': instance.budget,
      'owner': instance.owner,
      'deadline': instance.deadline,
    };

ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) => ProjectModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProjectItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectModelToJson(ProjectModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

WorkerItemModel _$WorkerItemModelFromJson(Map<String, dynamic> json) =>
    WorkerItemModel(
      json['avatar'] as String?,
      json['url'] as String?,
      json['user_name'] as String?,
      json['points'] as String?,
      json['projects'] as String?,
      json['rating'] as String?,
    );

Map<String, dynamic> _$WorkerItemModelToJson(WorkerItemModel instance) =>
    <String, dynamic>{
      'avatar': instance.avatar,
      'url': instance.url,
      'user_name': instance.user_name,
      'points': instance.points,
      'projects': instance.projects,
      'rating': instance.rating,
    };

WorkerModel _$WorkerModelFromJson(Map<String, dynamic> json) => WorkerModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : WorkerItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkerModelToJson(WorkerModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)?.map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

ServiceItemModel _$ServiceItemModelFromJson(Map<String, dynamic> json) =>
    ServiceItemModel(
      json['logo'] as String?,
      json['url'] as String?,
      json['title'] as String?,
      json['price'] as String?,
      json['seller'] as String?,
      json['delivery'] as String?,
    );

Map<String, dynamic> _$ServiceItemModelToJson(ServiceItemModel instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'url': instance.url,
      'title': instance.title,
      'price': instance.price,
      'seller': instance.seller,
      'delivery': instance.delivery,
    };

ServiceModel _$ServiceModelFromJson(Map<String, dynamic> json) => ServiceModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ServiceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceModelToJson(ServiceModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

ProductItemModel _$ProductItemModelFromJson(Map<String, dynamic> json) =>
    ProductItemModel(
      json['logo'] as String?,
      json['url'] as String?,
      json['title'] as String?,
      json['price'] as String?,
      json['seller'] as String?,
      json['delivery'] as String?,
    );

Map<String, dynamic> _$ProductItemModelToJson(ProductItemModel instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'url': instance.url,
      'title': instance.title,
      'price': instance.price,
      'seller': instance.seller,
      'delivery': instance.delivery,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

TestimonialItemModel _$TestimonialItemModelFromJson(
        Map<String, dynamic> json) =>
    TestimonialItemModel(
      json['content'] as String?,
      json['avatar'] as String?,
      json['user_url'] as String?,
      json['user_name'] as String?,
      json['date'] as String?,
      json['project_url'] as String?,
      json['project_title'] as String?,
    );

Map<String, dynamic> _$TestimonialItemModelToJson(
        TestimonialItemModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'avatar': instance.avatar,
      'user_url': instance.user_url,
      'user_name': instance.user_name,
      'date': instance.date,
      'project_url': instance.project_url,
      'project_title': instance.project_title,
    };

Testimonial _$TestimonialFromJson(Map<String, dynamic> json) => Testimonial(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TestimonialItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestimonialToJson(Testimonial instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

BlogItemModel _$BlogItemModelFromJson(Map<String, dynamic> json) =>
    BlogItemModel(
      json['tumbnail'] as String?,
      json['url'] as String?,
      json['title'] as String?,
      json['date'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$BlogItemModelToJson(BlogItemModel instance) =>
    <String, dynamic>{
      'tumbnail': instance.tumbnail,
      'url': instance.url,
      'title': instance.title,
      'date': instance.date,
      'description': instance.description,
    };

Blog _$BlogFromJson(Map<String, dynamic> json) => Blog(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BlogItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

TipItemModel _$TipItemModelFromJson(Map<String, dynamic> json) => TipItemModel(
      json['thumbnail'] as String?,
      json['url'] as String?,
      json['title'] as String?,
      json['date'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$TipItemModelToJson(TipItemModel instance) =>
    <String, dynamic>{
      'thumbnail': instance.thumbnail,
      'url': instance.url,
      'title': instance.title,
      'date': instance.date,
      'description': instance.description,
    };

Tip _$TipFromJson(Map<String, dynamic> json) => Tip(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : TipItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TipToJson(Tip instance) => <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

SuccessItemModel _$SuccessItemModelFromJson(Map<String, dynamic> json) =>
    SuccessItemModel(
      json['url'] as String?,
      json['image'] as String?,
      json['title'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$SuccessItemModelToJson(SuccessItemModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };

SuccessModel _$SuccessModelFromJson(Map<String, dynamic> json) => SuccessModel(
      json['title'] as String?,
      json['url'] as String?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SuccessItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuccessModelToJson(SuccessModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'items': instance.items,
    };

PublicHomeModel _$PublicHomeModelFromJson(Map<String, dynamic> json) =>
    PublicHomeModel(
      json['status'] as String?,
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['banner'] as String?,
      json['banner_background'] as String?,
      json['projects'] == null
          ? null
          : ProjectModel.fromJson(json['projects'] as Map<String, dynamic>),
      json['workers'] == null
          ? null
          : WorkerModel.fromJson(json['workers'] as Map<String, dynamic>),
      json['activities'] == null
          ? null
          : ActivityModel.fromJson(json['activities'] as Map<String, dynamic>),
      json['services'] == null
          ? null
          : ServiceModel.fromJson(json['services'] as Map<String, dynamic>),
      json['products'] == null
          ? null
          : ProductModel.fromJson(json['products'] as Map<String, dynamic>),
      json['testimonials'] == null
          ? null
          : Testimonial.fromJson(json['testimonials'] as Map<String, dynamic>),
      json['blogs'] == null
          ? null
          : Blog.fromJson(json['blogs'] as Map<String, dynamic>),
      json['tips'] == null
          ? null
          : Tip.fromJson(json['tips'] as Map<String, dynamic>),
      json['sukses'] == null
          ? null
          : SuccessModel.fromJson(json['sukses'] as Map<String, dynamic>),
    )..age = json['age'] as int?;

Map<String, dynamic> _$PublicHomeModelToJson(PublicHomeModel instance) =>
    <String, dynamic>{
      'age': instance.age,
      'status': instance.status,
      'meta': instance.meta,
      'banner': instance.banner,
      'banner_background': instance.banner_background,
      'projects': instance.projects,
      'workers': instance.workers,
      'activities': instance.activities,
      'services': instance.services,
      'products': instance.products,
      'testimonials': instance.testimonials,
      'blogs': instance.blogs,
      'tips': instance.tips,
      'sukses': instance.sukses,
    };
