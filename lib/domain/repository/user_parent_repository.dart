import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/user_parent_api.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';

abstract class UserParentRepository{
  Future<ParentModel> getParentTable();
}

class UserParentRepositoryImpl extends UserParentRepository{
  @override
  Future<ParentModel> getParentTable() async {
  final response = await UserParentApi.getParentTable().request();
  final json = jsonDecode(response)['data'];
  // final data = ParentModel.toJson
  return ParentModel();
  }

}