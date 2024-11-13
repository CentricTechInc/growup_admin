import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum UserParentApiType { getParentTable, getDetail, getUserBeneficiary }

class UserParentApi implements APIRequestRepresentable {
  UserParentApiType type;
  String? search;
  String? userId, pageId;
  UserParentApi._({required this.type, this.search, this.userId, this.pageId});

  UserParentApi.getParentTable()
      : this._(
          type: UserParentApiType.getParentTable,
        );
  UserParentApi.getDetail(
    String userId,
  ) : this._(
          type: UserParentApiType.getDetail,
          userId: userId,
        );
  UserParentApi.getUserBeneficiary(String userId, String pageId)
      : this._(
          type: UserParentApiType.getUserBeneficiary,
          userId: userId,
          pageId: pageId,
        );

  @override
  get body {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getUserBeneficiary:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case UserParentApiType.getParentTable:
        return '${APIEndpoint.userParentTableUrl}/1';
      case UserParentApiType.getDetail:
        return APIEndpoint.userParentDetailsUrl;
      case UserParentApiType.getUserBeneficiary:
        return APIEndpoint.userBeneficiariesUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserParentApiType.getParentTable:
      case UserParentApiType.getDetail:
      case UserParentApiType.getUserBeneficiary:
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
        return HTTPMethod.get;
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
      case UserParentApiType.getDetail:
        return {'userId': userId ?? ''};
      case UserParentApiType.getUserBeneficiary:
        return {'userId': userId ?? '', 'pageNumber': pageId ?? ''};
    }
  }
}
