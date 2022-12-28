class API {
  // String baseURL = "https://localhost:5001/carditnowapi/customermaster/";
  String baseURL = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  // String baseUrls = "http://demo.herbie.ai/CardItNowAPI/carditnowapi/Token?";
  String gapikey = "c7558c9a9ac19cc96816fd2aad245c7c";

  String logIn = "member/login";
  String register = "SendOTP";


  //Terms acceptance
  String terms ="customertermsacceptance/fulllist";


  //home
  String home = "";

  //profile
  String getProfile = "member";
  String profileUpdate = "profile/update";
  String notificationList = "notification";
  String viewNotification = "updateNotification/65956";

  //subscription
  String planList = "membership_package_list";
  String addPlan = "subscription/pay";
  String paymentHistory = "profile/paymentHistory";

  //workout
  String updateGoal = "profile/goals/update";
  String dietPlanList = "mealPlan";
  String updateDietPlan = "mealPlan/status_update";
}
