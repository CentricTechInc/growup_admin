import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/gift_payout_model.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/data/repositories/activity_model.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';

abstract class UserParentRepository {
  Future<PaginationModel> getParentTable(int page);

  Future<PaginationModel> searchParentTable(String search, int pageNo);

  Future<GiftDetailDto> getGiftDetail(String id, status);

  Future<UserBeneficiaryDto> getUserBeneficiary(String id, String page);

  Future<List<ActivityModel>> getActivity(String id, String page);

  Future<GiftPayoutModel> parentDetailPayoutTable(String userId, int page);
  Future<List<ContributionModel>> getGiftContributions(String userId, int page);
}
