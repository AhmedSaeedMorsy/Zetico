class OnProgressOrderModel {
  List<OnProgressItemModel> orders = [];
  OnProgressOrderModel();
  OnProgressOrderModel.fromJson(List json) {
    for (var element in json) {
      orders.add(OnProgressItemModel.fromJson(element));
    }
  }
}

class OnProgressItemModel {
  late String onProgressId;
  late String outletNameEn;
  late String outletNameAr;
  late String addressDetail;
  late String areaEn;
  late String cityEn;
  late String onProgressQuantity;
  late String totalPrice;
  late String custName;
  late String phone;
  late String priceKg;
  late String location;
  late String assignedDate;
  OnProgressItemModel.fromJson(Map<String, dynamic> json) {
    onProgressId = json["onProgressId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    addressDetail = json["addressDetail"];
    areaEn = json["areaEn"];
    cityEn = json["cityEn"];
    onProgressQuantity = json["onProgressQuantity"];
    totalPrice = json["totalPrice"];
    custName = json["custName"];
    phone = json["phone"];
    location = json["location"];
    assignedDate = json["assignedDate"];
    priceKg = json["priceKg"];
  }
}
