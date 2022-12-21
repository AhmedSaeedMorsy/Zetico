class DeclinedOutletModel {
  List<DeclinedResturantOutletModel> resturant = [];
  DeclinedOutletModel();
  DeclinedOutletModel.fromjson(List json) {
    for (var element in json) {
      resturant.add(DeclinedResturantOutletModel.fromJson(element));
    }
  }
}

class DeclinedResturantOutletModel {
  DeclinedResturantOutletModel();
  late String outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? areaEn;
  String? custName;
  String? phone;
  String? addressDetail;
  String? location;
  String? surveyedBy;
  String? userType;
  String? date;
  String? priceKg;
  String? payment;
  String? oilType;
  String? quantity;
  String? outletSpace;
  String? notes;
  DeclinedResturantOutletModel.fromJson(Map<String, dynamic> json) {
    outletId = json["outletId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    custName = json["custName"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    location = json["location"];
    surveyedBy = json["surveyedBy"];
    userType = json["userType"];
    priceKg = json["priceKg"];
    payment = json["payment"];
    oilType = json["oilType"];
    quantity = json["quantity"];
    outletSpace = json["outletSpace"];
    notes = json["notes"];
  }
}
