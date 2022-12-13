class CityModel {
  List<City> citises= [];
  CityModel();
  CityModel.fromjson(List json) {
    for (var element in json) {
      citises.add(City.fromJson(element));
    }
  }
}

class City {
  String? govId;
  String? governorateNameAr;
  late String governorateNameEn;
  City.fromJson(Map<String, dynamic> json) {
    govId = json["govId"];
    governorateNameAr = json["governorate_name_ar"];
    governorateNameEn = json["governorate_name_en"];
  }
}
