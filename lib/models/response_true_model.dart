class ResponseTrueModel {
  String? responseStatus;
  String? responseCode;
  List<ResponseData>? responseData;

  ResponseTrueModel(
      {this.responseStatus, this.responseCode, this.responseData});

  ResponseTrueModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    responseCode = json['ResponseCode'];
    if (json['ResponseData'] != null) {
      responseData = <ResponseData>[];
      json['ResponseData'].forEach((v) {
        responseData!.add(new ResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseCode'] = this.responseCode;
    if (this.responseData != null) {
      data['ResponseData'] = this.responseData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseData {
  String? rollerid;
  String? username;
  String? password;

  ResponseData({this.rollerid, this.username, this.password});

  ResponseData.fromJson(Map<String, dynamic> json) {
    rollerid = json['rollerid'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rollerid'] = this.rollerid;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
