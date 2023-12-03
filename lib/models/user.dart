/// status_code : 1
/// message : "success"
/// response : {"id":36,"f_name":"Muhammad","l_name":"Ramzan","phone":"+923030266745","email":"brand99@gmail.com","image":"2023-08-24-64e73f42046cf.png","is_phone_verified":0,"email_verified_at":null,"created_at":"2023-08-24T11:29:49.000000Z","updated_at":"2023-08-24T12:38:13.000000Z","cm_firebase_token":"dUsVgpcPRDeoGOrn-wRbJf:APA91bGdHvGq1xXMTqdes9Dbg0zWfUNJldqfub6BPvJ6iR0AceVy_Ein8wqWuxNQGI7wbYdEJeBXwfmUnZA1ijOLwD5vKgC7Hy-IgUirsZ5Ef8tCqldZMNNkPfcptb8LIIKU5akQW5J9","status":1,"order_count":0,"login_medium":null,"social_id":null,"zone_id":null,"wallet_balance":0,"loyalty_point":0,"ref_code":"brand99360","userinfo":null,"member_since_days":46}

class User {
  User({
      num? statusCode, 
      String? message, 
      Response? response,}){
    _statusCode = statusCode;
    _message = message;
    _response = response;
}

  User.fromJson(dynamic json) {
    _statusCode = json['status_code'];
    _message = json['message'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  num? _statusCode;
  String? _message;
  Response? _response;
User copyWith({  num? statusCode,
  String? message,
  Response? response,
}) => User(  statusCode: statusCode ?? _statusCode,
  message: message ?? _message,
  response: response ?? _response,
);
  num? get statusCode => _statusCode;
  String? get message => _message;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// id : 36
/// f_name : "Muhammad"
/// l_name : "Ramzan"
/// phone : "+923030266745"
/// email : "brand99@gmail.com"
/// image : "2023-08-24-64e73f42046cf.png"
/// is_phone_verified : 0
/// email_verified_at : null
/// created_at : "2023-08-24T11:29:49.000000Z"
/// updated_at : "2023-08-24T12:38:13.000000Z"
/// cm_firebase_token : "dUsVgpcPRDeoGOrn-wRbJf:APA91bGdHvGq1xXMTqdes9Dbg0zWfUNJldqfub6BPvJ6iR0AceVy_Ein8wqWuxNQGI7wbYdEJeBXwfmUnZA1ijOLwD5vKgC7Hy-IgUirsZ5Ef8tCqldZMNNkPfcptb8LIIKU5akQW5J9"
/// status : 1
/// order_count : 0
/// login_medium : null
/// social_id : null
/// zone_id : null
/// wallet_balance : 0
/// loyalty_point : 0
/// ref_code : "brand99360"
/// userinfo : null
/// member_since_days : 46

class Response {
  Response({
      num? id, 
      String? fName, 
      String? lName, 
      String? phone, 
      String? email, 
      String? image, 
      num? isPhoneVerified, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt, 
      String? cmFirebaseToken, 
      num? status, 
      num? orderCount, 
      dynamic loginMedium, 
      dynamic socialId, 
      dynamic zoneId, 
      num? walletBalance, 
      num? loyaltyPoint, 
      String? refCode, 
      dynamic userinfo, 
      num? memberSinceDays,}){
    _id = id;
    _fName = fName;
    _lName = lName;
    _phone = phone;
    _email = email;
    _image = image;
    _isPhoneVerified = isPhoneVerified;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _cmFirebaseToken = cmFirebaseToken;
    _status = status;
    _orderCount = orderCount;
    _loginMedium = loginMedium;
    _socialId = socialId;
    _zoneId = zoneId;
    _walletBalance = walletBalance;
    _loyaltyPoint = loyaltyPoint;
    _refCode = refCode;
    _userinfo = userinfo;
    _memberSinceDays = memberSinceDays;
}

  Response.fromJson(dynamic json) {
    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _phone = json['phone'];
    _email = json['email'];
    _image = json['image'];
    _isPhoneVerified = json['is_phone_verified'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _cmFirebaseToken = json['cm_firebase_token'];
    _status = json['status'];
    _orderCount = json['order_count'];
    _loginMedium = json['login_medium'];
    _socialId = json['social_id'];
    _zoneId = json['zone_id'];
    _walletBalance = json['wallet_balance'];
    _loyaltyPoint = json['loyalty_point'];
    _refCode = json['ref_code'];
    _userinfo = json['userinfo'];
    _memberSinceDays = json['member_since_days'];
  }
  num? _id;
  String? _fName;
  String? _lName;
  String? _phone;
  String? _email;
  String? _image;
  num? _isPhoneVerified;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _cmFirebaseToken;
  num? _status;
  num? _orderCount;
  dynamic _loginMedium;
  dynamic _socialId;
  dynamic _zoneId;
  num? _walletBalance;
  num? _loyaltyPoint;
  String? _refCode;
  dynamic _userinfo;
  num? _memberSinceDays;
Response copyWith({  num? id,
  String? fName,
  String? lName,
  String? phone,
  String? email,
  String? image,
  num? isPhoneVerified,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
  String? cmFirebaseToken,
  num? status,
  num? orderCount,
  dynamic loginMedium,
  dynamic socialId,
  dynamic zoneId,
  num? walletBalance,
  num? loyaltyPoint,
  String? refCode,
  dynamic userinfo,
  num? memberSinceDays,
}) => Response(  id: id ?? _id,
  fName: fName ?? _fName,
  lName: lName ?? _lName,
  phone: phone ?? _phone,
  email: email ?? _email,
  image: image ?? _image,
  isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  cmFirebaseToken: cmFirebaseToken ?? _cmFirebaseToken,
  status: status ?? _status,
  orderCount: orderCount ?? _orderCount,
  loginMedium: loginMedium ?? _loginMedium,
  socialId: socialId ?? _socialId,
  zoneId: zoneId ?? _zoneId,
  walletBalance: walletBalance ?? _walletBalance,
  loyaltyPoint: loyaltyPoint ?? _loyaltyPoint,
  refCode: refCode ?? _refCode,
  userinfo: userinfo ?? _userinfo,
  memberSinceDays: memberSinceDays ?? _memberSinceDays,
);
  num? get id => _id;
  String? get fName => _fName;
  String? get lName => _lName;
  String? get phone => _phone;
  String? get email => _email;
  String? get image => _image;
  num? get isPhoneVerified => _isPhoneVerified;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get cmFirebaseToken => _cmFirebaseToken;
  num? get status => _status;
  num? get orderCount => _orderCount;
  dynamic get loginMedium => _loginMedium;
  dynamic get socialId => _socialId;
  dynamic get zoneId => _zoneId;
  num? get walletBalance => _walletBalance;
  num? get loyaltyPoint => _loyaltyPoint;
  String? get refCode => _refCode;
  dynamic get userinfo => _userinfo;
  num? get memberSinceDays => _memberSinceDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['f_name'] = _fName;
    map['l_name'] = _lName;
    map['phone'] = _phone;
    map['email'] = _email;
    map['image'] = _image;
    map['is_phone_verified'] = _isPhoneVerified;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['cm_firebase_token'] = _cmFirebaseToken;
    map['status'] = _status;
    map['order_count'] = _orderCount;
    map['login_medium'] = _loginMedium;
    map['social_id'] = _socialId;
    map['zone_id'] = _zoneId;
    map['wallet_balance'] = _walletBalance;
    map['loyalty_point'] = _loyaltyPoint;
    map['ref_code'] = _refCode;
    map['userinfo'] = _userinfo;
    map['member_since_days'] = _memberSinceDays;
    return map;
  }
}
