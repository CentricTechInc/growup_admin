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
  List<ChartData>? chartData;

  Data({this.total, this.chartData});

  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['chartData'] != null) {
      chartData = <ChartData>[];
      json['chartData'].forEach((v) {
        chartData!.add(ChartData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    if (chartData != null) {
      data['chartData'] = chartData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartData {
  String? month;
  String? role;
  double? total;

  ChartData({this.month, this.role, this.total});

  ChartData.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    role = json['role'];
    total = double.tryParse(json['total'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['month'] = month;
    data['role'] = role;
    data['total'] = total;
    return data;
  }
}
