
Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  json['project_id'] as String?,
  json['title'] as String?,
  json['link'] as String?
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'project_id': instance.project_id,
  'title': instance.title,
  'link': instance.link,
};
class Project{
  String? project_id;
  String? title ;
  String? link;



  Project(
      this.project_id ,
      this.title ,
      this.link
      );

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}