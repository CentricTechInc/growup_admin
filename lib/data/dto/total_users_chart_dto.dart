class TotalUsersChartDto {
  bool? status;
  String? message;
  Data? data;

  TotalUsersChartDto({this.status, this.message, this.data});

  TotalUsersChartDto.fromJson(Map<String, dynamic> json) {
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
  int? totalUsers;
  int? parents;
  double? parentsPercentage;
  int? contributors;
  double? contributorPecentage;

  Data(
      {this.totalUsers,
      this.parents,
      this.parentsPercentage,
      this.contributors,
      this.contributorPecentage});

  Data.fromJson(Map<String, dynamic> json) {
    totalUsers = json['totalUsers'];
    parents = json['parents'];
    parentsPercentage = json['parentsPercentage'];
    contributors = json['contributors'];
    contributorPecentage = json['contributorPecentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalUsers'] = totalUsers;
    data['parents'] = parents;
    data['parentsPercentage'] = parentsPercentage;
    data['contributors'] = contributors;
    data['contributorPecentage'] = contributorPecentage;
    return data;
  }
}
