class OutletModel {
  List<Model> outlets = [];
  OutletModel();
  OutletModel.fromjson(List json) {
    for (var element in json) {
      outlets.add(Model.fromJson(element));
    }
  }
}

class Model {
  String? name;

  Model.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}
