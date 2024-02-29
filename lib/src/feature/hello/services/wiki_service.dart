import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:helloworld/src/feature/hello/models/article.dart';

class WikiService {
  Future<Either<String, dynamic>> _get(String path, {Map<String, dynamic> params = const {}}) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: "https://en.wikipedia.org")).get(path);

      return switch (response.statusCode) {
        200 => right(response.data),
        _ => left("Error ${response.statusCode}."),
      };
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Article>> retrieveRandomArticle() async {
    final response = await _get("/api/rest_v1/page/random/summary");

    return response.fold(
      (error) => left(error),
      (json) => right(Article.fromJson(json)),
    );
  }
}
