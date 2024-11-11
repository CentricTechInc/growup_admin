import 'dart:convert';

import 'package:grow_up_admin_panel/data/provider/network/apis/module_api.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/domain/repository/module_repository.dart';

class ModuleRepositoryImpl extends ModuleRepository {
  @override
  Future<List<GiftingModel>> getGiftingTable() async {
    final response = await ModuleApi.getGiftingTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<GiftingModel> data =
    json.map((e) => GiftingModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<List<PayoutModel>> getPayoutTable() async {
    final response = await ModuleApi.getPayoutTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<PayoutModel> data =
    json.map((e) => PayoutModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<List<ContributionModel>> getContributionTable() async {
    final response = await ModuleApi.getContributionTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<ContributionModel> data =
    json.map((e) => ContributionModel.fromJson(e)).toList();
    return data;
  }
}
