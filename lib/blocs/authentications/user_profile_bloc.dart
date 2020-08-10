import 'package:base/models/profile/user_profile_result.dart';
import 'package:base/repositories/api_repositories.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileBloc {
  final ApiRepository _repository = ApiRepository();
  final BehaviorSubject<UserProfileResult> _subject =
  BehaviorSubject<UserProfileResult>();

  getUserProfile() async {
    UserProfileResult response = await _repository.userProfile();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserProfileResult> get subject => _subject;

}
final user_profile_bloc = UserProfileBloc();