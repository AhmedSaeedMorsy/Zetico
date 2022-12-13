class AssignedOrdersModel {
  List<AssignedModel> orders = [];
  AssignedOrdersModel();
  AssignedOrdersModel.fromjson(List json) {
    for (var element in json) {
      orders.add(AssignedModel.fromJson(element));
    }
  }
}

class AssignedModel {
  AssignedModel();
  String? assignedOrderId;
  String? assignedQuantity;
  String? collectDate;
  String? creationDate;
  String? orderCreatedBy;
  String? assignedDriver;
  String? assignedDate;
  String? assignedBy;
  String? updateDate;
  String? updatedBy;
  String? outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? areaEn;
  String? custName;
  String? phone;
  String? addressDetail;
  String? location;
  String? priceKg;
  String? custPhone;
  String? workerName;
  String? workerPhone;
  String? memberId;
  AssignedModel.fromJson(Map<String, dynamic> json) {
    assignedOrderId = json["assignedOrderId"];
    assignedQuantity = json["assignedQuantity"];
    collectDate = json["collectDate"];
    creationDate = json["creationDate"];
    orderCreatedBy = json["orderCreatedBy"];
    assignedDriver = json["assignedDriver"];
    assignedDate = json["assignedDate"];
    assignedBy = json["assignedBy"];
    updateDate = json["updateDate"];
    updatedBy = json["updatedBy"];
    outletId = json["outletId"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    custName = json["custName"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    location = json["location"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    priceKg = json["priceKg"];
    custPhone = json["custPhone"];
    workerName = json["workerName"];
    workerPhone = json["workerPhone"];
    memberId = json["memberId"];
  }
}
