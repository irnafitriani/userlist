import 'package:test_primaku/src/base_viewmodel.dart';
import 'package:test_primaku/src/user/model/user.dart';
import 'package:test_primaku/src/user/service/user_service.dart';

class UserListViewModel extends BaseViewModel {
  final userService = UserService();
  List<User?> _userList = [];
  List<User?> get userList => _userList;
  set userList(List<User?> value) {
    _userList = value;
    notifyListeners();
  }

  int _page = 1;
  int _totalPage = 10;

  init() async {
    await getUserList();
  }

  Future<void> getUserList() async {
    if (_totalPage >= _page) {
      final userListResponse = await userService.getUserList(_page);
      _page += 1;
      _totalPage = userListResponse.totalPages ?? 0;
      final userListToAdd = userListResponse.data ?? [];
      userList.addAll(userListToAdd);
      notifyListeners();
    }
  }
}
