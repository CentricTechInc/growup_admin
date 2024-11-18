import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum UserParentApiType {
  getParentTable,
  searchParentTable,
  getDetail,
  getUserBeneficiary,
  getActivity,
  getGiftsPayout,
  getGiftsContributions,
  deleteGift,
  deleteBenefeciary,
}

class UserParentApi implements APIRequestRepresentable {
  UserParentApiType type;
  String? search;
  String? userId, pageId, status;
  int? pageNo, id;

  UserParentApi._({
    required this.type,
    this.search,
    this.userId,
    this.pageId,
    this.status,
    this.pageNo,
    this.id,
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

  UserParentApi.parentDetailPayoutTable(String userId, int pageNo)
      : this._(
          type: UserParentApiType.getGiftsPayout,
          pageNo: pageNo,
          userId: userId,
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

  UserParentApi.getGiftsContributions(String userId, int pageId)
      : this._(
          type: UserParentApiType.getGiftsContributions,
          userId: userId,
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

  @override
  get body {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getUserBeneficiary:
      case UserParentApiType.getActivity:
      case UserParentApiType.getGiftsPayout:
      case UserParentApiType.getGiftsContributions:
      case UserParentApiType.deleteGift:
      case UserParentApiType.deleteBenefeciary:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
        return '${APIEndpoint.userParentTableUrl}/$pageNo';
      case UserParentApiType.getDetail:
        return APIEndpoint.userParentDetailsUrl;
      case UserParentApiType.getUserBeneficiary:
        return APIEndpoint.userBeneficiariesUrl;
      case UserParentApiType.getActivity:
        return '${APIEndpoint.getActivityUrl}/$userId/$pageId';
      case UserParentApiType.getGiftsPayout:
        return '${APIEndpoint.giftDetailsPayoutUrl}/$userId/$pageNo';
      case UserParentApiType.getGiftsContributions:
        return '${APIEndpoint.getGiftContributorUrl}/$userId/$pageNo';
      case UserParentApiType.deleteGift:
        return '${APIEndpoint.giftsUrl}/$id';
      case UserParentApiType.deleteBenefeciary:
        return '${APIEndpoint.userBenefeciaryUrl}/$id';
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.searchParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getUserBeneficiary:
      case UserParentApiType.getActivity:
      case UserParentApiType.getGiftsPayout:
      case UserParentApiType.getGiftsContributions:
      case UserParentApiType.deleteGift:
      case UserParentApiType.deleteBenefeciary:
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
        return HTTPMethod.get;
      case UserParentApiType.deleteGift:
      case UserParentApiType.deleteBenefeciary:
        return HTTPMethod.delete;
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
      default:
        return {};
    }
  }
}
