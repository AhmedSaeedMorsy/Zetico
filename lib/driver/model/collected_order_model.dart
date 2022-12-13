class CompletedOrderModel {
  List<CompletedModel> orders = [];
 CompletedOrderModel();
 CompletedOrderModel.fromJson(List json) {
    for (var element in json) {
      orders.add(CompletedModel.fromJson(element));
    }
  }
}

class CompletedModel {
  late String collectedId;
  late String outletNameEn;
  late String outletNameAr;
  late String addressDetail;
  late String areaEn;
  late String cityEn;
  late String collectedQuantity;
  late String collectEstQuantity;
  late String totalPrice;
  late String custName;
  late String phone;
  late String location;
  late String assignDate;
  CompletedModel.fromJson(Map<String, dynamic> json) {
    collectedId = json["collectedId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    addressDetail = json["addressDetail"];
    areaEn = json["areaEn"];
    cityEn = json["cityEn"];
    collectedQuantity = json["collectedQuantity"];
    collectEstQuantity = json["collectEstQuantity"];
    totalPrice = json["totalPrice"];
    custName = json["custName"];
    phone = json["phone"];
    location = json["location"];
    assignDate = json["assignDate"];
  }
}
