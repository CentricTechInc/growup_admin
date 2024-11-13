import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_snack_bar.dart';
import 'package:grow_up_admin_panel/common/loader_widget.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/data/dto/gift_detail_dto.dart';
import 'package:grow_up_admin_panel/data/dto/user_bene_dto.dart';
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

  ///Registered QR------
  int payoutPageNo = 1;

  ///++++++++++++++++++++++++++++++++++++++++++++++

  int liveGiftingSelectedIndex = 0;
  int userParentSelectedIndex = 0;
  int userContributerSelectedIndex = 0;

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

  getParentTable() async {
    try {
      Loader.showLoader();
      final res = await userParentRepository.getParentTable();
      userParentModelList.clear();
      userParentModelList.addAll(res);
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getContributorsTable() async {
    try {
      Loader.showLoader();
      final res = await userContributorRepository.getContributorTable();
      userContributorModelList.clear();
      userContributorModelList.addAll(res);
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getGiftingTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getGiftingTable();
      giftingModelList.clear();
      giftingModelList.addAll(res);
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getPayoutTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getPayoutTable();
      payoutModelList.clear();
      payoutModelList.addAll(res);
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  getContributionTable() async {
    try {
      Loader.showLoader();
      final res = await moduleRepository.getContributionTable();
      contributionModelList.clear();
      contributionModelList.addAll(res);
      Loader.hideLoading();
    } catch (e) {
      Loader.hideLoading();
      CommonSnackBar.message(message: e.toString());
    }
  }

  Future<GiftDetailDto> getGiftDetail(String id) async {
    try {
      GiftDetailDto res = await userParentRepository.getGiftDetail(id);
      print(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserBeneficiaryDto> getUserBenes(String id, String page) async {
    try {
      UserBeneficiaryDto res =
          await userParentRepository.getUserBeneficiary(id, page);
      print(res);
      return res;
    } catch (e) {
      rethrow;
    }
  }

  int getSerialNumber(
      {required int currentPage,
      required int index,
      required int itemsPerPage}) {
    return ((currentPage - 1) * itemsPerPage) + index + 1;
  }

  final List<String> notificationTableHeaderList = [
    'Title',
    'Body Text',
    'Date & Time',
    'Status'
  ];
  final List<String> printingRequestTableHeaderList = [
    'QR Code ID',
    'Registrar Name',
    'Shipping Address',
    'Request Date',
    'Status',
    'Action',
  ];
  final List<String> registeredQRTableHeaderList = [
    'SR. No.',
    'QR ID',
    'Registered Name',
    'Subscription Purchased',
    'QR Registered Date',
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> generateQrformKey = GlobalKey<FormState>();
  final highlightController = TextEditingController();
  final featureController = TextEditingController();
  final priceController = TextEditingController();

  final pageController = PageController();
  int selectedPageIndex = 0;

  bool paymentNoRecords = false;

  TextEditingController searchPaymentController = TextEditingController();
  final List<String> paymentTableHeaderList = [
    'QR ID',
    'Registered Name',
    'Subscription Purchased',
    'Payment Date & Time',
    'Payment Recieved',
    'QR Registered',
    'Status'
  ];
}

class SideBarItemModel {
  String? itemName;
  String? imageUrl;
  bool? isSelected;

  SideBarItemModel(
      {this.itemName = '', this.imageUrl = '', this.isSelected = false});
}
