import 'package:flutter_mvvm/data/remote/ApiEndPoints.dart';
import 'package:flutter_mvvm/data/remote/BaseApiService.dart';
import 'package:flutter_mvvm/data/remote/NetworkApiService.dart';
import '../../models/GithubUser.dart';

class GithubUserRepo {
  Future<List<GithubUser?>?> getGithubUserList() async {}
}

class GithubUseRepoImp implements GithubUserRepo {
  BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<GithubUser?>?> getGithubUserList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getGithubUser);
      final jsonData = createuseList(response);

      return jsonData;
    } catch (e) {
      throw e;
    }
  }

  List<GithubUser?> createuseList(List data) {
    List<GithubUser?> userList = [];

    for (int i = 0; i < data.length; i++) {
      String title = data[i]['login'];
      int id = data[i]['id'];
      String profile = data[i]['avatar_url'];
      GithubUser user = new GithubUser(title, id, profile);
      userList.add(user);
    }
    return userList;
  }
}
