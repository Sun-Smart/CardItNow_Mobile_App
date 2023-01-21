class API {
  // String baseURL = "https://localhost:5001/carditnowapi/customermaster/";
  String baseURL = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  String localUrl = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  // String baseUrls = "http://demo.herbie.ai/CardItNowAPI/carditnowapi/Token?";
  String gapikey = "c7558c9a9ac19cc96816fd2aad245c7c";

  String logIn = "member/login";
  String register = "customermaster/SendOTP";
  String verifyotp = "verifyotp/Verify";

  //Terms acceptance
  String terms = "customertermsacceptance/fulllist";
  // String termsmaster ="termsmaster";
  //terms and condition api
  String termsmaster = "termsCondition/TermsList";

  String password = "customermaster/password config";
  String pinset = "customermaster/TPIN config";
  String updateProfileInformation = 'customermaster/UpdateProfileInformation';

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

  //avator
  String showAvatorMaster = "avatarmaster"; // Avator Images Get Api
  String uploadAvator = "avatarmaster/UploadSelfi";
  String uploadProcessDocument = "customermaster/ProcessDocument";

  //creditcard
  String crediCardPost =
      'customerpaymode/SaveCutomerCardDeatils'; //card Post Data
  String creditCardGetLink = 'customerpaymode/60'; //card Get Data
  //get method-document type
  String documenttypedropdown="common/Getdocumenttype";
  String banklistdropdown="common/GetBankList";
  String Paymentpurposedropdown ="common/GetpurposeList";
  //dummy json for invoice and amunt
  String invoiceget="PayerPayeePrivate/GetRawResult";


  //onboard Payeee
  String onboardPayeePost='PayerPayeePrivate';
}
