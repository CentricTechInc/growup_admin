class ContributionFrequencyChartDto {
  bool? status;
  String? message;
  Data? data;

  ContributionFrequencyChartDto({this.status, this.message, this.data});

  ContributionFrequencyChartDto.fromJson(Map<String, dynamic> json) {
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
  String? totalCOntribution;
  List<Result>? result;

  Data({this.totalCOntribution, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    totalCOntribution = json['totalCOntribution'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCOntribution'] = totalCOntribution;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? month;
  String? frequency;
  double? percentage;

  Result({this.month, this.frequency, this.percentage});

  Result.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    frequency = json['frequency'];
    percentage = double.parse(json['percentage'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['month'] = month;
    data['frequency'] = frequency;
    data['percentage'] = percentage;
    return data;
  }
}
