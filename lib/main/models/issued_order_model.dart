class IssuedOrdersModel {
  List<IssuedModel> orders = [];
  IssuedOrdersModel();
  IssuedOrdersModel.fromjson(List json) {
    for (var element in json) {
      orders.add(IssuedModel.fromJson(element));
    }
  }
}

class IssuedModel {
  IssuedModel();
  String? onProgressId;
  String? onProgressQuantity;
  String? acceptDate;
  String? collectDate;
  String? creationDate;
  String? createdBy;
  String? assignedDriver;
  String? assignedDate;
  String? assignedBy;
  String? issueId;
  String? issueDate;
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
  String? issueComment;
  String? memberName;
  String? memberPhone;

  IssuedModel.fromJson(Map<String, dynamic> json) {
    onProgressId = json["onProgressId"];
    onProgressQuantity = json["onProgressQuantity"];
    acceptDate = json["acceptDate"];
    collectDate = json["collectDate"];
    creationDate = json["creationDate"];
    createdBy = json["createdBy"];
    assignedDriver = json["assignedDriver"];
    assignedDate = json["assignedDate"];
    assignedBy = json["assignedBy"];
    issueId = json["issueId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    issueDate = json["issueDate"];
    outletId = json["outletId"];
    priceKg = json["priceKg"];
    custPhone = json["custPhone"];
    issueName = json["issueName"];
    issueName = json["issueName"];
    custName = json["custName"];
    issueComment = json["issueComment"];
    memberPhone = json["memberPhone"];
    memberName = json["memberName"];
  }
}
