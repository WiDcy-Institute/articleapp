
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article{

  int? id;
  String? title;
  @JsonKey(name: "content")
  String? body;

  Article(this.id, this.title, this.body);

  factory Article.fromJson(Map<String,dynamic> json) => _$ArticleFromJson(json);

  Map<String,dynamic> toJson() => _$ArticleToJson(this);

}