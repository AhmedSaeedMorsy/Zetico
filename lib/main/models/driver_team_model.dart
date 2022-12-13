class DriverTeamModel {
  List<DriverModel> team = [];
  DriverTeamModel();
  DriverTeamModel.fromjson(List json) {
    for (var element in json) {
      team.add(DriverModel.fromJson(element));
    }
  }
}

class DriverModel {
  DriverModel();
  late String memberId;
  late String memberName;
  late String memberPhone;
  late String teamName;

  DriverModel.fromJson(Map<String, dynamic> json) {
    memberId = json["memberId"];
    memberName = json["memberName"];
    memberPhone = json["memberPhone"];
    teamName = json["teamName"];
  }
}
