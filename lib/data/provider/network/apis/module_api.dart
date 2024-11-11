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

  ModuleApi._({
    required this.type,
    this.search,
  });

  ModuleApi.getGiftingTable()
      : this._(
          type: ModuleApiType.getGiftingTable,
        );

  ModuleApi.getPayoutTable()
      : this._(
          type: ModuleApiType.getPayoutTable,
        );

  ModuleApi.getContributionTable()
      : this._(
          type: ModuleApiType.getContributionTable,
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
        return '${APIEndpoint.giftingTableUrl}/1';
      case ModuleApiType.getPayoutTable:
        return '${APIEndpoint.payoutTableUrl}/1';
      case ModuleApiType.getContributionTable:
        return '${APIEndpoint.contributionTableUrl}/1';
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
          // 'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzaWduYXR1cmUiOjE3MzEwODA5Njk2NDAsImVtYWlsIjoic2FhZC5uYWVlbUBjZW50cmljdGVjaC5jbyIsImlhdCI6MTczMTA4MDk2OX0.8YHvoOlwd-aA519uG7kdKA0dXPnrO2nOwfWDQCiL3vA',
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
      default:
        return {};
    }
  }
}
