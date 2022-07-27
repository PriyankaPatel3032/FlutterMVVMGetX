import 'package:get/get.dart';
import '../models/GithubUser.dart';
import '../repository/githubuser/github_user_repo_imp.dart';

class GithubUserListController extends GetxController
    with StateMixin<List<GithubUser?>?> {
  final _myRepo = GithubUseRepoImp();

  Future<void> fetchGethubUser() async {
    change(null, status: RxStatus.loading());

    _myRepo.getGithubUserList().then((value) {
      print(value);

      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change(null, status: RxStatus.error());
    });
  }
}
