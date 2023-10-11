import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_primaku/src/user/view/widgets/user_list_tile.dart';
import 'package:test_primaku/src/user/view_model/user_list_viewmodel.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});
  static const routeName = '/';

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  final ScrollController _controller = ScrollController();
  int page = 1;

  fetchData() {
    Provider.of<UserListViewModel>(context, listen: false).getUserList();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchData();
    });
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserListViewModel>(builder: ((context, viewModel, child) {
      return Container(
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('User List'),
            automaticallyImplyLeading: false,
          ),
          body: ListView.builder(
              controller: _controller,
              itemCount: viewModel.userList.length,
              itemBuilder: (context, index) {
                final userData = viewModel.userList[index];
                if (userData != null) {
                  return UserListTile(userData: userData);
                }
                return Container(
                    color: Colors.white,
                    child: const Text('No Data',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontFamily: 'Rubik-Regular',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)));
              }),
        ),
      );
    }));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
