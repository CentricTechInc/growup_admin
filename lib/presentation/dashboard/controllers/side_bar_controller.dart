import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  int selectedItemIndex = 0;
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> notificationFormKey = GlobalKey<FormState>();

  List<SideBarItemModel> sideBarList = [
    // SideBarItemModel(
    //     itemName: 'Dashboard',
    //     isSelected: true,
    //     imageUrl: AssetIcons.dashboard),
    // SideBarItemModel(itemName: 'Users', imageUrl: AssetIcons.users),
    // SideBarItemModel(
    //     itemName: 'Registered QR\'s', imageUrl: AssetIcons.registeredQR),
    // SideBarItemModel(itemName: 'Generated QR\'s', imageUrl: AssetIcons.newQR),
    // SideBarItemModel(itemName: 'Payments', imageUrl: AssetIcons.payments),
    // SideBarItemModel(
    //     itemName: 'Notifications', imageUrl: AssetIcons.notifications),
    // SideBarItemModel(
    //     itemName: 'Privacy Policies', imageUrl: AssetIcons.privacyPolicy),
    // SideBarItemModel(
    //     itemName: 'Printing Request', imageUrl: AssetIcons.shippingQrIcon),
    // SideBarItemModel(
    //     itemName: 'Complaints', imageUrl: AssetIcons.shippingQrIcon),
  ];
  final List<String> newQRTableHeaderList = [
    'SR. No.',
    'QR ID',
    'Category',
    'Register Date & Time',
  ];

  ///PAGINATION+++++++++++++++++++++_---------
  int elementCount = 1;
  int pageSize = 10;

  ///Registered QR------
  int registeredQrPageNo = 1;

  ///Generated QR------
  int generatedQrPageNo = 1;

  ///Payment QR------
  int paymentPageNo = 1;

  ///Notification QR------
  int notificationPageNo = 1;

  ///PrintingRequest QR------
  int printReqPageNo = 1;

  ///PrintingRequest QR------
  int usersPageNo = 1;

  ///Complaints------
  int complaintsPageNo = 1;

  ///++++++++++++++++++++++++++++++++++++++++++++++
  @override
  onReady() {
    // if (LocalStorageService.instance.user == null) {
    //   globalContext!.go(PagePath.login);
    //   return;
    // }
    // pageRefresh();
    // getDashboardData();
    super.onReady();
  }

  // void pageRefresh() {
  //   selectedItemIndex = 0;
  //   globalContext!.go(PagePath.adminDashboard);
  // }

