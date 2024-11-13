class ActiveUsersChartDto {
  bool? status;
  String? message;
  Data? data;

  ActiveUsersChartDto({this.status, this.message, this.data});

  ActiveUsersChartDto.fromJson(Map<String, dynamic> json) {
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
  List<Parentusers>? parentusers;
  List<Parentusers>? contributorusers;

  Data({this.parentusers, this.contributorusers, this.totalUsers});

  Data.fromJson(Map<String, dynamic> json) {
    totalUsers = json['totalUsers'];
    if (json['parentusers'] != null) {
      parentusers = <Parentusers>[];
      json['parentusers'].forEach((v) {
        parentusers!.add(Parentusers.fromJson(v));
      });
    }
    if (json['contributorusers'] != null) {
      contributorusers = <Parentusers>[];
      json['contributorusers'].forEach((v) {
        contributorusers!.add(Parentusers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (parentusers != null) {
      data['parentusers'] = parentusers!.map((v) => v.toJson()).toList();
    }
    if (contributorusers != null) {
      data['contributorusers'] =
          contributorusers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parentusers {
  String? total;
  String? date;

  Parentusers({this.total, this.date});

  Parentusers.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['total'] = total;
    data['date'] = date;
    return data;
  }
}
