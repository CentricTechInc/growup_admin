import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum UserContrbutorApiType {
  getContributorTable,
  searchContributorTable,
}

class UserContributorApi implements APIRequestRepresentable {
  UserContrbutorApiType type;
  String? search;
  int? pageNo;

  UserContributorApi._({
    required this.type,
    this.search,
    this.pageNo,
  });

  UserContributorApi.getContributorTable(int pageNo)
      : this._(
          type: UserContrbutorApiType.getContributorTable,
          pageNo: pageNo,
        );

  UserContributorApi.searchContributorTable(int pageNo, String search)
      : this._(
            type: UserContrbutorApiType.searchContributorTable,
            pageNo: pageNo,
            search: search);

  @override
  get body {
    switch (type) {
      default:
        return {};
    }
  }

  @override
  String get path {
    switch (type) {
      case UserContrbutorApiType.getContributorTable:
      case UserContrbutorApiType.searchContributorTable:
        return '${APIEndpoint.userContributorTableUrl}/$pageNo';
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserContrbutorApiType.getContributorTable:
      case UserContrbutorApiType.searchContributorTable:
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
      case UserContrbutorApiType.getContributorTable:
      case UserContrbutorApiType.searchContributorTable:
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
      case UserContrbutorApiType.searchContributorTable:
        return {'search': search ?? ''};
      case UserContrbutorApiType.getContributorTable:
        return {};
    }
  }
}
