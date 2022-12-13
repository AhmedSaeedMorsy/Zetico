class OutletPriceModel {
  List<Model> outlet = [];
  OutletPriceModel();
  OutletPriceModel.fromjson(List json) {
    for (var element in json) {
      outlet.add(Model.fromJson(element));
    }
  }
}

class Model {
  String? outletId;
  String? priceKg;
  Model.fromJson(Map<String, dynamic> json) {
    outletId = json["outletId"];
    priceKg = json["priceKg"];
  }
}
