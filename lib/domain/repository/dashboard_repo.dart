import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';

abstract class DashboardRepository {
  Future<DashboardListingDto> dashboardListingData();
}
