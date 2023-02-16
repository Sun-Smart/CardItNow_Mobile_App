// ignore_for_file: non_constant_identifier_names

class API {

  String baseURL = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  // String baseURL = "https://10.0.2.2:5001/carditnowapi/";
  String localUrl = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  String gapikey = "c7558c9a9ac19cc96816fd2aad245c7c";

  String logIn = "member/login";
  String register = "customermaster/SendOTP1";
  String verifyotp = "verifyotp/Verify";
  String registerSign = "common/SaveSocialMedia";

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
  String showAvatorMaster = "avatarmaster";
  String uploadAvator = "avatarmaster/UploadSelfi";
  String uploadProcessDocument = "customermaster/ProcessDocument";

  //creditcard
  String documenttypedropdown = "common/Getdocumenttype";
  String banklistdropdown = "common/GetBankList";
  String Paymentpurposedropdown = "common/GetpurposeList";

  //set default card
  String setDefaultCard = "customerpaymode/setCardDefault";

  //dummy json for invoice and amount
  String invoiceget = "PayerPayeePrivate/GetRawResult";

  //ocr
  String processocr = 'customerdetail/ProcessOCR';
  //onboard Payeee
  String onboardPayeePost = 'PayerPayeePrivate';
  String crediCardPost = 'customerpaymode/SaveCutomerCardDeatils';
  String creditCardGetLink = 'customerpaymode/GetCustomerCardList?id=';

  //Tas Details Get Api
  String taxDetailsGetApiData = 'PayerPayeePrivate/GetRawResult';

  //countryselection
  String countryselect = 'geographymaster/fulllist';

  String cityselect = 'citymaster/geoid/';

  String newtoken = 'customermaster/customerauthendication';

//forgot password
  String forgotSendOTP = "common/ForgotPasscode";
  String forgotOTPVerify = "common/ForgotOTPvalidate";
  String updateForgotPassword = "common/Changepass";

  //termsandconditions acceptance
String termsacceptance = "customertermsacceptance";

//countrywise document selection

String countrydoc = "customermaster/GetDocumenttype";

}
