class OrderModel {
  List<ItemModel> orders = [];
  OrderModel();
  OrderModel.fromJson(List json) {
    for (var element in json) {
      orders.add(ItemModel.fromJson(element));
    }
  }
}

class ItemModel {
  late String assignedOrderId;
  late String outletNameEn;
  late String outletNameAr;
  late String addressDetail;
  late String areaEn;
  late String cityEn;
  late String assignedQuantity;
  late String totalPrice;
  late String custName;
  late String phone;
  late String location;
  late String assignedDate;
  ItemModel.fromJson(Map<String, dynamic> json) {
    assignedOrderId = json["assignedOrderId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    addressDetail = json["addressDetail"];
    areaEn = json["areaEn"];
    cityEn = json["cityEn"];
    assignedQuantity = json["assignedQuantity"];
    totalPrice = json["totalPrice"];
    custName = json["custName"];
    phone = json["phone"];
    location = json["location"];
    assignedDate = json["assignedDate"];
  }
}
