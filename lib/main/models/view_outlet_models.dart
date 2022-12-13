
class ViewOutletModel {
  List<ResturantModel> resturant = [];
  ViewOutletModel();
  ViewOutletModel.fromjson(List json) {
    for (var element in json) {
      resturant.add(ResturantModel.fromJson(element));
    }
  }
}

class ResturantModel {
  ResturantModel();

  String? outletId;
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
  String? detailsId;
  String? purchaseId;
  String? status;
  String? custPhone;
  String? custRole;
  String? workerName;
  String? workerPhone;
  String? wokerRole;
  String? agreementName;
  String? agreementDate;
  String? startDate;
  String? endDate;
  String? contract;
  String? lastCollection;
  String? approveName;
  String? approveDate;
  String? totalCollected;

  ResturantModel.fromJson(Map<String,dynamic> json) {
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
    wokerRole = json["wokerRole"];
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