//
  // DashboardRepository dashboardRepository = DashboardRepositoryImpl();

  //
  TextEditingController userSearchController = TextEditingController();
  TextEditingController registerQrSearchController = TextEditingController();
  TextEditingController newQrSearchController = TextEditingController();
  TextEditingController paymentSearchController = TextEditingController();

  //
  final List<String> selectedQr = [];
  // List<RegisteredQRDto> registeredQrsList = [];
  // List<RegisteredQRDto> searchRegisteredQrsList = [];
  // List<RegisteredQRDto> newQrsList = [];
  // final List<RegisteredQRDto> enabledUsers = [];
  // List<PaymentModel> paymentLogs = [];

  // DashboardCountsDto? dashboardCountsDto;
  // List<ProgressTileModel> progressTileList = [
  //   ProgressTileModel(
  //       title: 'Total QR Codes',
  //       progressScore: 850,
  //       progressPercent: 3.0,
  //       isNegative: false,
  //       color: Colors.blue.shade50),
  //   ProgressTileModel(
  //       title: 'Un-Registered',
  //       progressScore: 261,
  //       progressPercent: 6.0,
  //       isNegative: true,
  //       color: const Color(0xffF7EDD5)),
  //   ProgressTileModel(
  //       title: 'Registered',
  //       progressScore: 312,
  //       progressPercent: 3.0,
  //       color: const Color(0xffF5F5F5)),
  //   ProgressTileModel(
  //       title: 'Enabled', progressScore: 250, color: const Color(0xffE9F7F2)),
  //   ProgressTileModel(
  //       title: 'Disabled',
  //       progressScore: 62,
  //       progressPercent: 2.0,
  //       isNegative: true,
  //       color: const Color(0xffFFECEE))
  // ];
  final List<String> complainListHeader = [
    'Complaint no',
    'Complainer Name',
    'Subject',
    'Description',
    'Date',
  ];

  //
  // userExportData() async {
  //   try {
  //     ShowLoader.showLoading(false);
  //     await dashboardRepository.getUsersExport();
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //         message: 'File Downloaded', type: SnackBarType.success);
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // registeredQrExport() async {
  //   try {
  //     ShowLoader.showLoading(false);
  //     await dashboardRepository.registeredQrExport();
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //         message: 'File Downloaded', type: SnackBarType.success);
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // unRegisteredQrExport() async {
  //   try {
  //     ShowLoader.showLoading(false);
  //     await dashboardRepository.unRegisteredQrExport();
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //         message: 'File Downloaded', type: SnackBarType.success);
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // getDashboardData() async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     ///Counts
  //     dashboardCountsDto = await dashboardRepository.getDashboardCounts();

  //     ///Enabled Users
  //     final users = await dashboardRepository.getRegisteredQrs(
  //         registeredQrPageNo, pageSize);
  //     enabledUsers.clear();
  //     enabledUsers.addAll(users.data);

  //     ///getPaymentLogs
  //     final logs = await dashboardRepository.getPaymentHistory(1, 10);
  //     paymentLogs.clear();
  //     paymentLogs.addAll(logs.data);
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // searchRegisteredQrs(String val) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final res = await dashboardRepository.searchRegisteredQrs(val);
  //     searchRegisteredQrsList.clear();
  //     searchRegisteredQrsList.addAll(res);
  //     // print(res.count);
  //     // elementCount = res.count ?? 1;
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // searchUsers(String val) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final res = await dashboardRepository.searchUsers(val);
  //     searchUsersList.clear();
  //     searchUsersList.addAll(res);
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // searchPayment(String val) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final res = await dashboardRepository.searchPayment(val);
  //     searchPaymentLogs.clear();
  //     searchPaymentLogs.addAll(res);
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // getAllRegisteredQrs() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final res = await dashboardRepository.getRegisteredQrs(
  //         registeredQrPageNo, pageSize);
  //     registeredQrsList.clear();
  //     registeredQrsList.addAll(res.data);
  //     print(res.count);
  //     elementCount = res.count ?? 1;
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     print(e);
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //     ShowLoader.hideLoading();
  //   }
  // }

  // deleteQR(String qrGuid) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     String response = await dashboardRepository.deleteQrCode(qrGuid);
  //     print(response);
  //     update();
  //     CommonSnackBar.message(message: response, type: SnackBarType.success);
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   } finally {
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   }
  // }

  // getAllNewQrs() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response = await dashboardRepository.getUnRegisteredQrs(
  //         generatedQrPageNo, pageSize);
  //     newQrsList.clear();
  //     newQrsList.addAll(response.data);
  //     print(response.count);
  //     elementCount = response.count ?? 1;
  //     ShowLoader.hideLoading();
  //     update();
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  TextEditingController nameOfQrController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otherUrlController = TextEditingController();
  TextEditingController messageOnQRController = TextEditingController();

