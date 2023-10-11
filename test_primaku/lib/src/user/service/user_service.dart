import 'package:test_primaku/src/network/dio_client.dart';
import 'package:test_primaku/src/user/model/user_list.dart';

class UserService {
  final dioClient = DioClient();
  Future<UserList> getUserList(int page) async {
    final Map<String, dynamic> parameter = {'page': page};
    final response = await dioClient.request('/users',
        requestType: NetworkRequestType.GET, queryParameters: parameter);
    final userList = UserList.fromJson(response.data);
    return userList;
  }
}
