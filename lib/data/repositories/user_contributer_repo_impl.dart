import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/user_contributor_api.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/repository/user_contributor_repository.dart';

class UserContributorRepositoryImpl extends UserContributorRepository {
  @override
  Future<PaginationModel> getContributorTable(int pageNo) async {
    final response =
        await UserContributorApi.getContributorTable(pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];
    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    final model = PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
    return model;
  }

  @override
  Future<PaginationModel> dateFilterContributorTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo) async {
    final response = await UserContributorApi.dateFilterContributorTable(
            dateTime, period, pageNo)
        .request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];

    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    final model = PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
    return model;
  }

  @override
  Future<PaginationModel> searchContributorTable(
      String search, int pageNo) async {
    final response =
        await UserContributorApi.searchContributorTable(pageNo, search)
            .request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];
    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    final model = PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
    return model;
  }
}
