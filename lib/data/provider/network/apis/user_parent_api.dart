import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';

enum UserParentApiType {
  getParentTable,
}

class UserParentApi implements APIRequestRepresentable {
  UserParentApiType type;
  String? search;

  UserParentApi._({
    required this.type,
    this.search,
  });

  UserParentApi.getParentTable()
      : this._(
          type: UserParentApiType.getParentTable,
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
      case UserParentApiType.getParentTable:
        return APIEndpoint.loginUrl;
    }
  }

  @override
  Map<String, String>? get headers {
    switch (type) {
      case UserParentApiType.getParentTable:
        return {
          'Content-Type': 'application/json; charset=utf-8',
          'accept': '*/*'
        };
      default:
        return {};
    }
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case UserParentApiType.getParentTable:
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
        return {};
    }
  }
}
