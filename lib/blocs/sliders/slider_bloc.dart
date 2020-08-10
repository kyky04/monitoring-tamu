import 'package:base/models/sliders/slider_result.dart';
import 'package:base/repositories/api_repositories.dart';
import 'package:rxdart/rxdart.dart';


class SliderBloc {
  final ApiRepository _repository = ApiRepository();
  final BehaviorSubject<SliderResult> _subject =
  BehaviorSubject<SliderResult>();

  getSlider() async {
    SliderResult response = await _repository.fetchSliders();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SliderResult> get subject => _subject;

}
final bloc = SliderBloc();