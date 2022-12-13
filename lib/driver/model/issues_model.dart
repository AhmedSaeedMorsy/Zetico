class IssuesModel {
  List<ItemModel> issue = [];
  IssuesModel();
  IssuesModel.fromJson(List json) {
    for (var element in json) {
      issue.add(ItemModel.fromJson(element));
    }
  }
}

class ItemModel {
   String ? issuedId;
   String ? issuedName;
  ItemModel();
  ItemModel.fromJson(Map<String, dynamic> json) {
    issuedId = json["issue_Id"];
    issuedName = json["issueName"];
  }
}
