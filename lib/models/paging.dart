
import 'package:json_annotation/json_annotation.dart';
part 'paging.g.dart';


@JsonSerializable()
class Paging{
  int? total_rows ;
  int? total_pages;
  int? current_page;

  Paging(
      this.total_rows,
      this.total_pages,
      this.current_page,
      );

  factory Paging.fromJson(Map<String, dynamic> json) => _$PagingFromJson(json);

  Map<String, dynamic> toJson() => _$PagingToJson(this);

}


