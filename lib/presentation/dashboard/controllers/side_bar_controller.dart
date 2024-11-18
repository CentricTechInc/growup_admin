import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_debouncer.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/loader_widget.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/gift_payout_model.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
import 'package:grow_up_admin_panel/data/repositories/activity_model.dart';
import 'package:grow_up_admin_panel/data/repositories/module_repo_impl.dart';
import 'package:grow_up_admin_panel/data/repositories/user_contributer_repo_impl.dart';
import 'package:grow_up_admin_panel/data/repositories/user_parent_repo_impl.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/domain/repository/module_repository.dart';
import 'package:grow_up_admin_panel/domain/repository/user_contributor_repository.dart';
import 'package:grow_up_admin_panel/domain/repository/user_parent_repository.dart';

class SideBarController extends GetxController {
  int selectedItemIndex = 0;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  List<SideBarItemModel> sideBarList = [
    SideBarItemModel(
        itemName: 'Dashboard',
        isSelected: true,
        imageUrl: Assets.dashboardIcon),
    SideBarItemModel(
        itemName: 'User : Parents', imageUrl: Assets.userParentIcon),
    SideBarItemModel(
        itemName: 'User : Contributors', imageUrl: Assets.userContributiorIcon),
    SideBarItemModel(itemName: 'Giftings', imageUrl: Assets.giftingsIcon),
    SideBarItemModel(
        itemName: 'Contributions', imageUrl: Assets.contributionsIcon),
    SideBarItemModel(itemName: 'Payout', imageUrl: Assets.payoutIcon),
    SideBarItemModel(
        itemName: 'Analytics & Reports', imageUrl: Assets.analyticsIcon),
  ];

  ///PAGINATION+++++++++++++++++++++_---------
  int elementCount = 1;
  int pageSize = 10;

  ///Parent Table------
  int parentPageNo = 1;

  ///Contributor Table------
  int contributorPageNo = 1;

  ///Contributon module------
  int contributonModulePageNo = 1;

  ///Contributor Table------
  int giftingsPageNo = 1;

  ///Contributor Table------
  int payoutPageNo = 1;

  ///++++++++++++++++++++++++++++++++++++++++++++++

  int liveGiftingSelectedIndex = 0;
  int userParentSelectedIndex = 0;
  int userContributerSelectedIndex = 0;

  bool isCollapsedIssue = true;
  final liveGiftingPageController = PageController();
  final userParentPageController = PageController();
  final userContributerPageController = PageController();
  final UserParentRepository userParentRepository = UserParentRepositoryImpl();
  final UserContributorRepository userContributorRepository =
      UserContributorRepositoryImpl();
  final ModuleRepository moduleRepository = ModuleRepositoryImpl();
  final List<ParentModel> userParentModelList = [];
  final List<ParentModel> userContributorModelList = [];
  final List<GiftingModel> giftingModelList = [];
  final List<PayoutModel> payoutModelList = [];
  final List<ContributionModel> contributionModelList = [];
  GiftDetailDto giftingDetailData = GiftDetailDto();
  UserBeneficiaryDto benefeciaryData = UserBeneficiaryDto();
  GiftPayoutModel giftPayoutData = GiftPayoutModel();
  final debouncer = Debouncer(milliseconds: 1000);
  bool isLoading = false;
  final parentTableSearchController = TextEditingController();
  final contributorTableSearchController = TextEditingController();
  //
  final giftingSearchController = TextEditingController();
  final contributionsSearchController = TextEditingController();
  final payoutSearchController = TextEditingController();

  getParentTable() async {
    try {
      Loader.showLoader();
      final res = await userParentRepository.getParentTable(parentPageNo);
      userParentModelList.clear();
      userParentModelList.addAll(res.data);
      elementCount = res.count ?? 0;
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  searchParentTable(String search) async {
    try {
      Loader.showLoader();
      final res =
          await userParentRepository.searchParentTable(search, parentPageNo);
      userParentModelList.clear();
      userParentModelList.addAll(res.data);
      elementCount = res.count ?? 0;
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getContributorsTable() async {
    try {
      Loader.showLoader();
      final res = await userContributorRepository
          .getContributorTable(contributorPageNo);
      userContributorModelList.clear();
      userContributorModelList.addAll(res.data);
      elementCount = res.count ?? 1;
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  searchContributorsTable(String search) async {
    try {
      Loader.showLoader();
      final res = await userContributorRepository.searchContributorTable(
          search, contributorPageNo);
      userContributorModelList.clear();
      userContributorModelList.addAll(res.data);
      elementCount = res.count ?? 1;
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getGiftingTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getGiftingTable(
          giftingsPageNo, giftingSearchController.text);

      giftingModelList.clear();
      giftingModelList.addAll(res.data);

      elementCount = res.count ?? 1;
      update();
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getPayoutTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getPayoutTable(
          payoutPageNo, payoutSearchController.text);
      payoutModelList.clear();
      payoutModelList.addAll(res.data);
      elementCount = res.count ?? 1;
      update();
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getContributionTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getContributionTable(
          contributonModulePageNo, contributionsSearchController.text);
      contributionModelList.clear();
      contributionModelList.addAll(res.data);
      elementCount = res.count ?? 1;
      update();
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  Future<void> getGiftDetail(String id, String status) async {
    try {
      isLoading = true;
      giftingDetailData = await userParentRepository.getGiftDetail(id, status);
      await Future.delayed(Duration(seconds: 1));
      isLoading = false;
    } catch (e) {
      isLoading = false;
      CommonSnackBar.message(message: e.toString());
    }
  }

  Future<void> getUserBenes(String id) async {
    try {
      benefeciaryData = await userParentRepository.getUserBeneficiary(id, '1');
    } catch (e) {
      CommonSnackBar.message(message: e.toString());
    }
  }

  final List<ActivityModel> activityModel = [];

  Future<void> getActivity(String id) async {
    try {
      isLoading = true;
      final res = await userParentRepository.getActivity(id, '1');
      activityModel.clear();
      activityModel.addAll(res);
      await Future.delayed(Duration(seconds: 1));
      isLoading = false;
    } catch (e) {
      isLoading = false;
      CommonSnackBar.message(message: e.toString());
    }
  }

  Future<void> getGiftPayoutDetail(String userId) async {
    try {
      final res = await userParentRepository.parentDetailPayoutTable(userId, 1);
      giftPayoutData = res;
    } catch (e) {
      CommonSnackBar.message(message: e.toString());
    }
  }

  final List<ContributionModel> giftContributionList = [];

  Future<void> getGiftContributions(String userId) async {
    try {
      final res = await userParentRepository.getGiftContributions(userId, 1);
      giftContributionList.clear();
      giftContributionList.addAll(res);
    } catch (e) {
      CommonSnackBar.message(message: e.toString());
    }
  }

  int getSerialNumber(
      {required int currentPage,
      required int index,
      required int itemsPerPage}) {
    return ((currentPage - 1) * itemsPerPage) + index + 1;
  }
}

class SideBarItemModel {
  String? itemName;
  String? imageUrl;
  bool? isSelected;

  SideBarItemModel(
      {this.itemName = '', this.imageUrl = '', this.isSelected = false});
}
