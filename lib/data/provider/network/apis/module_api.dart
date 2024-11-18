import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum ModuleApiType {
  getGiftingTable,
  getPayoutTable,
  getContributionTable,
}

class ModuleApi implements APIRequestRepresentable {
  ModuleApiType type;
  String? search;
  int? pageNo;

  ModuleApi._({
    required this.type,
    this.search,
    this.pageNo,
  });

  ModuleApi.getGiftingTable(int pageNo)
      : this._(
          type: ModuleApiType.getGiftingTable,
          pageNo: pageNo,
        );

  ModuleApi.getPayoutTable(int pageNo)
      : this._(
          type: ModuleApiType.getPayoutTable,
          pageNo: pageNo,
        );

  ModuleApi.getContributionTable(int pageNo)
      : this._(
          type: ModuleApiType.getContributionTable,
          pageNo: pageNo,
        );

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
      case ModuleApiType.getGiftingTable:
        return '${APIEndpoint.giftingTableUrl}/$pageNo';
      case ModuleApiType.getPayoutTable:
        return '${APIEndpoint.payoutTableUrl}/$pageNo';
      case ModuleApiType.getContributionTable:
        return APIEndpoint.contributionTableUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      default:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*',
          'authorization': 'Bearer ${LocalStorageService.instance.user?.token}',
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case ModuleApiType.getGiftingTable:
      case ModuleApiType.getPayoutTable:
      case ModuleApiType.getContributionTable:
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
      case ModuleApiType.getContributionTable:
        return {'pageNumber': pageNo?.toString() ?? '0'};
      case ModuleApiType.getGiftingTable:
      case ModuleApiType.getPayoutTable:
        return {};
    }
  }
}
