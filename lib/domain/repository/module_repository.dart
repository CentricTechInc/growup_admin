
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';

abstract class ModuleRepository {
  Future<List<GiftingModel>> getGiftingTable();

  Future<List<PayoutModel>> getPayoutTable();

  Future<List<ContributionModel>> getContributionTable();
}

