

import 'package:base/models/news/news_result.dart';
import 'package:base/repositories/api_repositories.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc {
  final ApiRepository _repository = ApiRepository();
  final BehaviorSubject<NewsResult> _subject =
  BehaviorSubject<NewsResult>();

  getNews() async {
    NewsResult response = await _repository.getNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<NewsResult> get subject => _subject;

}
final news_bloc = NewsBloc();