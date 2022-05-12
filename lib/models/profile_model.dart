class ProfileModel {
  String? responseStatus;
  String? responseCode;
  ResponseData? responseData;

  ProfileModel({this.responseStatus, this.responseCode, this.responseData});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'];
    responseCode = json['ResponseCode'];
    responseData = json['ResponseData'] != null
        ? new ResponseData.fromJson(json['ResponseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResponseStatus'] = this.responseStatus;
    data['ResponseCode'] = this.responseCode;
    if (this.responseData != null) {
      data['ResponseData'] = this.responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  String? role;
  String? rollerid;
  String? firstname;
  String? lastname;
  String? fullname;
  String? address;
  String? cardid;
  String? membertype;
  String? membertypename;
  String? startdate;
  String? expiredate;
  String? mobile;
  String? phone;
  String? email;
  String? lineid;
  String? agencyname;
  String? invitefriendsid;
  String? picture;
  String? ratingname;
  String? statusname;
  String? noofcomein;

  ResponseData(
      {this.role,
      this.rollerid,
      this.firstname,
      this.lastname,
      this.fullname,
      this.address,
      this.cardid,
      this.membertype,
      this.membertypename,
      this.startdate,
      this.expiredate,
      this.mobile,
      this.phone,
      this.email,
      this.lineid,
      this.agencyname,
      this.invitefriendsid,
      this.picture,
      this.ratingname,
      this.statusname,
      this.noofcomein});

  ResponseData.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    rollerid = json['rollerid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    fullname = json['fullname'];
    address = json['address'];
    cardid = json['cardid'];
    membertype = json['membertype'];
    membertypename = json['membertypename'];
    startdate = json['startdate'];
    expiredate = json['expiredate'];
    mobile = json['mobile'];
    phone = json['phone'];
    email = json['email'];
    lineid = json['lineid'];
    agencyname = json['agencyname'];
    invitefriendsid = json['invitefriendsid'];
    picture = json['picture'];
    ratingname = json['ratingname'];
    statusname = json['statusname'];
    noofcomein = json['noofcomein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['rollerid'] = this.rollerid;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['fullname'] = this.fullname;
    data['address'] = this.address;
    data['cardid'] = this.cardid;
    data['membertype'] = this.membertype;
    data['membertypename'] = this.membertypename;
    data['startdate'] = this.startdate;
    data['expiredate'] = this.expiredate;
    data['mobile'] = this.mobile;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['lineid'] = this.lineid;
    data['agencyname'] = this.agencyname;
    data['invitefriendsid'] = this.invitefriendsid;
    data['picture'] = this.picture;
    data['ratingname'] = this.ratingname;
    data['statusname'] = this.statusname;
    data['noofcomein'] = this.noofcomein;
    return data;
  }
}
