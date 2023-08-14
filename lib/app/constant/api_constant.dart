class ApiConstant {
  static const String authorization = "Authorization";
  static const String authorizationBody =
      "Basic bWFocmFuLmFkdjJAZ21haWwuY29tOkFkbWluIUAjMTIz";
  static const String urlPath = "https://zeitco-me.online/crm/api";

  static const String viewOutletPath = "$urlPath/index.php";
  static String searchOutletPath(String outletName) =>
      "$urlPath/index.php?outletName=$outletName";

  static String searchAgreedPath(String outletName) =>
      "$urlPath/index.php?outletName=$outletName&status=APPROVED";
  static String searchActivePath(String outletName) =>
      "$urlPath/index.php?outletName=$outletName&status=active";
  static String searchInActivePath(String outletName) =>
      "$urlPath/index.php?outletName=$outletName&status=inactive";
  static String searchNotAgreedPath(String outletName) =>
      "$urlPath/index.php?outletName=$outletName&status=PROCEED";
  static String surveyrdOutletPath = "$urlPath/surveyed.php";
  static String searchSurveyedPath(String outletName) =>
      "$urlPath/surveyed.php?outletName=$outletName";
  static String approveSurveyedPath = "$urlPath/surveyed.php/approve";
  static String editSurveyedPath = "$urlPath/surveyed.php/update";
  static String declinedSurveyedPath = "$urlPath/surveyed.php/decline";
  static String verifiedOutletPath = "$urlPath/verify.php";
  static String searchVerifiedPath(String outletName) =>
      "$urlPath/verify.php?outletName=$outletName";

  static String declinedVerifiedPath = "$urlPath/verify.php/decline";
  static String editVerifiedPath = "$urlPath/verify.php/update";
  static String purchasingTeamPath = "$urlPath/members.php";
  static String assignPurchaserPath = "$urlPath/verify.php/addAssign";
  static String addOutletPath =
      "http://zeitco.linemedia.live/crm/api/surveyed.php/addsurveyed";
  static String getCityPath = "$urlPath/gov.php";
  static String getAreaPath(String city) => "$urlPath/city.php?govName=$city";
  static String getPurchsingPath = "$urlPath/purchasing.php";
  static String searchPurchesingPath(String outletName) =>
      "$urlPath/purchasing.php?outletName=$outletName";
  static String getReAssignPurchasingTeamPath(String outletId) =>
      "$urlPath/members.php?outletId=$outletId";
  static String reAssignPurchasingTeam = "$urlPath/purchasing.php/reAssign";
  static String approvePurchasingpath = "$urlPath/purchasing.php/approve";
  static String declinedPurchasingPath = "$urlPath/purchasing.php/decline";
  static String editPurchasingPath = "$urlPath/purchasing.php/update";
  static String getPurchasedPath = "$urlPath/approve.php";
  static String searchPurchasedPath(String outletName) =>
      "$urlPath/approve.php?outletName=$outletName";
  static String notAgreedPurchasedPath = "$urlPath/approve.php/notAgreed";
  static String declinedPurchasedPath = "$urlPath/approve.php/decline";
  static String approvePurchasedPath = "$urlPath/approve.php/approve";
  static String getNewOrdersPath = "$urlPath/orders.php/selectNewOrder";
  static String deleteAssignedOrderPath =
      "$urlPath/orders.php/deleteAssignedOrder";
  static String getAssignedOrdersPath = "$urlPath/orders.php/AssignedOrders";
  static String deleteNewOrderPath = "$urlPath/orders.php/deleteNewOrder";
  static String getOnProgressOrdersPath =
      "$urlPath/orders.php/onProgressOrders";
  static String getIssuedOrdersPath = "$urlPath/orders.php/IssuedOrders";
  static String getCollectedOrdersPath = "$urlPath/orders.php";
  static String getOutletPrice = "$urlPath/special.php/outletName";
  static String addOrderPath = "$urlPath/orders.php/addNewOrders";
  static String getDriverTeamPath = "$urlPath/members.php";
  static String getReAssignDriverTeamPath(String orderId) =>
      "$urlPath/members.php?orderId=$orderId";
  static String assignDriverPath = "$urlPath/orders.php/assignNewOrder";
  static String confirmAssignDriverPath = "$urlPath/orders.php/confirmAssign";
  static String editOrderPath = "$urlPath/orders.php/updateNewOrder";
  static String editAssignedOrderPath =
      "$urlPath/orders.php/updateAssignedOrder";
  static String reAssignDriverPath =
      "$urlPath/orders.php/reAssignAssignedOrder";
  static String onProgressOrderPath = "$urlPath/driverApp.php/onProgressOrders";
  static String orderPath = "$urlPath/driverApp.php/assignedOrders";
  static String orderToOnProgressPath = "$urlPath/driverApp.php/toProgress";
  static String completedorderPath = "$urlPath/driverApp.php/completedOrders";
  static String collectionOrderPath = "$urlPath/driverApp.php/toCompleted";
  static String getIssuesPath = "$urlPath/orders.php/issue";
  static String issuesOrderPath = "$urlPath/driverApp.php/IssueOrder";
  static String loginUserPath = "$urlPath/driverApp.php/login";
  static String checkInPath = "$urlPath/driverApp.php/checkIn";
  static String checkOutPath = "$urlPath/driverApp.php/checkOut";
  static String getDeclinedPath = "$urlPath/outlet.php/decline";
  static String getOutletsPath = "$urlPath/special.php/list";
  static String getRoles = "$urlPath/special.php/userId";
}
