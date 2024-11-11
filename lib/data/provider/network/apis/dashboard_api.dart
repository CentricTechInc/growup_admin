import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum ApiType { dashboardListing }

class DashboardApi extends APIRequestRepresentable {
  ApiType apiType;
  DashboardApi._({required this.apiType});
  DashboardApi.dashboardListing() : this._(apiType: ApiType.dashboardListing);

  @override
  get body {
    switch (apiType) {
      case ApiType.dashboardListing:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    switch (apiType) {
      case ApiType.dashboardListing:
        return {
          'accept': ' */*',
          'Content-Type': 'application/json; charset=utf-8',
          'authorization':
              'Bearer ${LocalStorageService.instance.user?.token ?? ''}',
        };
    }
  }

  @override
  HTTPMethod get method {
    switch (apiType) {
      case ApiType.dashboardListing:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (apiType) {
      case ApiType.dashboardListing:
        return APIEndpoint.dashboardListingUrl;

      default:
        return '';
    }
  }

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;

  @override
  Map<String, String>? get urlParams {
    switch (apiType) {
      case ApiType.dashboardListing:
        return {};
    }
  }
}
