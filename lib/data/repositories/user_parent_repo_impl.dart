import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/gift_payout_model.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/user_parent_api.dart';
import 'package:grow_up_admin_panel/data/repositories/activity_model.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/repository/user_parent_repository.dart';

class UserParentRepositoryImpl extends UserParentRepository {
  @override
  Future<PaginationModel> getParentTable(int pageNo) async {
    final response = await UserParentApi.getParentTable(pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];

    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    final model = PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
    return model;
  }

  @override
  Future<PaginationModel> searchParentTable(String search, int pageNo) async {
    final response =
        await UserParentApi.searchParentTable(search, pageNo).request();
    final List<dynamic> json = jsonDecode(response)['data']['data'];

    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    final model = PaginationModel(
        data: data, count: jsonDecode(response)['data']['count']);
    return model;
  }

  @override
  Future<List<GiftingModel>> getGiftDetail(String id, status) async {
    try {
      final response = await UserParentApi.getDetail(id, status).request();
      final List<dynamic> json = jsonDecode(response)['data'];
      final List<GiftingModel> data =
          json.map((e) => GiftingModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserBeneficiaryDto> getUserBeneficiary(String id, String page) async {
    try {
      final response =
          await UserParentApi.getUserBeneficiary(id, page).request();
      return UserBeneficiaryDto.fromJson(jsonDecode(response));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ActivityModel>> getActivity(String id, String page) async {
    try {
      final response = await UserParentApi.getActivity(id, page).request();
      final List<dynamic> json = jsonDecode(response)['data'];
      final List<ActivityModel> data =
          json.map((e) => ActivityModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GiftPayoutModel> parentDetailPayoutTable(
      String userId, int page) async {
    try {
      final response =
          await UserParentApi.parentDetailPayoutTable(userId, page).request();
      final json = jsonDecode(response)['data'];
      final GiftPayoutModel data = GiftPayoutModel.fromJson(json);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ContributionModel>> getGiftContributions(
      int userId, int page) async {
    try {
      final response =
          await UserParentApi.getGiftsContributions(userId, page).request();
      final List<dynamic> json = jsonDecode(response)['data'];
      final List<ContributionModel> data =
          json.map((e) => ContributionModel.fromJson(e)).toList();
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteGift(int id) async {
    try {
      final response = await UserParentApi.deleteGift(id).request();
      final msg = jsonDecode(response)['message'];
      return msg;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> deleteBenefeciary(int id) async {
    try {
      final response = await UserParentApi.deletebenefeciary(id).request();
      final msg = jsonDecode(response)['message'];
      return msg;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> changeGiftStatus(String status, int giftId) async {
    try {
      final response =
          await UserParentApi.changeGiftStatus(status, giftId).request();
      final msg = jsonDecode(response)['message'];
      return msg;
    } catch (e) {
      rethrow;
    }
  }
}
