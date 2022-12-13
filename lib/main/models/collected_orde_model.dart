class CollectedOrdersModel {
  List<CollectedModel> orders = [];
  CollectedOrdersModel();
  CollectedOrdersModel.fromjson(List json) {
    for (var element in json) {
      orders.add(CollectedModel.fromJson(element));
    }
  }
}

class CollectedModel {
  CollectedModel();
  String? collectedId;
  String? collectedQuantity;
  String? collectedDate;
  String? collectEstQuantity;
  String? collectEstDate;
  String? acceptDate;
  String? assignedDriver;
  String? creationDate;
  String? createdBy;
  String? assignDate;
  String? assignedBy;
  String? outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? custName;
  String? phone;
  String? addressDetail;
  String? priceKg;
  String? custPhone;
  String? issueName;
  String? areaEn;
  String? memberName;
  String? memberPhone;

  CollectedModel.fromJson(Map<String, dynamic> json) {
    collectedId = json["collectedId"];
    collectedQuantity = json["collectedQuantity"];
    collectedDate = json["collectedDate"];
    collectEstQuantity = json["collectEstQuantity"];
    collectEstDate = json["collectEstDate"];
    acceptDate = json["acceptDate"];
    assignedDriver = json["assignedDriver"];
    creationDate = json["creationDate"];
    createdBy = json["createdBy"];
    assignDate = json["assignDate"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    assignedBy = json["assignedBy"];
    outletId = json["outletId"];
    priceKg = json["priceKg"];
    custPhone = json["custPhone"];
    issueName = json["issueName"];
    issueName = json["issueName"];
    custName = json["custName"];
    custName = json["custName"];
    phone = json["phone"];
    memberName = json["memberName"];
    memberPhone = json["memberPhone"];
  }
}
