class ActiveUsersChartDto {
  bool? status;
  String? message;
  Data? data;

  ActiveUsersChartDto({this.status, this.message, this.data});

  ActiveUsersChartDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalUsers;
  Parentusers? parentusers;
  Parentusers? contributorusers;

  Data({this.totalUsers, this.parentusers, this.contributorusers});

  Data.fromJson(Map<String, dynamic> json) {
    totalUsers = json['totalUsers'];
    parentusers = json['parentusers'] != null
        ? new Parentusers.fromJson(json['parentusers'])
        : null;
    contributorusers = json['contributorusers'] != null
        ? new Parentusers.fromJson(json['contributorusers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalUsers'] = this.totalUsers;
    if (this.parentusers != null) {
      data['parentusers'] = this.parentusers!.toJson();
    }
    if (this.contributorusers != null) {
      data['contributorusers'] = this.contributorusers!.toJson();
    }
    return data;
  }
}

class Parentusers {
  List<Data1>? data;

  Parentusers({this.data});

  Parentusers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data1 {
  String? total;
  String? date;

  Data1({this.total, this.date});

  Data1.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['date'] = this.date;
    return data;
  }
}
