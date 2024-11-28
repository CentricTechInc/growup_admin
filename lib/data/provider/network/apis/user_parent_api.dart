import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:intl/intl.dart';

enum UserParentApiType {
  getParentTable,
  searchParentTable,
  getParentDetail,
  getDetail,
  getUserBeneficiary,
  getActivity,
  getGiftsPayout,
  getGiftsContributions,
  deleteGift,
  deleteBenefeciary,
  changeGiftStatus,
  exportParentTable,
  dateFilterTable,
  postGiftPayout,
}

class UserParentApi implements APIRequestRepresentable {
  UserParentApiType type;
  String? search;
  String? userId, pageId, status, role, amount;
  int? pageNo, id, giftId, benefeciaryId;
  DateRangeModel? dateTime;
  CalendarPeriod? calendarPeriod;

  UserParentApi._({
    required this.type,
    this.search,
    this.userId,
    this.pageId,
    this.status,
    this.pageNo,
    this.id,
    this.giftId,
    this.role,
    this.dateTime,
    this.calendarPeriod,
    this.benefeciaryId,
    this.amount,
  });

  UserParentApi.getParentTable(int pageNo)
      : this._(
          type: UserParentApiType.getParentTable,
          pageNo: pageNo,
        );

  UserParentApi.searchParentTable(String search, int pageNo)
      : this._(
          type: UserParentApiType.searchParentTable,
          search: search,
          pageNo: pageNo,
        );

  UserParentApi.dateFilterParentTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo)
      : this._(
          type: UserParentApiType.dateFilterTable,
          dateTime: dateTime,
          calendarPeriod: period,
          pageNo: pageNo,
        );

  UserParentApi.parentDetailPayoutTable(String userId, int pageNo)
      : this._(
          type: UserParentApiType.getGiftsPayout,
          pageNo: pageNo,
          userId: userId,
        );

  UserParentApi.postGiftPayout(String amount, int benefeciaryId, int giftId)
      : this._(
          type: UserParentApiType.postGiftPayout,
          amount: amount,
          benefeciaryId: benefeciaryId,
          giftId: giftId,
        );

  UserParentApi.getDetail(
    String userId,
    String status,
  ) : this._(
          type: UserParentApiType.getDetail,
          userId: userId,
          status: status,
        );

  UserParentApi.getUserBeneficiary(String userId, String pageId)
      : this._(
          type: UserParentApiType.getUserBeneficiary,
          userId: userId,
          pageId: pageId,
        );

  UserParentApi.getActivity(String userId, String pageId)
      : this._(
          type: UserParentApiType.getActivity,
          userId: userId,
          pageId: pageId,
        );

  UserParentApi.getGiftsContributions(int giftId, int pageId)
      : this._(
          type: UserParentApiType.getGiftsContributions,
          giftId: giftId,
          pageNo: pageId,
        );

  UserParentApi.deleteGift(int id)
      : this._(
          type: UserParentApiType.deleteGift,
          id: id,
        );

  UserParentApi.deletebenefeciary(int id)
      : this._(
          type: UserParentApiType.deleteBenefeciary,
          id: id,
        );

  UserParentApi.changeGiftStatus(String status, int id)
      : this._(
          type: UserParentApiType.changeGiftStatus,
          status: status,
          id: id,
        );

  UserParentApi.getParentDetail(int id)
      : this._(
          type: UserParentApiType.getParentDetail,
          id: id,
        );

  UserParentApi.exportParentTable(String role)
      : this._(
          type: UserParentApiType.exportParentTable,
          role: role,
        );

  @override
  get body {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getParentDetail:
      case UserParentApiType.getUserBeneficiary:
      case UserParentApiType.getActivity:
      case UserParentApiType.getGiftsPayout:
      case UserParentApiType.getGiftsContributions:
      case UserParentApiType.deleteGift:
      case UserParentApiType.deleteBenefeciary:
      case UserParentApiType.exportParentTable:
      case UserParentApiType.dateFilterTable:
        return {};
      case UserParentApiType.postGiftPayout:
        return {
          'amount': amount?.toString() ?? '',
          'BeneficiaryId': benefeciaryId?.toString() ?? '',
          'GiftId': giftId?.toString() ?? '',
        };
      case UserParentApiType.changeGiftStatus:
        return {
          'status': status,
          'giftId': id,
        };
    }
  }

  @override
  String get path {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
      case UserParentApiType.dateFilterTable:
        return '${APIEndpoint.userParentTableUrl}/$pageNo';
      case UserParentApiType.getDetail:
        return APIEndpoint.userParentDetailsUrl;
      case UserParentApiType.getUserBeneficiary:
        return APIEndpoint.userBeneficiariesUrl;
      case UserParentApiType.getActivity:
        return '${APIEndpoint.getActivityUrl}/$userId/$pageId';
      case UserParentApiType.getGiftsPayout:
        return '${APIEndpoint.giftDetailsPayoutUrl}/$userId/$pageNo';
      case UserParentApiType.postGiftPayout:
        return APIEndpoint.giftDetailsPayoutUrl;
      case UserParentApiType.getGiftsContributions:
        return '${APIEndpoint.getGiftContributorUrl}/$giftId/$pageNo';
      case UserParentApiType.deleteGift:
        return '${APIEndpoint.giftsUrl}/$id';
      case UserParentApiType.deleteBenefeciary:
        return '${APIEndpoint.userBenefeciaryUrl}/$id';
      case UserParentApiType.changeGiftStatus:
        return APIEndpoint.changeGiftStatusUrl;
      case UserParentApiType.getParentDetail:
        return '${APIEndpoint.parentDetailUrl}/$id';
      case UserParentApiType.exportParentTable:
        return APIEndpoint.exportExcelUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch(type){
      case UserParentApiType.postGiftPayout:
        return {
          'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
          'accept': '*/*',
          'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}',
        };
      default:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*',
          'Authorization': 'Bearer ${LocalStorageService.instance.user?.token}',
        };
    }

  }

  @override
  HTTPMethod get method {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getUserBeneficiary:
      case UserParentApiType.getActivity:
      case UserParentApiType.searchParentTable:
      case UserParentApiType.getGiftsPayout:
      case UserParentApiType.getGiftsContributions:
      case UserParentApiType.getParentDetail:
      case UserParentApiType.exportParentTable:
      case UserParentApiType.dateFilterTable:
        return HTTPMethod.get;
      case UserParentApiType.deleteGift:
      case UserParentApiType.deleteBenefeciary:
        return HTTPMethod.delete;
      case UserParentApiType.changeGiftStatus:
        return HTTPMethod.put;
      case UserParentApiType.postGiftPayout:
        return HTTPMethod.post;
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
        return {
          'search': search ?? '',
        };
      case UserParentApiType.getDetail:
        return {'userId': userId ?? '', 'status': status ?? ''};
      case UserParentApiType.getUserBeneficiary:
        return {'userId': userId ?? '', 'pageNumber': pageId ?? ''};
      case UserParentApiType.exportParentTable:
        return {
          'role': role ?? '',
        };
      case UserParentApiType.dateFilterTable:
        return {
          'date': dateTime != null
              ? '${DateFormat('yyyy-MM-dd').format(dateTime?.from ?? DateTime.now())}/${DateFormat('yyyy-MM-dd').format(dateTime?.to ?? DateTime.now())}'
              : '',
          'period': calendarPeriod?.name ?? '',
        };

      default:
        return {};
    }
  }
}
