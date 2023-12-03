class restaurants {
  int? statusCode;
  String? message;
  Response? response;

  restaurants({this.statusCode, this.message, this.response});

  restaurants.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class Response {
  int? totalSize;
  Null? limit;
  Null? offset;
  List<Restaurants>? restaurants;

  Response({this.totalSize, this.limit, this.offset, this.restaurants});

  Response.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['restaurants'] != null) {
      restaurants = <Restaurants>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(new Restaurants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_size'] = this.totalSize;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.restaurants != null) {
      data['restaurants'] = this.restaurants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurants {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  Null? footerText;
  int? minimumOrder;
  Null? comission;
  bool? scheduleOrder;
  Null? openingTime;
  Null? closeingTime;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  List<int>? rating;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? dineIn;
  bool? foodSection;
  int? tax;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  Null? perKmShippingCharge;
  BusinessType? businessType;
  int? totalEarning;
  Null? totalWithdrawn;
  int? open;
  String? avgRating;
  int? ratingCount;
  bool? gstStatus;
  String? gstCode;
  Null? discount;
  String? availableTimeStarts;
  String? availableTimeEnds;

  Restaurants(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.logo,
      this.latitude,
      this.longitude,
      this.address,
      this.footerText,
      this.minimumOrder,
      this.comission,
      this.scheduleOrder,
      this.openingTime,
      this.closeingTime,
      this.status,
      this.vendorId,
      this.createdAt,
      this.updatedAt,
      this.freeDelivery,
      this.rating,
      this.coverPhoto,
      this.delivery,
      this.takeAway,
      this.dineIn,
      this.foodSection,
      this.tax,
      this.zoneId,
      this.reviewsSection,
      this.active,
      this.offDay,
      this.selfDeliverySystem,
      this.posSystem,
      this.minimumShippingCharge,
      this.deliveryTime,
      this.veg,
      this.nonVeg,
      this.orderCount,
      this.totalOrder,
      this.perKmShippingCharge,
      this.businessType,
      this.totalEarning,
      this.totalWithdrawn,
      this.open,
      this.avgRating,
      this.ratingCount,
      this.gstStatus,
      this.gstCode,
      this.discount,
      this.availableTimeStarts,
      this.availableTimeEnds});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    logo = json['logo'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    footerText = json['footer_text'];
    minimumOrder = json['minimum_order'];
    comission = json['comission'];
    scheduleOrder = json['schedule_order'];
    openingTime = json['opening_time'];
    closeingTime = json['closeing_time'];
    status = json['status'];
    vendorId = json['vendor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    freeDelivery = json['free_delivery'];
    rating = json['rating'].cast<int>();
    coverPhoto = json['cover_photo'];
    delivery = json['delivery'];
    takeAway = json['take_away'];
    dineIn = json['dine_in'];
    foodSection = json['food_section'];
    tax = json['tax'];
    zoneId = json['zone_id'];
    reviewsSection = json['reviews_section'];
    active = json['active'];
    offDay = json['off_day'];
    selfDeliverySystem = json['self_delivery_system'];
    posSystem = json['pos_system'];
    minimumShippingCharge = json['minimum_shipping_charge'];
    deliveryTime = json['delivery_time'];
    veg = json['veg'];
    nonVeg = json['non_veg'];
    orderCount = json['order_count'];
    totalOrder = json['total_order'];
    perKmShippingCharge = json['per_km_shipping_charge'];
    businessType = json['business_type'] != null
        ? new BusinessType.fromJson(json['business_type'])
        : null;
    totalEarning = json['total_earning'];
    totalWithdrawn = json['total_withdrawn'];
    open = json['open'];
    avgRating = json['avg_rating'];
    ratingCount = json['rating_count'];
    gstStatus = json['gst_status'];
    gstCode = json['gst_code'];
    discount = json['discount'];
    availableTimeStarts = json['available_time_starts'];
    availableTimeEnds = json['available_time_ends'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['logo'] = this.logo;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['footer_text'] = this.footerText;
    data['minimum_order'] = this.minimumOrder;
    data['comission'] = this.comission;
    data['schedule_order'] = this.scheduleOrder;
    data['opening_time'] = this.openingTime;
    data['closeing_time'] = this.closeingTime;
    data['status'] = this.status;
    data['vendor_id'] = this.vendorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['free_delivery'] = this.freeDelivery;
    data['rating'] = this.rating;
    data['cover_photo'] = this.coverPhoto;
    data['delivery'] = this.delivery;
    data['take_away'] = this.takeAway;
    data['dine_in'] = this.dineIn;
    data['food_section'] = this.foodSection;
    data['tax'] = this.tax;
    data['zone_id'] = this.zoneId;
    data['reviews_section'] = this.reviewsSection;
    data['active'] = this.active;
    data['off_day'] = this.offDay;
    data['self_delivery_system'] = this.selfDeliverySystem;
    data['pos_system'] = this.posSystem;
    data['minimum_shipping_charge'] = this.minimumShippingCharge;
    data['delivery_time'] = this.deliveryTime;
    data['veg'] = this.veg;
    data['non_veg'] = this.nonVeg;
    data['order_count'] = this.orderCount;
    data['total_order'] = this.totalOrder;
    data['per_km_shipping_charge'] = this.perKmShippingCharge;
    if (this.businessType != null) {
      data['business_type'] = this.businessType!.toJson();
    }
    data['total_earning'] = this.totalEarning;
    data['total_withdrawn'] = this.totalWithdrawn;
    data['open'] = this.open;
    data['avg_rating'] = this.avgRating;
    data['rating_count'] = this.ratingCount;
    data['gst_status'] = this.gstStatus;
    data['gst_code'] = this.gstCode;
    data['discount'] = this.discount;
    data['available_time_starts'] = this.availableTimeStarts;
    data['available_time_ends'] = this.availableTimeEnds;
    return data;
  }
}

class BusinessType {
  int? id;
  String? type;
  String? createdAt;

  BusinessType({this.id, this.type, this.createdAt});

  BusinessType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    return data;
  }
}
