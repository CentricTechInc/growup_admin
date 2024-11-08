import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum UserContrbutorApiType {
  getContributorTable,
}

class UserContributorApi implements APIRequestRepresentable {
  UserContrbutorApiType type;
  String? search;

  UserContributorApi._({
    required this.type,
    this.search,
  });

  UserContributorApi.getContributorTable()
      : this._(
    type: UserContrbutorApiType.getContributorTable,
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
      case UserContrbutorApiType.getContributorTable:
        return '${APIEndpoint.contributorTableUrl}/1';
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserContrbutorApiType.getContributorTable:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*',
          // 'authorization': 'Bearer ${LocalStorageService.instance.user?.token}',
          'authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzaWduYXR1cmUiOjE3MzEwODA5Njk2NDAsImVtYWlsIjoic2FhZC5uYWVlbUBjZW50cmljdGVjaC5jbyIsImlhdCI6MTczMTA4MDk2OX0.8YHvoOlwd-aA519uG7kdKA0dXPnrO2nOwfWDQCiL3vA',
        };
      default:
        return {};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case UserContrbutorApiType.getContributorTable:
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
      case UserContrbutorApiType.getContributorTable:
        return {};
    }
  }
}
