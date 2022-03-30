
import 'package:json_annotation/json_annotation.dart';
import 'file_fields.dart';
import 'meta.dart';
import 'photo.dart';
part 'public_home.g.dart';

@JsonSerializable()
class ProjectItemModel {

  String? avatar;
  String? url;
  String? title;
  String? budget;
  String? owner;
  String? deadline;

	  ProjectItemModel(
            this.avatar,
			this.url,
			this.title,
			this.budget,
			this.owner,
			this.deadline
  );
	
  factory ProjectItemModel.fromJson(Map<String, dynamic> json) => _$ProjectItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectItemModelToJson(this);

}



@JsonSerializable()
class ProjectModel {

  String? title;
  String? url;
  List<ProjectItemModel?>? items;
	  ProjectModel(
            this.title,
			this.url,
			this.items
  );
	
  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectModelToJson(this);

}

@JsonSerializable()
class WorkerItemModel {

  String? avatar;
  String? url;
  String? user_name;
  String? points;
  String? projects;
  String? rating;

	  WorkerItemModel(
            this.avatar,
			this.url,
			this.user_name,
			this.points,
			this.projects,
			this.rating
  );
	
  factory WorkerItemModel.fromJson(Map<String, dynamic> json) => _$WorkerItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerItemModelToJson(this);

}



@JsonSerializable()
class WorkerModel {

  String? title;
  String? url;
  List<WorkerItemModel?>? items;
	  WorkerModel(
            this.title,
			this.url,
			this.items
  );
	
  factory WorkerModel.fromJson(Map<String, dynamic> json) => _$WorkerModelFromJson(json);
  Map<String, dynamic> toJson() => _$WorkerModelToJson(this);

}

@JsonSerializable()
class ActivityModel {

  String? title;
  String? url;
  List<String?>? items;
	  ActivityModel(
            this.title,
			this.url,
			this.items
  );
	
  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

}


@JsonSerializable()
class ServiceItemModel {

  String? logo;
  String? url;
  String? title;
  String? price;
  String? seller;
  String? delivery;

	  ServiceItemModel(
            this.logo,
			this.url,
			this.title,
			this.price,
			this.seller,
			this.delivery
  );
	
  factory ServiceItemModel.fromJson(Map<String, dynamic> json) => _$ServiceItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceItemModelToJson(this);

}



@JsonSerializable()
class ServiceModel {

  String? title;
  String? url;
  List<ServiceItemModel?>? items;
	  ServiceModel(
            this.title,
			this.url,
			this.items
  );
	
  factory ServiceModel.fromJson(Map<String, dynamic> json) => _$ServiceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ServiceModelToJson(this);

}

@JsonSerializable()
class ProductItemModel {

  String? logo;
  String? url;
  String? title;
  String? price;
  String? seller;
  String? delivery;

	  ProductItemModel(
            this.logo,
			this.url,
			this.title,
			this.price,
			this.seller,
			this.delivery
  );
	
  factory ProductItemModel.fromJson(Map<String, dynamic> json) => _$ProductItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemModelToJson(this);

}



@JsonSerializable()
class ProductModel {

  String? title;
  String? url;
  List<ProductItemModel?>? items;
	  ProductModel(
            this.title,
			this.url,
			this.items
  );
	
  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}

@JsonSerializable()
class TestimonialItemModel {
  String? content;
  String? avatar;
  String? user_url;
  String? user_name;
  String? date;
  String? project_url;
  String? project_title;

	  TestimonialItemModel(
            this.content,
			this.avatar,
			this.user_url,
			this.user_name,
			this.date,
			this.project_url,
			this.project_title
  );
	
  factory TestimonialItemModel.fromJson(Map<String, dynamic> json) => _$TestimonialItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonialItemModelToJson(this);

}



@JsonSerializable()
class Testimonial {
  String? title;
  String? url;
  List<TestimonialItemModel?>? items;
	  Testimonial(
            this.title,
			this.url,
			this.items
  );
	
  factory Testimonial.fromJson(Map<String, dynamic> json) => _$TestimonialFromJson(json);
  Map<String, dynamic> toJson() => _$TestimonialToJson(this);

}

@JsonSerializable()
class BlogItemModel {
  String? tumbnail;
  String? url;
  String? title;
  String? date;
  String? description;
  
	  BlogItemModel(
            this.tumbnail,
			this.url,
			this.title,
			this.date,
			this.description
  );
	
  factory BlogItemModel.fromJson(Map<String, dynamic> json) => _$BlogItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$BlogItemModelToJson(this);

}

@JsonSerializable()
class Blog {
  String? title;
  String? url;
  List<BlogItemModel?>? items;
	  Blog(
            this.title,
			this.url,
			this.items
  );
	
  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);
  Map<String, dynamic> toJson() => _$BlogToJson(this);

}


@JsonSerializable()
class TipItemModel {
  String? thumbnail;
  String? url;
  String? title;
  String? date;
  String? description;
  
	  TipItemModel(
            this.thumbnail,
			this.url,
			this.title,
			this.date,
			this.description
  );
	
  factory TipItemModel.fromJson(Map<String, dynamic> json) => _$TipItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$TipItemModelToJson(this);

}

@JsonSerializable()
class Tip {
  String? title;
  String? url;
  List<TipItemModel?>? items;
	  Tip(
            this.title,
			this.url,
			this.items
  );
	
  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
  Map<String, dynamic> toJson() => _$TipToJson(this);

}

@JsonSerializable()
class SuccessItemModel {
  String? url;
  String? image;
  String? title;
  String? description;
  
	  SuccessItemModel(
			this.url,
			this.image,
			this.title,
			this.description
  );
	
  factory SuccessItemModel.fromJson(Map<String, dynamic> json) => _$SuccessItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessItemModelToJson(this);

}

@JsonSerializable()
class SuccessModel {
  String? title;
  String? url;
  List<SuccessItemModel?>? items;
	  SuccessModel(
            this.title,
			this.url,
			this.items
  );
	
  factory SuccessModel.fromJson(Map<String, dynamic> json) => _$SuccessModelFromJson(json);
  Map<String, dynamic> toJson() => _$SuccessModelToJson(this);

}

@JsonSerializable()
class PublicHomeModel {
  int? age;
  String? status;
  Meta? meta;
  String? banner;
  String? banner_background;
  ProjectModel? projects;
  WorkerModel? workers;
  ActivityModel? activities;
  ServiceModel? services;
  ProductModel? products;
  Testimonial? testimonials;
  Blog? blogs;
  Tip? tips;
  SuccessModel? sukses;
 	  PublicHomeModel(
	  this.status,
	  this.meta,
	  this.banner,
	  this.banner_background,
	  this.projects,
	  this.workers,
	  this.activities,
	  this.services,
	  this.products,
	  this.testimonials,
	  this.blogs,
	  this.tips,
	  this.sukses
  );
	
  factory PublicHomeModel.fromJson(Map<String, dynamic> json) => _$PublicHomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$PublicHomeModelToJson(this);

}












  

