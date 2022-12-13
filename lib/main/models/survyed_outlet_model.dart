class SurveyedOutletModel {
  List<SurveyedResturantOutletModel> resturant = [];
  SurveyedOutletModel();
  SurveyedOutletModel.fromjson(List json) {
    for (var element in json) {
      resturant.add(SurveyedResturantOutletModel.fromJson(element));
    }
  }
}

class SurveyedResturantOutletModel {
  SurveyedResturantOutletModel();
  late String outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? areaEn;
  String? custName;
  String? phone;
  String? addressDetail;
  String? location;
  String? sureyedBy;
  String? userType;
  String? date;
  String? priceKg;
  String? payment;
  String? oilType;
  String? quantity;
  String? outletSpace;
  String? notes;
  SurveyedResturantOutletModel.fromJson(Map<String, dynamic> json) {
    outletId = json["outletId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    custName = json["custName"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    location = json["location"];
    sureyedBy = json["sureyedBy"];
    userType = json["userType"];
    priceKg = json["priceKg"];
    payment = json["payment"];
    oilType = json["oilType"];
    quantity = json["quantity"];
    outletSpace = json["outletSpace"];
    notes = json["notes"];
  }
}
