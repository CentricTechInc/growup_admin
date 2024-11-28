import 'package:grow_up_admin_panel/data/provider/network/apis/pagination_model.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';

abstract class UserContributorRepository {
  Future<PaginationModel> getContributorTable(int pageNo);

  Future<PaginationModel> searchContributorTable(String search, int pageNo);
  Future<PaginationModel> dateFilterContributorTable(DateRangeModel? dateTime, CalendarPeriod? period, int pageNo);

}
