import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';

abstract class ModuleRepository {
  Future<PaginationModel> getGiftingTable(int pageNo, String? search);
  Future<GiftingModel> getGiftDetails(int giftId);

  Future<PaginationModel> getPayoutTable(int pageNo, String? search);

  Future<PaginationModel> getContributionTable(int pageNo, String? search);

  Future<String> exportContributionExcel();

  Future<String> exportGiftTable();
  Future<String> exportPayoutTable();

  Future<PaginationModel> dateFilterGiftingTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo);

  Future<PaginationModel> dateFilterContributionsTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo);

  Future<PaginationModel> dateFilterPayoutTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo);
}
