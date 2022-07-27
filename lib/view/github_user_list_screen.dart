import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/models/GithubUser.dart';
import 'package:flutter_mvvm/view/widget/loading_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/githubuserlistcontroller.dart';

class GithubUserListScreen extends StatefulWidget {
  static final String id = "github_user_list_screen";

  const GithubUserListScreen({Key? key}) : super(key: key);

  @override
  _GithubUserListScreenState createState() => _GithubUserListScreenState();
}

class _GithubUserListScreenState extends State<GithubUserListScreen> {
  final GithubUserListController controller =
      Get.put(GithubUserListController());

  @override
  void initState() {
    super.initState();
    controller.fetchGethubUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter MVVM"),
      ),
      body: controller.obx((userlist) => _getGithubUserListView(userlist!),
          onLoading: LoadingWidget(),
          onEmpty: Container(),
          onError: (error) => Container(
                child: Text(error.toString()),
              )),
    );
  }

  Widget _getGithubUserListView(List<GithubUser?> userlist) {
    return ListView.builder(
        itemCount: userlist.length,
        itemBuilder: (context, position) {
          return _getGithubUserListItem(userlist[position]);
        });
  }

  Widget _getGithubUserListItem(GithubUser? githubUser) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(githubUser!.profile),
                    backgroundColor: Colors.transparent,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(githubUser.name,
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            new Divider()
          ],
        )));
  }
}
