import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum ApiType {
  dashboardListing,
  topGiftingChart,
  topContributorsChart,
  activeUsersChart
}

class DashboardApi extends APIRequestRepresentable {
  ApiType apiType;
  String? filter;
  DashboardApi._({required this.apiType, this.filter});
  DashboardApi.dashboardListing() : this._(apiType: ApiType.dashboardListing);
  DashboardApi.topGiftingChart(String filter)
      : this._(apiType: ApiType.topGiftingChart, filter: filter);
  DashboardApi.topContributorsChart(String filter)
      : this._(apiType: ApiType.topContributorsChart, filter: filter);
  DashboardApi.activeUsersChart(String filter)
      : this._(apiType: ApiType.activeUsersChart, filter: filter);

  @override
  get body {
    switch (apiType) {
      case ApiType.dashboardListing:
      case ApiType.topGiftingChart:
      case ApiType.topContributorsChart:
      case ApiType.activeUsersChart:
        return {};
    }
  }

  @override
  String get endpoint => APIEndpoint.baseUrl;

  @override
  Map<String, String>? get headers {
    switch (apiType) {
      case ApiType.dashboardListing:
      case ApiType.topGiftingChart:
      case ApiType.topContributorsChart:
      case ApiType.activeUsersChart:
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
      case ApiType.topGiftingChart:
      case ApiType.topContributorsChart:
      case ApiType.activeUsersChart:
        return HTTPMethod.get;
    }
  }

  @override
  String get path {
    switch (apiType) {
      case ApiType.dashboardListing:
        return APIEndpoint.dashboardListingUrl;
      case ApiType.topGiftingChart:
        return APIEndpoint.topGiftingsUrl;
      case ApiType.topContributorsChart:
        return APIEndpoint.topContributorUrl;
      case ApiType.activeUsersChart:
        return APIEndpoint.activeUsersUrl;
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
      case ApiType.topGiftingChart:
      case ApiType.topContributorsChart:
      case ApiType.activeUsersChart:
        return {'filter': filter ?? ''};
    }
  }
}
