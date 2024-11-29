import 'package:grow_up_admin_panel/app/services/local_storage.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_endpoints.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_provider.dart';
import 'package:grow_up_admin_panel/data/provider/network/api_request_representable.dart';
import 'package:grow_up_admin_panel/domain/entities/date_range_model.dart';
import 'package:intl/intl.dart';

enum ModuleApiType {
  getGiftingTable,
  getPayoutTable,
  getContributionTable,
  dateFilterGiftings,
  dateFilterContributions,
  dateFilterPayout,
}

class ModuleApi implements APIRequestRepresentable {
  ModuleApiType type;
  String? search;
  int? pageNo, id;

  DateRangeModel? dateTime;
  CalendarPeriod? calendarPeriod;

  ModuleApi._({
    required this.type,
    this.search,
    this.pageNo,
    this.id,
    this.dateTime,
    this.calendarPeriod,
  });

  ModuleApi.getGiftingTable(int pageNo, String? search)
      : this._(
          type: ModuleApiType.getGiftingTable,
          pageNo: pageNo,
          search: search,
        );

  ModuleApi.getPayoutTable(int pageNo, String? search)
      : this._(
          type: ModuleApiType.getPayoutTable,
          pageNo: pageNo,
          search: search,
        );

  ModuleApi.getContributionTable(int pageNo, String? search)
      : this._(
          type: ModuleApiType.getContributionTable,
          pageNo: pageNo,
          search: search,
        );

  ModuleApi.dateFilterGiftings(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo)
      : this._(
          type: ModuleApiType.dateFilterGiftings,
          dateTime: dateTime,
          calendarPeriod: period,
          pageNo: pageNo,
        );

  ModuleApi.dateFilterContributions(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo)
      : this._(
          type: ModuleApiType.dateFilterContributions,
          dateTime: dateTime,
          calendarPeriod: period,
          pageNo: pageNo,
        );

  ModuleApi.dateFilterPayout(
      DateRangeModel? dateTime, CalendarPeriod? period, int pageNo)
      : this._(
          type: ModuleApiType.dateFilterPayout,
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
      case ModuleApiType.getGiftingTable:
      case ModuleApiType.dateFilterGiftings:
        return APIEndpoint.giftingTableUrl;
      case ModuleApiType.getPayoutTable:
      case ModuleApiType.dateFilterPayout:
        return APIEndpoint.payoutTableUrl;
      case ModuleApiType.getContributionTable:
      case ModuleApiType.dateFilterContributions:
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
      case ModuleApiType.dateFilterGiftings:
      case ModuleApiType.dateFilterContributions:
      case ModuleApiType.dateFilterPayout:
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
      case ModuleApiType.getGiftingTable:
      case ModuleApiType.getPayoutTable:
        return {
          'pageNumber': pageNo?.toString() ?? '0',
          'search': search ?? ''
        };
      case ModuleApiType.dateFilterGiftings:
      case ModuleApiType.dateFilterContributions:
      case ModuleApiType.dateFilterPayout:
        return {
          'pageNumber': pageNo?.toString() ?? '0',
          'date': dateTime != null
              ? '${DateFormat('yyyy-MM-dd').format(dateTime?.from ?? DateTime.now())}/${DateFormat('yyyy-MM-dd').format(dateTime?.to ?? DateTime.now())}'
              : '',
          'period': calendarPeriod?.name ?? '',
        };
    }
  }
}
