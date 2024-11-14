import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/active_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_contributors_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_gifting_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/total_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/provider/network/apis/dashboard_api.dart';
import 'package:grow_up_admin_panel/domain/repository/dashboard_repo.dart';

class DashboardRepoImpl extends DashboardRepository {
  @override
  Future<DashboardListingDto> dashboardListingData() async {
    try {
      final response = await DashboardApi.dashboardListing().request();
      var json = jsonDecode(response);
      return DashboardListingDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ActiveUsersChartDto> activeUsersChart(String filter) async {
    try {
      final response = await DashboardApi.activeUsersChart(filter).request();
      var json = jsonDecode(response);
      return ActiveUsersChartDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopContributorsChartDto> topContributorsChart(String filter) async {
    try {
      final response =
          await DashboardApi.topContributorsChart(filter).request();
      var json = jsonDecode(response);

      return TopContributorsChartDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TopGiftingChartDto> topGiftingChart(String filter) async {
    try {
      final response = await DashboardApi.topGiftingChart(filter).request();
      var json = jsonDecode(response);
      return TopGiftingChartDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TotalUsersChartDto> totalUsersChart(String filter) async {
    try {
      final response = await DashboardApi.totalUsersChart(filter).request();
      var json = jsonDecode(response);

      return TotalUsersChartDto.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
