// ignore_for_file: non_constant_identifier_names

class API {

  String baseURL = "https://demo.herbie.ai/CardItNowAPI/carditnowapi/";
  // String baseURL = "https://10.0.2.2:5001/carditnowapi/";

  String logIn = "member/login";
  String register = "customermaster/SendOTP1";
  String verifyotp = "verifyotp/Verify";
  String registerSign = "common/SaveSocialMedia";
  String getSecurityQuestion = "customermaster/GetsecurityQuestions";
  String mandatoryPayee = "payerpayeeprivate/MandatoryPayee";
  String ResendOTP = "customermaster/ReSendOTP";
  //Terms acceptance
  String terms = "customertermsacceptance/fulllist";
  String termsmaster = "termsCondition/TermsList";
  String termsacceptance = "customertermsacceptance";
  String password = "customermaster/password config";
  String pinset = "customermaster/TPINconfig";
  String updateProfileInformation = 'customermaster/UpdateProfileInformation';

  //avator
  String showAvatorMaster = "avatarmaster";
  String uploadAvator = "avatarmaster/UploadSelfi";
  String uploadProcessDocument = "customermaster/ProcessDocument";

  //creditcard list
  String documenttypedropdown = "common/Getdocumenttype";
  String banklistdropdown = "common/GetBankList";
  String Paymentpurposedropdown = "common/GetpurposeList";

  //ocr
  String processocr = 'customerdetail/ProcessOCR';
  String onboardPayeePost = 'PayerPayeePrivate';

  //Tas Details Get Api
  String taxDetailsGetApiData = 'PayerPayeePrivate/GetRawResult';
  String invoiceget = "PayerPayeePrivate/GetRawResult";

  //countryselection
  String countryselect = 'geographymaster/fulllist';
  String cityselect = 'citymaster/geoid/';
  String countrydoc = "customermaster/GetDocumenttype";

  //forgot password
  String forgotSendOTP = "common/ForgotPasscode";
  String forgotOTPVerify = "common/ForgotOTPvalidate";
  String updateForgotPassword = "common/Changepass";
  String newtoken = 'customermaster/customerauthendication';

  //bank
  String addBankAccount = "payerpayeeprivate/SavePayerPayeePrivate";

  //card
  String setDefaultCard = "customerpaymode/setCardDefault";
  String crediCardPost = 'customerpaymode/SaveCutomerCardDeatils';
  String creditCardGetLink = 'customerpaymode/GetCustomerCardList?id=';

  //Securitypost

  String securitypost = "customersecurityquestion/insertcustomerallsecurityquestions";
  String securitydetails = "customersecurityquestion/customerquestiondetail/";
  String securityanswers = "customersecurityquestion/securityquestionscheck";


  //privacy clause
  String privacyclausecontent = "common/GetPrivacyclause";

  //Get LGU
  String getLGUPurpose = "transactionmaster/Getpurpose";
  String getLGUPayee = "transactionmaster/Getpayee";

  //payment
  String newPaymentVerify = "";
  String newPaymentDocument = "";

  //LGU
  String lguPaymentVerify = "common/duplicatetransactionvalidation";
  String lguPaymentDocument = "transactionmaster/Post_transactiondocument";
  String lguPaymentDetails = "transactionmaster/Post_billamountcalculation";
  String lguPayment = "transactionmaster/Post_transactionmaster";


  //dashboardapis
String  recentransaction = "common/dashboard_allrecenttransaction";
String barchartviewapi = "common/dashboard_transactionoverview";
}
