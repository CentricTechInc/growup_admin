import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/data/dto/active_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_contributors_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_gifting_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/total_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/repositories/dashboard_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repository/dashboard_repo.dart';

class DashboardController extends GetxController {
  DashboardRepository dashboardRepository = DashboardRepoImpl();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() async {
    getDashboardListingData();
    getActiveUsersChart();
    getTopContributorsChart();
    getTopGiftingChart();
    getTotalUsersChart();
  }

  DashboardListingDto? dashboardListingDto;
  CountObjects? countObjects;
  List<PayoutObject>? payoutObject;
  List<RecentUsersObject>? recentUsersObject;
  List<RecentContributions>? recentContributions;

  ActiveUsersChartDto? activeUsersChartDto;
  TopContributorsChartDto? topContributorsChartDto;
  TopGiftingChartDto? topGiftingChartDto;
  TotalUsersChartDto? totalUsersChartDto;

  String selectedUserFilter = 'half-yearly';
  String selectedGiftFilter = 'this-week';
  String selectedContributorFilter = 'last90days';
  String selectedTotalUsersFilter = 'this-week';

  List<String> userFilters = ['last-week', 'half-yearly'];
  List<String> giftFilters = [
    'this-week',
    'quarterly',
    'last-week',
    'last-month'
  ];
  List<String> contributorFilters = ['last90days'];
  List<String> totalUsersFilters = [
    'this-week',
    'last-week',
    'last-month',
    'quarterly'
  ];
  final List<ChartData> contributorData = [];
  final List<ChartData> parentData = [];
  final List<ChartData> topGiftingData = [];
  final List<ContributorChartData> topContributorChartData = [];
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

  bool isUserLoading = false;
  bool isGiftLoading = false;
  bool isContributorLoading = false;
  getActiveUsersChart() async {
    try {
      parentData.clear();
      contributorData.clear();
      isUserLoading = true;
      update();
      await Future.delayed(const Duration(milliseconds: 500));
      activeUsersChartDto =
          await dashboardRepository.activeUsersChart(selectedUserFilter);

      activeUsersChartDto?.data?.contributorusers?.forEach((element) {
        contributorData
            .add(ChartData(element.date!, double.parse(element.total!)));
      });
      activeUsersChartDto?.data?.parentusers?.forEach((element) {
        parentData.add(ChartData(element.date!, double.parse(element.total!)));
      });
      isUserLoading = false;
      update();
    } catch (e) {
      isUserLoading = false;
      update();
      print(e);
    }
  }

  getTopContributorsChart() async {
    try {
      topContributorChartData.clear();
      isContributorLoading = true;
      update();
      topContributorsChartDto = await dashboardRepository
          .topContributorsChart(selectedContributorFilter);
      topContributorsChartDto?.data?.chartData?.forEach((element) {
        topContributorChartData.add(ContributorChartData(
          month: element.month,
          parent: element.parent,
          contributor: element.contributor,
        ));
      });
      isContributorLoading = false;
      update();
    } catch (e) {
      isContributorLoading = false;
      update();
      print(e);
    }
  }

  getTopGiftingChart() async {
    try {
      topGiftingData.clear();
      isGiftLoading = true;
      await Future.delayed(const Duration(milliseconds: 500));
      update();
      topGiftingChartDto =
          await dashboardRepository.topGiftingChart(selectedGiftFilter);
      print(topGiftingChartDto?.toJson());
      topGiftingChartDto?.data?.records?.forEach((element) {
        topGiftingData.add(ChartData(
          element.gift?.title ?? '',
          double.parse(element.totalAmount ?? ''),
        ));
      });
      isGiftLoading = false;
      update();
    } catch (e) {
      isGiftLoading = false;
      update();
      print(e);
    }
  }

  bool totalUsersLoading = false;
  getTotalUsersChart() async {
    try {
      totalUsersLoading = true;
      update();
      await Future.delayed(const Duration(milliseconds: 500));
      totalUsersChartDto =
          await dashboardRepository.totalUsersChart(selectedTotalUsersFilter);
      totalUsersLoading = false;
      update();
    } catch (e) {
      totalUsersLoading = false;
      update();
      print(e);
    }
  }
}

class ChartData {
  final String month;
  final double value;

  ChartData(this.month, this.value);
}
