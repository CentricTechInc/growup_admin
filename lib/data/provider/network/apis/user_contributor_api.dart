import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:intl/intl.dart';

enum UserContrbutorApiType {
  getContributorTable,
  searchContributorTable,
  dateFilterTable,
}

class UserContributorApi implements APIRequestRepresentable {
  UserContrbutorApiType type;
  String? search, amount;
  int? pageNo;
  DateRangeModel? dateTime;
  CalendarPeriod? calendarPeriod;

  UserContributorApi._({
    required this.type,
    this.search,
    this.pageNo,
    this.dateTime,
    this.calendarPeriod,
    this.amount,
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

  UserContributorApi.dateFilterContributorTable(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo)
      : this._(
          type: UserContrbutorApiType.dateFilterTable,
          dateTime: dateTime,
          calendarPeriod: period,
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
      case UserContrbutorApiType.getContributorTable:
      case UserContrbutorApiType.searchContributorTable:
      case UserContrbutorApiType.dateFilterTable:
        return '${APIEndpoint.userContributorTableUrl}/$pageNo';
    }
  }

  @override
  Map<String, String>? get headers {
    return {
      'Content-Type': 'application/json; charset=utf-8',
      'accept': '*/*',
      'authorization': 'Bearer ${LocalStorageService.instance.user?.token}',
    };
  }

  @override
  HTTPMethod get method {
    switch (type) {
      case UserContrbutorApiType.getContributorTable:
      case UserContrbutorApiType.searchContributorTable:
      case UserContrbutorApiType.dateFilterTable:
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
      case UserContrbutorApiType.dateFilterTable:
        return {
          'date': dateTime != null
              ? '${DateFormat('yyyy-MM-dd').format(dateTime?.from ?? DateTime.now())}/${DateFormat('yyyy-MM-dd').format(dateTime?.to ?? DateTime.now())}'
              : '',
          'period': calendarPeriod?.name ?? '',
        };
      case UserContrbutorApiType.searchContributorTable:
        return {'search': search ?? ''};
      case UserContrbutorApiType.getContributorTable:
        return {};
    }
  }
}
