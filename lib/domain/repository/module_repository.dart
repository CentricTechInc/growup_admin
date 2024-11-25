import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';

abstract class ModuleRepository {
  Future<PaginationModel> getGiftingTable(int pageNo, String? search);

  Future<PaginationModel> getPayoutTable(int pageNo, String? search);

  Future<PaginationModel> getContributionTable(int pageNo, String? search);
  Future<String> exportContributionExcel();
  Future<String> exportGiftTable();

}
