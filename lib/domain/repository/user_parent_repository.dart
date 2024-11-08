import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/user_parent_api.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';

abstract class UserParentRepository {
  Future<List<ParentModel>> getParentTable();
}

class UserParentRepositoryImpl extends UserParentRepository {
  @override
  Future<List<ParentModel>> getParentTable() async {
    final response = await UserParentApi.getParentTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<ParentModel> data = json.map((e) => ParentModel.fromJson(e)).toList();
    return data;
  }
}
