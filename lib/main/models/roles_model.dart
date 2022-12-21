class RolesModel {
  List<Model> roles = [];
  RolesModel();
  RolesModel.fromjson(List json) {
    for (var element in json) {
      roles.add(Model.fromJson(element));
    }
  }
}

class Model {
  String? roleCreate;
  String? roleEdit;
  String? roleDelete;
  String? roleSpecial;

  Model.fromJson(Map<String, dynamic> json) {
    roleCreate = json["roleCreate"];
    roleEdit = json["roleEdit"];
    roleDelete = json["roleDelete"];
    roleSpecial = json["roleSpecial"];
  }
}
