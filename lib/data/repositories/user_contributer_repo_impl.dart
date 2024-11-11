import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/user_contributor_api.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/repository/user_contributor_repository.dart';


class UserContributorRepositoryImpl extends UserContributorRepository {
  @override
  Future<List<ParentModel>> getContributorTable() async {
    final response = await UserContributorApi.getContributorTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<ParentModel> data = json.map((e) => ParentModel.fromJson(e)).toList();
    return data;
  }
}