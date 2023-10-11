import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_primaku/src/user/model/user.dart';

part 'user_list.freezed.dart';
part 'user_list.g.dart';

@freezed
class UserList with _$UserList {
  const factory UserList({
    required int? page,
    required int? perPage,
    required int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    required List<User>? data,
  }) = _Userlist;

  factory UserList.fromJson(Map<String, dynamic> json) => _$UserListFromJson(json);
}
