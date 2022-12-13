class NewOrdersModel {
  List<OrderModel> orders = [];
  NewOrdersModel();
  NewOrdersModel.fromjson(List json) {
    for (var element in json) {
      orders.add(OrderModel.fromJson(element));
    }
  }
}

class OrderModel {
  OrderModel();
  String? orderId;
  String? orderQuantity;
  String? orderDate;
  String? newOrderCreation;
  String? orderCreatedBy;
  String? orderDateUpdate;
  String? orderUpdatedBy;
  String? outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? custPhone;
  String? custName;
  String? areaEn;
  String? phone;
  String? addressDetail;
  String? priceKg;
  String? createdUser;
  String? updatedUser;
  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json["orderId"];
    orderQuantity = json["orderQuantity"];
    orderDate = json["orderDate"];
    newOrderCreation = json["newOrderCreation"];
    orderCreatedBy = json["orderCreatedBy"];
    orderDateUpdate = json["orderDateUpdate"];
    orderUpdatedBy = json["orderUpdatedBy"];
    outletId = json["outletId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    priceKg = json["priceKg"];
    createdUser = json["createdUser"];
    updatedUser = json["updatedUser"];
    custPhone = json["custPhone"];
    custName = json["custName"];
  }
}
