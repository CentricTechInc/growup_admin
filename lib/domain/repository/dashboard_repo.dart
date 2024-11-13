import 'package:grow_up_admin_panel/data/dto/active_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_contributors_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_gifting_chart_dto.dart';

abstract class DashboardRepository {
  Future<DashboardListingDto> dashboardListingData();
  Future<TopGiftingChartDto> topGiftingChart(String filter);
  Future<TopContributorsChartDto> topContributorsChart(String filter);
  Future<ActiveUsersChartDto> activeUsersChart(String filter);
}
