import 'dart:convert';

import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
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
}
