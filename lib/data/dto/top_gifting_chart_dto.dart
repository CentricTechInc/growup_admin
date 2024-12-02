class TopGiftingChartDto {
  bool? status;
  String? message;
  Data? data;

  TopGiftingChartDto({this.status, this.message, this.data});

  TopGiftingChartDto.fromJson(Map<String, dynamic> json) {
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
  double? totalContributions;
  List<Records>? records;

  Data({this.totalContributions, this.records});

  Data.fromJson(Map<String, dynamic> json) {
    print('THIS IS IN TOTAL CONTRIBUTIONS: ${double.parse(json['totalContributions'].toString())}');
    totalContributions = double.parse(json['totalContributions'].toString() =='0' ? '0.0' : json['totalContributions'].toString()).toDouble();
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalContributions'] = totalContributions;
    if (records != null) {
      data['records'] = records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  int? giftId;
  String? totalAmount;
  Gift? gift;

  Records({this.giftId, this.totalAmount, this.gift});

  Records.fromJson(Map<String, dynamic> json) {
    giftId = json['GiftId'];
    totalAmount = json['totalAmount'];
    gift = json['Gift'] != null ? Gift.fromJson(json['Gift']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['GiftId'] = giftId;
    data['totalAmount'] = totalAmount;
    if (gift != null) {
      data['Gift'] = gift!.toJson();
    }
    return data;
  }
}

class Gift {
  String? title;

  Gift({this.title});

  Gift.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    return data;
  }
}
