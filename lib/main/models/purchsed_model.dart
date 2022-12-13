class PurchsedOutletModel {
  List<PurchsedResturantOutletModel> resturant = [];
  PurchsedOutletModel();
  PurchsedOutletModel.fromjson(List json) {
    for (var element in json) {
      resturant.add(PurchsedResturantOutletModel.fromJson(element));
    }
  }
}

class PurchsedResturantOutletModel {
  PurchsedResturantOutletModel();
  late String outletId;
  String? outletNameEn;
  String? outletNameAr;
  String? cityEn;
  String? areaEn;
  String? custName;
  String? phone;
  String? addressDetail;
  String? location;
  String? approvedBy;
  String? userType;
  String? date;
  String? priceKg;
  String? payment;
  String? oilType;
  String? quantity;
  String? outletSpace;
  String? notes;
  String? detailsId;
  String? purchaseId;
  String? status;
  String? custPhone;
  String? custRole;
  String? workerName;
  String? workerPhone;
  String? workerRole;
  String? agreementName;
  String? agreementDate;
  String? startDate;
  String? endDate;
  String? contract;
  String? lastCollection;
  String? approveName;
  String? approveDate;
  String? totalCollected;
  PurchsedResturantOutletModel.fromJson(Map<String, dynamic> json) {
    outletId = json["outletId"];
    outletNameEn = json["outletNameEn"];
    outletNameAr = json["outletNameAr"];
    cityEn = json["cityEn"];
    areaEn = json["areaEn"];
    custName = json["custName"];
    phone = json["phone"];
    addressDetail = json["addressDetail"];
    location = json["location"];
    approvedBy = json["approvedBy"];
    userType = json["userType"];
    date = json["date"];
    priceKg = json["priceKg"];
    payment = json["payment"];
    oilType = json["oilType"];
    quantity = json["quantity"];
    outletSpace = json["outletSpace"];
    notes = json["notes"];
    detailsId = json["details_id"];
    purchaseId = json["purchase_id"];
    status = json["status"];
    custPhone = json["custPhone"];
    custRole = json["custRole"];
    workerName = json["workerName"];
    workerPhone = json["workerPhone"];
    workerRole = json["workerRole"];
    agreementName = json["agreementName"];
    agreementDate = json["agreementDate"];
    startDate = json["startDate"];
    endDate = json["endDate"];
    contract = json["Contract"];
    lastCollection = json["lastCollection"];
    approveName = json["approveName"];
    approveDate = json["approveDate"];
    totalCollected = json["totalCollected"];
  }
}
