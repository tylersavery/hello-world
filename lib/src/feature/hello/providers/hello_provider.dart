import 'package:fpdart/fpdart.dart';
import 'package:helloworld/src/feature/hello/models/article.dart';
import 'package:helloworld/src/feature/hello/services/wiki_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hello_provider.g.dart';

@riverpod
Future<Either<String, Article>> hello(HelloRef ref) {
  final wikiService = WikiService();
  return wikiService.retrieveRandomArticle();
}
