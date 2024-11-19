import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/resources/strings.dart';
import 'package:grow_up_admin_panel/data/dto/active_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/contribution_frequency_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/dashboard_listing_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_contributors_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/top_gifting_chart_dto.dart';
import 'package:grow_up_admin_panel/data/dto/total_users_chart_dto.dart';
import 'package:grow_up_admin_panel/data/repositories/dashboard_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/repository/dashboard_repo.dart';

class DashboardController extends GetxController {
  DashboardRepository dashboardRepository = DashboardRepoImpl();

  @override
  void onReady() {
    init();
    super.onReady();
  }

  init() async {
    getDashboardListingData();
    getActiveUsersChart();
    getTopContributorsChart();
    getTopGiftingChart();
    getTotalUsersChart();
    getContributionFrequencyChart();
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
  ContributionFrequencyChartDto? contributionFrequencyChartDto;

  String selectedUserFilter = '06 Months';
  String selectedGiftFilter = 'This Week';
  String selectedContributorFilter = '03 Months';
  String selectedTotalUsersFilter = 'This Week';
  String selectedContributionFrequencyFilter = '06 Months';

  List<String> userFilters = ['Last Week', '06 Months'];
  List<String> giftFilters = [
    'This Week',
    'Quarterly',
    'Last Week',
    'Last Month'
  ];
  List<String> contributorFilters = ['03 Months'];
  List<String> totalUsersFilters = [
    'This Week',
    'Last Week',
    'Last Month',
    'Quarterly'
  ];
  List<String> contributionFrequencyFilters = [
    'This Week',
    'Last Week',
    '06 Months'
  ];
  final List<ChartData> contributorData = [];
  final List<ChartData> parentData = [];
  final List<ChartData> topGiftingData = [];
  final List<ContributorChartData> topContributorChartData = [];

  // contribution frequency lists data
  List<ChartData> weeklyContributionFrequencyList = [];
  List<ChartData> onceContributionFrequencyList = [];
  List<ChartData> monthlyContributionFrequencyList = [];
  List<ChartData> quaterlyContributionFrequencyList = [];

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
  bool totalUsersLoading = false;
  bool contributionFrequencyLoading = false;

  getActiveUsersChart() async {
    try {
      parentData.clear();
      contributorData.clear();
      isUserLoading = true;
      update();
      await Future.delayed(const Duration(milliseconds: 500));
      String filter = getDropdownString(selectedUserFilter);
      activeUsersChartDto = await dashboardRepository.activeUsersChart(filter);

      activeUsersChartDto?.data?.contributorusers?.data?.forEach((element) {
        contributorData
            .add(ChartData(element.date!, double.parse(element.total!)));
      });
      activeUsersChartDto?.data?.parentusers?.data?.forEach((element) {
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
      String filter = getDropdownString(selectedContributorFilter);
      topContributorsChartDto =
          await dashboardRepository.topContributorsChart(filter);
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
      String filter = getDropdownString(selectedGiftFilter);
      topGiftingChartDto = await dashboardRepository.topGiftingChart(filter);
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

  getTotalUsersChart() async {
    try {
      totalUsersLoading = true;
      update();
      await Future.delayed(const Duration(milliseconds: 500));

      String filter = getDropdownString(selectedTotalUsersFilter);
      totalUsersChartDto = await dashboardRepository.totalUsersChart(filter);
      print('totalUsersChartDto: ${totalUsersChartDto?.toJson()}');
      totalUsersLoading = false;
      update();
    } catch (e) {
      totalUsersLoading = false;
      update();
      print(e);
    }
  }

  getContributionFrequencyChart() async {
    try {
      contributionFrequencyLoading = true;
      weeklyContributionFrequencyList.clear();
      onceContributionFrequencyList.clear();
      monthlyContributionFrequencyList.clear();
      quaterlyContributionFrequencyList.clear();
      update();
      await Future.delayed(const Duration(milliseconds: 500));
      String filter = getDropdownString(selectedContributionFrequencyFilter);
      contributionFrequencyChartDto =
          await dashboardRepository.contributionFrequencyChart(filter);

      contributionFrequencyChartDto?.data?.result?.forEach((element) {
        if (element.frequency == 'Weekly') {
          weeklyContributionFrequencyList.add(
            ChartData(element.month ?? '', element.percentage ?? 0.0),
          );
        } else if (element.frequency == 'Once') {
          onceContributionFrequencyList.add(
            ChartData(element.month ?? '', element.percentage ?? 0.0),
          );
        } else if (element.frequency == 'Monthly') {
          monthlyContributionFrequencyList.add(
            ChartData(element.month ?? '', element.percentage ?? 0.0),
          );
        } else if (element.frequency == 'Quarterly') {
          quaterlyContributionFrequencyList
              .add(ChartData(element.month ?? '', element.percentage ?? 0.0));
        }
      });
      contributionFrequencyLoading = false;
      update();
    } catch (e) {
      contributionFrequencyLoading = false;
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
