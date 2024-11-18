import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/module_api.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/domain/repository/module_repository.dart';

class ModuleRepositoryImpl extends ModuleRepository {
  @override
  Future<PaginationModel> getGiftingTable(int pageNo) async {
    final response = await ModuleApi.getGiftingTable(pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['records'];
    final List<GiftingModel> data =
        json.map((e) => GiftingModel.fromJson(e)).toList();
    return PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
  }

  @override
  Future<PaginationModel> getPayoutTable(int pageNo) async {
    final response = await ModuleApi.getPayoutTable(pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];
    final List<PayoutModel> data =
        json.map((e) => PayoutModel.fromJson(e)).toList();
    return PaginationModel(
      data: data,
      count: jsonDecode(response)['data']['count'],
    );
  }

  @override
  Future<PaginationModel> getContributionTable(int pageNo) async {
    final response = await ModuleApi.getContributionTable(pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];
    final List<ContributionModel> data =
        json.map((e) => ContributionModel.fromJson(e)).toList();
    return PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
  }
}
