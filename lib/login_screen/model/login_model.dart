class LoginModel {
  late String memberId;
   String? memberName;
   String? memberPhone;
  late String memberTitle;
  late String memberMail;
  String? warehouseName;
  late String teamName;
  late String mainTeamName;
  late String roleName;
   String ? roleCreate;
   String ? roleEdit;
   String ? roleDelete;
   String ? roleSpecial;
  late String cityEn;
  late String governorateEn;
  late String token;
  LoginModel();
  LoginModel.fromJson(Map<String, dynamic> json) {
    memberId = json["memberId"];
    memberName = json["memberName"];
    memberPhone = json["memberPhone"];
    memberTitle = json["memberTitle"];
    memberMail = json["memberMail"];
    warehouseName = json["warehouseName"];
    teamName = json["teamName"];
    mainTeamName = json["mainTeamName"];
    roleName = json["roleName"];
    roleCreate = json["roleCreate"];
    roleEdit = json["roleEdit"];
    roleDelete = json["roleDelete"];
    roleSpecial = json["roleSpecial"];
    cityEn = json["city_name_en"];
    governorateEn = json["governorate_name_en"];
    token = json["token"];
  }
}