//
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController subscriptionTillController = TextEditingController();
  TextEditingController registeredOnController = TextEditingController();
  TextEditingController subscriptionPlanController = TextEditingController();

  //
  // UpdateQRDto data = UpdateQRDto();

  // updateQrData(UpdateQRDto updateData) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response = await dashboardRepository.updateQrData(updateData);
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   } finally {
  //     ShowLoader.hideLoading();
  //     getAllRegisteredQrs();
  //   }
  // }

  // List<UserModelDto> usersList = [];
  // List<UserModelDto> searchUsersList = [];

  // getAllUsers() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final res = await dashboardRepository.getAllUsers(usersPageNo, pageSize);
  //     usersList.clear();
  //     usersList.addAll(res.data);
  //     elementCount = res.count ?? 1;
  //     update();
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // TextEditingController vaildityController = TextEditingController();
  // final categoryController = TextEditingController(text: 'Automobile');
  // final quantityController = TextEditingController(text: '1');
  // final List<GenerateQRResponseDto> generatedQRList = [];

  int getSerialNumber(
      {required int currentPage,
      required int index,
      required int itemsPerPage}) {
    return ((currentPage - 1) * itemsPerPage) + index + 1;
  }

  // generateNewQR(String userId) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     if (vaildityController.text.isEmpty) {
  //       ShowLoader.hideLoading();
  //       CommonSnackBar.message(
  //           message: 'No date selected'.toString(), type: SnackBarType.error);
  //       return;
  //     }
  //     final response = await dashboardRepository.generateQrCode(
  //       userId,
  //       DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
  //           .format(DateTime.parse(vaildityController.text)),
  //       int.tryParse(quantityController.text) ?? 1,
  //       categoryController.text,
  //     );
  //     ShowLoader.hideLoading();
  //     generatedQRList.clear();
  //     generatedQRList.addAll(response);
  //     CommonSnackBar.message(
  //         message: 'QR has been generated'.toString(),
  //         type: SnackBarType.success);

  //     categoryController.clear();
  //     quantityController.clear();
  //     // if (response.guid != null) {
  //     //   globalContext!.pop();
  //     // }
  //     // globalContext!.pop();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     print(e);
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // Future<List<RegisteredQRDto>> getQrsById(String id) async {
  //   try {
  //     List<RegisteredQRDto> qrList = await dashboardRepository.getQrsById(id);
  //     return qrList;
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  //   return [];
  // }

  // RegisteredQRDto qrData = RegisteredQRDto();

  // getQrsByGuid(String guid) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     qrData = await dashboardRepository.getQrByGuid(guid);
  //     ShowLoader.hideLoading();
  //   } catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

//

  bool noRecordFound = false;

  // userSearch(String p0) {
  //   searchUsersList = usersList.where(
  //     (user) {
  //       return user.userName!.toLowerCase().contains(p0.toLowerCase());
  //     },
  //   ).toList();
  //   if (searchUsersList.isEmpty) {
  //     noRecordFound = true;
  //   } else {
  //     noRecordFound = false;
  //   }
  //   update();
  // }

  bool registeredQRRecordNotFound = false;

  // registerQRSearch(String p0) {
  //   searchRegisteredQrsList = registeredQrsList.where(
  //     (qr) {
  //       return qr.qRCodeName!.toLowerCase().contains(p0.toLowerCase());
  //     },
  //   ).toList();
  //   if (searchRegisteredQrsList.isEmpty) {
  //     registeredQRRecordNotFound = true;
  //   } else {
  //     registeredQRRecordNotFound = false;
  //   }
  //   update();
  // }

  // final List<NotificationModel> notificationList = [];
  // final List<ShippingRequestModel> printingRequestList = [];
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

  // createNotification() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response = await dashboardRepository.createNotification(
  //         titleController.text, bodyController.text);
  //     ShowLoader.hideLoading();
  //     if (response == 'Successfully Inserted') {
  //       globalContext?.pop();
  //       getNotifications();
  //     }
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // getShippingRequest() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response = await dashboardRepository.getShippingRequest(
  //         printReqPageNo, pageSize);
  //     ShowLoader.hideLoading();
  //     elementCount = response.count ?? 1;
  //     printingRequestList.clear();
  //     printingRequestList.addAll(response.data);
  //     update();
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // final List<ComplaintModel> complaintsList = [];

  // getComplaints() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response =
  //         await dashboardRepository.getComplaints(complaintsPageNo, pageSize);
  //     ShowLoader.hideLoading();
  //     elementCount = response.count ?? 1;
  //     complaintsList.clear();
  //     complaintsList.addAll(response.data);
  //     update();
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // updateShippingRequest(ShippingRequestModel model) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final response = await dashboardRepository.updateShippingRequest(model);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: response, type: SnackBarType.success);
  //   } catch (e) {
  //     print(e);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(message: e.toString());
  //   }
  // }

  // Future<String> downloadQrToDevice(List<String> qrGuid) async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     print(qrGuid);
  //     // final response = await dashboardRepository.updateShippingRequest(model);
  //     String baseUrl =
  //         "https://hrm.centrictech.net/api/QrCode/GetQrCodesDownload?";
  //     // Join all GUIDs with the '&guids=' separator
  //     String guidsParam = qrGuid.map((guid) => "guids=$guid").join('&');
  //     //@TODO CHANGE THE FOLLOWING URL WHEN SERVER CHANGES
  //     await launchUrl(Uri.parse('$baseUrl$guidsParam'),
  //         mode: LaunchMode.externalApplication);

  //     // final encodedStr = base64Image;
  //     // Uint8List bytes = base64.decode(encodedStr);
  //     // String dir = (await getDownloadsDirectory())!.path;
  //     // File file = File("$dir/$qrName.png");
  //     // if (await file.exists()) {
  //     //   CommonSnackBar.message(
  //     //       message: 'Image already exist.', type: SnackBarType.error);
  //     //   return '';
  //     // }
  //     // await file.writeAsBytes(bytes);
  //     // print(file.path);
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //         message: 'Image has been downloaded.', type: SnackBarType.success);
  //     // return file.path;
  //     generatedQRList.clear();
  //     return '';
  //   } on Exception catch (e) {
  //     ShowLoader.hideLoading();
  //     CommonSnackBar.message(
  //         message: 'An error occured!', type: SnackBarType.error);
  //     return '';
  //   }
  // }

  // getNotifications() async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     final res = await dashboardRepository.getNotification(
  //         notificationPageNo, pageSize);

  //     elementCount = res.count ?? 1;
  //     notificationList.clear();
  //     notificationList.addAll(res.data);
  //     update();
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // deleteNotification(int id) async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     final res = await dashboardRepository.deleteNotification(id.toString());
  //     CommonSnackBar.message(message: res, type: SnackBarType.success);

  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  ///PAYMENT WIDGET METHODS
  ///
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

  // paymentSearch(String p0) {
  //   searchPaymentLogs = paymentObj.where(
  //     (user) {
  //       return user.registeredName!.toLowerCase().contains(p0.toLowerCase());
  //     },
  //   ).toList();
  //   if (searchPaymentLogs.isEmpty) {
  //     paymentNoRecords = true;
  //   } else {
  //     paymentNoRecords = false;
  //   }
  //   update();
  // }

  // final List<ManageSubscriptionModel> subscriptionList = [];

  // manageSubscriptionList() async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     final res = await dashboardRepository.getManageSubscriptionList();
  //     print(res);

  //     if (selectedPageIndex == 0) {
  //       highlightController.text = res.first.highlights.toString();
  //       featureController.text = res.first.features.toString();
  //       priceController.text = res.first.price.toString();
  //     } else {
  //       {
  //         highlightController.text = res[1].highlights.toString();
  //         featureController.text = res[1].features.toString();
  //         priceController.text = res[1].price.toString();
  //       }
  //     }
  //     subscriptionList.addAll(res);
  //     print(subscriptionList);
  //     // print(paymentObj.first.paymentDateTime);
  //     update();
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // manageSubscriptionUpdate() async {
  //   try {
  //     ShowLoader.showLoading(true);
  //     final ManageSubscriptionModel subscriptionModel = ManageSubscriptionModel(
  //         highlights: highlightController.text,
  //         features: featureController.text,
  //         price: double.tryParse(priceController.text),
  //         type: selectedPageIndex == 0 ? 'Monthly' : 'Yearly');

  //     final res =
  //         await dashboardRepository.updateSubscription(subscriptionModel);

  //     update();
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //     CommonSnackBar.message(message: res, type: SnackBarType.success);
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // List<PaymentModel> paymentObj = [];
  // List<PaymentModel> paymentHisotryById = [];
  // List<PaymentModel> searchPaymentLogs = [];
  // int paymentTotalSum = 0;

  // getPayment() async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     final res =
  //         await dashboardRepository.getPaymentHistory(paymentPageNo, pageSize);

  //     paymentObj.clear();
  //     paymentObj.addAll(res.data);
  //     elementCount = res.count ?? 1;
  //     paymentTotalSum = res.extra ?? 0;
  //     update();
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }

  // getPaymentById(String id) async {
  //   try {
  //     ShowLoader.showLoading(true);

  //     final res = await dashboardRepository.getPaymentHistoryById(id, 1, 3);

  //     paymentHisotryById.clear();
  //     paymentHisotryById.addAll(res.data);
  //     // elementCount = res.count ?? 1;
  //     // paymentTotalSum = res.extra ?? 0;
  //     update();
  //     if (ShowLoader.isOpen) {
  //       ShowLoader.hideLoading();
  //     }
  //   } catch (e) {
  //     CommonSnackBar.message(message: e.toString(), type: SnackBarType.error);
  //   }
  // }
}

class SideBarItemModel {
  String? itemName;
  String? imageUrl;
  bool? isSelected;

  SideBarItemModel(
      {this.itemName = '', this.imageUrl = '', this.isSelected = false});
}
