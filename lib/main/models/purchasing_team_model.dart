class PurchasingTeamModel {
  List<PurchasingMemberModel> team = [];
  PurchasingTeamModel();
  PurchasingTeamModel.fromjson(List json) {
    for (var element in json) {
      team.add(PurchasingMemberModel.fromJson(element));
    }
  }
}

class PurchasingMemberModel {
  PurchasingMemberModel();
  late String memberId;
  late String memberName;
  late String memberPhone;
  late String teamName;

  PurchasingMemberModel.fromJson(Map<String, dynamic> json) {
    memberId = json["memberId"];
    memberName = json["memberName"];
    memberPhone = json["memberPhone"];
    teamName = json["teamName"];
  }
}
