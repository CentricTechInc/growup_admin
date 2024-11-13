import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';

abstract class UserParentRepository {
  Future<List<ParentModel>> getParentTable();
  Future<GiftDetailDto> getGiftDetail(String id);
  Future<UserBeneficiaryDto> getUserBeneficiary(String id, String page);
}
