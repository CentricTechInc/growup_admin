import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/user_parent_api.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/repository/user_parent_repository.dart';

class UserParentRepositoryImpl extends UserParentRepository {
  @override
  Future<List<ParentModel>> getParentTable() async {
    final response = await UserParentApi.getParentTable().request();
    final List<dynamic> json = jsonDecode(response)['data'];
    final List<ParentModel> data =
        json.map((e) => ParentModel.fromJson(e)).toList();
    return data;
  }

  @override
  Future<GiftDetailDto> getGiftDetail(String id) async {
    try {
      final response = await UserParentApi.getDetail(id).request();
      return GiftDetailDto.fromJson(jsonDecode(response));
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
}
