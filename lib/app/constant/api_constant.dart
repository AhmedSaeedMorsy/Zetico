class ApiConstant {
  static const String authorization = "Authorization";
  static const String authorizationBody =
      "Basic bWFocmFuLmFkdjJAZ21haWwuY29tOkFkbWluIUAjMTIz";
  static const String viewOutletPath =
      "https://zeitco.linemedia.live/api/index.php";
  static String searchOutletPath(String outletName) =>
      "https://zeitco.linemedia.live/api/index.php?outletName=$outletName";

  static String searchAgreedPath(String outletName) =>
      "https://zeitco.linemedia.live/api/index.php?outletName=$outletName&status=APPROVED";
  static String searchActivePath(String outletName) =>
      "https://zeitco.linemedia.live/api/index.php?outletName=$outletName&status=active";
  static String searchInActivePath(String outletName) =>
      "https://zeitco.linemedia.live/api/index.php?outletName=$outletName&status=inactive";
  static String searchNotAgreedPath(String outletName) =>
      "https://zeitco.linemedia.live/api/index.php?outletName=$outletName&status=PROCEED";
  static String surveyrdOutletPath =
      "https://zeitco.linemedia.live/api/surveyed.php";
  static String searchSurveyedPath(String outletName) =>
      "https://zeitco.linemedia.live/api/surveyed.php?outletName=$outletName";
  static String approveSurveyedPath =
      "https://zeitco.linemedia.live/api/surveyed.php/approve";
  static String editSurveyedPath =
      "https://zeitco.linemedia.live/api/surveyed.php/update";
  static String declinedSurveyedPath =
      "https://zeitco.linemedia.live/api/surveyed.php/decline";
  static String verifiedOutletPath =
      "https://zeitco.linemedia.live/api/verify.php";
  static String searchVerifiedPath(String outletName) =>
      "https://zeitco.linemedia.live/api/verify.php?outletName=$outletName";

  static String declinedVerifiedPath =
      "https://zeitco.linemedia.live/api/verify.php/decline";
  static String editVerifiedPath =
      "https://zeitco.linemedia.live/api/verify.php/update";
  static String purchasingTeamPath =
      "https://zeitco.linemedia.live/api/members.php";
  static String assignPurchaserPath =
      "https://zeitco.linemedia.live/api/verify.php/addAssign";
  static String addOutletPath =
      "http://zeitco.linemedia.live/api/surveyed.php/addsurveyed";
  static String getCityPath = "https://zeitco.linemedia.live/api/gov.php";
  static String getAreaPath(String city) =>
      "https://zeitco.linemedia.live/api/city.php?govName=$city";
  static String getPurchsingPath =
      "https://zeitco.linemedia.live/api/purchasing.php";
  static String searchPurchesingPath(String outletName) =>
      "https://zeitco.linemedia.live/api/purchasing.php?outletName=$outletName";
  static String getReAssignPurchasingTeamPath(String outletId) =>
      "https://zeitco.linemedia.live/api/members.php?outletId=$outletId";
  static String reAssignPurchasingTeam =
      "https://zeitco.linemedia.live/api/purchasing.php/reAssign";
  static String approvePurchasingpath =
      "https://zeitco.linemedia.live/api/purchasing.php/approve";
  static String declinedPurchasingPath =
      "https://zeitco.linemedia.live/api/purchasing.php/decline";
  static String editPurchasingPath =
      "https://zeitco.linemedia.live/api/purchasing.php/update";
  static String getPurchasedPath =
      "https://zeitco.linemedia.live/api/approve.php";
  static String searchPurchasedPath(String outletName) =>
      "https://zeitco.linemedia.live/api/approve.php?outletName=$outletName";
  static String notAgreedPurchasedPath =
      "https://zeitco.linemedia.live/api/approve.php/notAgreed";
  static String declinedPurchasedPath =
      "https://zeitco.linemedia.live/api/approve.php/decline";
  static String approvePurchasedPath =
      "https://zeitco.linemedia.live/api/approve.php/approve";
  static String getNewOrdersPath =
      "https://zeitco.linemedia.live/api/orders.php/selectNewOrder";
  static String deleteAssignedOrderPath =
      "https://zeitco.linemedia.live/api/orders.php/deleteAssignedOrder";
  static String getAssignedOrdersPath =
      "https://zeitco.linemedia.live/api/orders.php/AssignedOrders";
  static String deleteNewOrderPath =
      "https://zeitco.linemedia.live/api/orders.php/deleteNewOrder";
  static String getOnProgressOrdersPath =
      "https://zeitco.linemedia.live/api/orders.php/onProgressOrders";
  static String getIssuedOrdersPath =
      "https://zeitco.linemedia.live/api/orders.php/IssuedOrders";
  static String getCollectedOrdersPath =
      "https://zeitco.linemedia.live/api/orders.php";
  static String getOutletPrice =
      "https://zeitco.linemedia.live/api/special.php/outletName";
  static String addOrderPath =
      "https://zeitco.linemedia.live/api/orders.php/addNewOrders";
  static String getDriverTeamPath =
      "https://zeitco.linemedia.live/api/members.php";
  static String getReAssignDriverTeamPath(String orderId) =>
      "https://zeitco.linemedia.live/api/members.php?orderId=$orderId";
  static String assignDriverPath =
      "https://zeitco.linemedia.live/api/orders.php/assignNewOrder";
  static String confirmAssignDriverPath =
      "https://zeitco.linemedia.live/api/orders.php/confirmAssign";
  static String editOrderPath =
      "https://zeitco.linemedia.live/api/orders.php/updateNewOrder";
  static String editAssignedOrderPath =
      "https://zeitco.linemedia.live/api/orders.php/updateAssignedOrder";
  static String reAssignDriverPath =
      "https://zeitco.linemedia.live/api/orders.php/reAssignAssignedOrder";
  static String onProgressOrderPath =
      "https://zeitco.linemedia.live/api/driverApp.php/onProgressOrders";
  static String orderPath =
      "https://zeitco.linemedia.live/api/driverApp.php/assignedOrders";
  static String orderToOnProgressPath =
      "https://zeitco.linemedia.live/api/driverApp.php/toProgress";
  static String completedorderPath =
      "https://zeitco.linemedia.live/api/driverApp.php/completedOrders";
  static String collectionOrderPath =
      "https://zeitco.linemedia.live/api/driverApp.php/toCompleted";
  static String getIssuesPath =
      "https://zeitco.linemedia.live/api/orders.php/issue";
  static String issuesOrderPath =
      "https://zeitco.linemedia.live/api/driverApp.php/IssueOrder";
  static String loginUserPath =
      "https://zeitco.linemedia.live/api/driverApp.php/login";
}
