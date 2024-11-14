class TopContributorsChartDto {
  bool? status;
  String? message;
  Data? data;

  TopContributorsChartDto({this.status, this.message, this.data});

  TopContributorsChartDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  double? total;
  List<ContributorChartData>? chartData;

  Data({this.total, this.chartData});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['chartData'] != null) {
      chartData = <ContributorChartData>[];
      json['chartData'].forEach((v) {
        chartData!.add(ContributorChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    return data;
  }
}

class ContributorChartData {
  String? month;
  double? parent;
  double? contributor;

  ContributorChartData({this.month, this.parent, this.contributor});

  ContributorChartData.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    parent = double.tryParse(json['parent'].toString());
    contributor = double.tryParse(json['contributor'].toString());
  }
}
