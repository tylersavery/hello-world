// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

thumbnailFromJson(Map<String, dynamic> value) {
  return value['source'];
}

urlFromJson(Map<String, dynamic> value) {
  return value['desktop']['page'];
}

@freezed
class Article with _$Article {
  factory Article({
    required String title,
    required String extract,
    @JsonKey(fromJson: thumbnailFromJson) String? thumbnail,
    @JsonKey(name: "content_urls", fromJson: urlFromJson) required String url,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}
