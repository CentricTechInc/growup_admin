import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';

abstract class ModuleRepository {
  Future<PaginationModel> getGiftingTable(int pageNo);

  Future<PaginationModel> getPayoutTable(int pageNo);

  Future<PaginationModel> getContributionTable(int pageNo);
}
