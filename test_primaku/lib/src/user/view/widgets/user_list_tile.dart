import 'package:flutter/material.dart';
import 'package:test_primaku/src/user/model/user.dart';
import 'package:test_primaku/src/user/view/user_detail_view.dart';

class UserListTile extends StatelessWidget {
  final User userData;
  const UserListTile({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UserDetailView.routeName, arguments: userData);
      },
      child: Row(
        children: [
          Image.network(userData.avatar ?? ''),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${userData.firstName} ${userData.lastName}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Rubik-Regular',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '${userData.email}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Rubik-Regular',
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
