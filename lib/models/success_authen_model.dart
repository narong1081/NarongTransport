class SuccessAuthenModel {
  String? responseStatus;
  String? responseCode;
  String? responseMessages;
  List<ResponseData>? responseData;

  SuccessAuthenModel(
      {this.responseStatus,
      this.responseCode,
      this.responseMessages,
      this.responseData});

  SuccessAuthenModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    responseCode = json['ResponseCode'];
    responseMessages = json['ResponseMessages'];
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
    data['ResponseMessages'] = this.responseMessages;
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
  int? rowid;
  String? role;
  String? token;

  ResponseData(
      {this.rollerid,
      this.username,
      this.password,
      this.rowid,
      this.role,
      this.token});

  ResponseData.fromJson(Map<String, dynamic> json) {
    rollerid = json['rollerid'];
    username = json['username'];
    password = json['password'];
    rowid = json['rowid'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rollerid'] = this.rollerid;
    data['username'] = this.username;
    data['password'] = this.password;
    data['rowid'] = this.rowid;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
