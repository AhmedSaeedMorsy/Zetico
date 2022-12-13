class AreaModel {
  List<Area> area = [];
  AreaModel();
  AreaModel.fromjson(List json) {
    for (var element in json) {
      area.add(Area.fromJson(element));
    }
  }
}

class Area {
  String? cityId;
  String? governorateId;
  late String cityNameEn;
  Area.fromJson(Map<String, dynamic> json) {
    cityId = json["cityId"];
    governorateId = json["governorate_id"];
    cityNameEn = json["city_name_en"];
  }
}
