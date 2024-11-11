import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/data/repositories/dashboard_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repository/dashboard_repo.dart';

class DashboardController extends GetxController {
  DashboardRepository dashboardRepository = DashboardRepoImpl();

  @override
  void onInit() {
    getDashboardListingData();
    super.onInit();
  }

  DashboardListingDto? dashboardListingDto;
  CountObjects? countObjects;
  List<PayoutObject>? payoutObject;
  List<RecentUsersObject>? recentUsersObject;
  List<RecentContributions>? recentContributions;
  getDashboardListingData() async {
    try {
      dashboardListingDto = await dashboardRepository.dashboardListingData();
      countObjects = dashboardListingDto?.data?.countObjects;
      payoutObject = dashboardListingDto?.data?.payoutObject;
      recentUsersObject = dashboardListingDto?.data?.recentUsersObject;
      recentContributions = dashboardListingDto?.data?.recentContributions;
      update();
    } catch (e) {
      print(e);
      CommonSnackBar.message(message: e.toString());
    }
  }
}
