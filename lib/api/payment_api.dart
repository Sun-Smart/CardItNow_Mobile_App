// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../api_endpoints.dart';
import '../base_client.dart';
import '../main.dart';
import '../ui/dashboard/paynow_menu/payment_overview_dashboard.dart';
import '../ui/loan_screen/payment_successful.dart';
import '../ui/payment/purpose_details.dart';
import '../ui/register/register_loading_screen.dart';
import 'card_api.dart';

class PaymentAPI extends GetxController with BaseController {
  CardAPI card = CardAPI();
  var paymentPurposeList = [{"id":"1", "name":"Rent"}];
  var paymentPurpose;
  var paymentSubPurposeList = [{"id":"1", "name":"Monthly Rent"},{"id":"2", "name":"Advance Rent"},{"id":"3", "name":"Security Deposit"}];
  var paymentSubPurpose;
  var provinceList = [{"id":"1", "name":"Rent"}]; // *
  var province; // *
  var cityList = [{"id":"1", "name":"Tirupattur"}]; // *
  var city; // *
  final propertyOwnerNameCnl = TextEditingController();
  final addressNoCnl = TextEditingController(); // *
  final streetNameCnl = TextEditingController();  // *
  final startDate = TextEditingController(); // *
  final endDate = TextEditingController();  // *
  final postalCode = TextEditingController();  // *
  var pickedFile;  // *

  //LGU payee
  var lguPurposeList = [].obs;
  var lguPurpose;
  var lguProvinceList = [
    {
      "firstname": "First",
      "lastname": "Last",
      "customerid":"144"
    }
  ];
  var lguProvince;
  final PINCnl = TextEditingController();
  final billAmountCnl = TextEditingController();

  //purpose details
  var payeeTypeList = [{"id":"1", "name":"Property Owner"}, {"id":"2", "name":"Property Management Company"}];
  var payeeType;
  final payeeNameCnl = TextEditingController();
  final payeeEmailCnl = TextEditingController();
  final payeeMobileCnl = TextEditingController();
  final accountNoCnl = TextEditingController();
  var bankDetails;
  var accountTypeList = ["Saving", "Current"];
  String? accountType = "Saving";
  TextEditingController paymentController = TextEditingController(); // *

  //LGU purpose details // *
  var startYearList = [];
  var startYear;
  var endYearList = [];
  var endYear;


  //transaction
  var transactionList = [].obs;

  var getlgucust;


  //House details
  var houseClassificationList = [
    {
     "value": "1",
     "description": "Individual landlord"
    },
    {
      "value": "2",
      "description": "Property Management"
    },
    {
      "value": "3",
      "description": "Maintenance and Contractors"
    }
  ].obs;
  var houseClassification;
  var housePayeeList = [
    {
      "customerid": 465,
      "customerid": 465,
      "mode": "I",
      "uid": "P00000465",
      "type": "R",
      "firstname": "",
      "lastname": "",
      "email": "miracledhamu0703@gmail.com",
      "mobile": "23423423",
      "dob": "2005-01-01T00:00:00",
      "customerinterests": null,
      "defaultavatar": null,
      "customerphoto": null,
      "googleid": "4xKZn5zUOITvNtE8Ky5YeLCkL0F3",
      "facebookid": "0",
      "lasttermsaccepted": null,
      "customfield": null,
      "attachment": null,
      "status": "A",
      "deletionaccountrequestedon": null,
      "autodeletedon": null,
      "deleterevokedon": null,
      "createddate": "2023-03-02T07:49:51.503",
      "createdby": 1,
      "updatedby": 0,
      "updateddate": "2023-03-02T07:50:09.978",
      "otp": "586844",
      "password": "978978",
      "tpin": "978978",
      "nickname": "sdfsdf",
      "customervisible": true
    }
  ].obs;
  var housePayee;
  var housePurposeList = [].obs;
  var housePurpose;
  final invoiceNoCnl = TextEditingController();
  final invoiceDateCnl = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  initFunction() async{

    await getPurposeListAPI();
    await getLGUProvinceListAPI();
    await getHomePurposeListAPI();
    await getHouseCustomerListAPI();
    await getlgu();
    // getProvinceListAPI();
    // getCityListAPI();
  }

  void getPaymentPurposeListAPI() async {
    var response = await BaseClient()
        .get(API().getNewPaymentPurpose)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    paymentPurposeList = data;
  }

  //Get LGU
   getPurposeListAPI() async {
    var response = await BaseClient()
        .get(API().getLGUPurpose)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    lguPurposeList.value = data;
  }

   getLGUProvinceListAPI() async {
    var response = await BaseClient()
        .get(API().getLGUPayee)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    // lguProvinceList = data;
  }


   getHouseCustomerListAPI() async {
    var response = await BaseClient()
        .get(API().getHomeCustomer)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
   // housePayeeList.value = data["homerentcustomers"] ?? [];
  }

   getHomePurposeListAPI() async {
    var response = await BaseClient()
        .get(API().getHomePurpose)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    housePurposeList.value = data["houserent_puposelist"] ?? [];
  }

  void getProvinceListAPI() async {
    var response = await BaseClient()
        .get(API().getProvince+MyApp.logindetails["geoid"].toString())
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    provinceList = data;
  }

  void getCityListAPI() async {
    var response = await BaseClient()
        .get(API().getCity + "${MyApp.logindetails["geoid"]}/${province["id"]}")
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    cityList = data;
  }

  //newPayVerifyAPI
   newPaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "purpose": paymentPurpose,
      "subpurpose": paymentSubPurpose,
      "province": province,
      "city": city,
      "owner": propertyOwnerNameCnl.text,
      "addressno": addressNoCnl.text,
      "streetname": streetNameCnl.text,
      "startdate": startDate.text,
      "enddate": endDate.text,
      "postal": postalCode.text,
    };
    var response = await BaseClient()
        .post(API().newPaymentVerify, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var data = json.decode(response);
    if (data.toString() == "Success") {
      return "Success";
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  void newPaymentDocumentAPI(String type, var payee) async {
     // if(pickedFile != null) {
     //   Get.to(Registerloading());
       var body = {
         "customerid": MyApp.logindetails["userid"],
         "purpose": paymentPurpose,
         "subpurpose": paymentSubPurpose,
         "province": province,
         "city": city,
         "owner": propertyOwnerNameCnl.text,
         "addressno": addressNoCnl.text,
         "streetname": streetNameCnl.text,
         "startdate": startDate.text,
         "enddate": endDate.text,
         "postal": postalCode.text,
         "file": pickedFile
       };
     //   var response = await BaseClient()
     //       .post(API().newPaymentDocument, body, isMultiPart: true)
     //       .catchError(handleError);
     //  Get.back();
     //   if (response == null) return;
     //   var data = json.decode(response);
     //   if (data.toString() == "Success") {
         Get.to(PurposeDetails(paymentType:type, payee: payee, purpose: body));
     //   } else {
     //
     //     Fluttertoast.showToast(msg: "This is an existing Relationship");
     //   }
     // }
     //  else{
     //   Fluttertoast.showToast(msg: "Please Upload Document");
     // }
  }

  payeePaymentDetailsAPI(String type, var payee, var purpose, var purposeRes, String billAmount) async {
    showLoading();
    var body = {
      "billamount": billAmount,
      "payeetype": payeeType,
      "email": payeeEmailCnl.text,
      "mobileno": payeeMobileCnl.text,
      "bank": bankDetails,
      "accountno": accountNoCnl.text,
    "accounttype": accountType
    };
    var response = await BaseClient()
        .post(API().housePaymentDetails, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    // var dataValue = json.decode(response);
    // var data = json.decode(dataValue);
    var details = {
      "billamount": billAmount,
      "payeetype": payeeType,
      "email": payeeEmailCnl.text,
      "mobileno": payeeMobileCnl.text,
      "bank": bankDetails,
      "accountno": accountNoCnl.text,
      "accounttype": accountType
    };
    var data = {
      "paystatus":"paying",
      "username": "Raj",
      "profileurl": null,
      "CC_totalamount":"$billAmount",
      "CC_carditnowfee": "20",
      "billamount":"200",
      "feereason": "Some reason"
    };
    Get.to(OverviewPayment(payee: payee, purpose: purpose, paymentType: type, payment: details, paymentResponse: data,));
  }



  //LGU Payee Verification
  lguPaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body = {
      "customerid": MyApp.logindetails["userid"],
      "purpose": lguPurpose["masterdatadescription"] == "Real property TAX" ? "P": "",
      "municipality": lguProvince["customerid"],
      "province": "",
      "pin": PINCnl.text,
      "billamount": billAmountCnl.text,
      "startdate": startDate.text,
      "enddate": endDate.text,
    };
    var response = await BaseClient()
        .post(API().lguPaymentVerify, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data["status"] == "success") {
      return "Success";
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  void lguPaymentDocumentAPI(String type, var payee) async {
    if(pickedFile != null) {
      Get.to(Registerloading());
      var body = {
        "uploadDoc": pickedFile
      };
      var response = await BaseClient()
          .post(API().lguPaymentDocument, body)
          .catchError(handleError);
      Get.back();
      if (response == null) {
        Fluttertoast.showToast(msg: "Upload Statement of Account Failed");
      } else {
        var data = json.decode(response);
        if (data["status"] == "success") {
           var jsonResponse = json.encode(data["data"]);
           var responce1 = json.decode(jsonResponse);
            var responce = json.decode(responce1);
           var purpose = {
          "payee": lguProvince,
          "purpose": lguPurpose,
          "pin": PINCnl.text,
          "bill_amount": billAmountCnl.text,
          "date": {
            "start": startDate.text,
            "end": endDate.text
          }
        };
        // var responce;
        // responce = {
        //   "KEYVALUE": {
        //     "PIN": "003-19-003-07-004",
        //     "Taxpayer": "NACION, FELIX & EDITHA SPS",
        //     "Bill Date": "November 15, 2022",
        //     "Declared Owner": " NACION, FELIX & EDITHA SPS",
        //     "Location": "SAN BARTOLOME",
        //     "BILL AMOUNT": "P 75.68",
        //     "BAR CODE": "00319220022090"
        //   },
        //   "DOCNAME": "MUNICIPAL STATEMENT",
        //   "TableResult": {
        //     "statement summary": [
        //       {
        //         "A/V": "4,730.00",
        //         "PERIOD": "2023",
        //         "BASIC": "47.30",
        //         "D/P1": "-9.46",
        //         "TOTAL": "75.68"
        //       }
        //     ]
        //   }
        // };

        var dateList = responce["TableResult"]["statement summary"] ?? [];
        startYearList = dateList ?? [];
        endYearList = dateList ?? [];
        startYear = startYearList.first;
        endYear = endYearList.last;
        Get.to(PurposeDetails(
            paymentType: type, payee: payee, purpose: purpose, purposeResponse: responce));
        } else {
          Fluttertoast.showToast(msg: "This is an existing Relationship");
        }
      }}
    else {
      Fluttertoast.showToast(msg: "Please Upload Statement of Account");
    }

  }

  //LGU Payee Verification
  lguPaymentDetailsAPI(String type, var payee, var purpose, var  purposeRes, String billAmount) async {
    showLoading();
    var body = {
      "billamount": billAmount,
    };
    var response = await BaseClient()
        .post(API().lguPaymentDetails, body)
        .catchError(handleError);
    hideLoading();
    if (response == null){
      Fluttertoast.showToast(msg: "Payment Validation Failed");
    } else{
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data != null) {
      var details = {
        "start": startYear,
        "end": endYear,
        "bill_amount": billAmount
      };
    Get.to(OverviewPayment(payee: payee, purpose: purpose, purposeResponse: purposeRes,paymentType: type, payment: details, paymentResponse: data,));
    } else {
      Fluttertoast.showToast(msg: "Payment Validation Wrong");
    }}
  }

  finalPaymentAPI(String type, var payee, var purpose, var payment, var paymentResponse, var purposeResponse) async {
    showLoading();
    var body = {
      "transactionid":null,
      "uid": MyApp.logindetails["uid"],
      "recipientuid": purpose["payee"]["uid"],
      "recipientid":purpose["payee"]["customerid"],
      "PrivateID": null,
      "TransactionType":purpose["purpose"]["masterdatadescription"] == "Real property TAX" ? "P": "R",
      "recipientname": '${purpose["payee"]["firstname"]} ${purpose["payee"]["lastname"] ?? ""}',
      "documentnumber": purposeResponse["KEYVALUE"]["BAR CODE"],
      // 00319220022090,
      "additionaldocumentnumber":"",
      "startdate": purpose["date"]["start"],
      "expirydate": purpose["date"]["end"],
      "address": purposeResponse["KEYVALUE"]["Location"],
      "billdate": purposeResponse["KEYVALUE"]["Bill Date"],
      "contractamount": paymentResponse["billamount"],
      "discount": "0.0",
      "carditconvfee": paymentResponse["CC_carditnowfee"],
      "payamount": paymentResponse["CC_totalamount"],
      "payid": 1,
      "paytype":"O",
      "status":""
    };
    var uri = Uri.parse(API().baseURL + API().lguPayment);
    var payload = json.encode(body);
    var tokens = GetStorage().read("save_token");

    var response = await http
        .post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $tokens',
          'accept': 'application/json',
        },
        body: payload)
        .timeout(const Duration(seconds: 20));
    hideLoading();
    print(response.statusCode.toString());
    print("body : " + response.body.toString());
    try{
    if (response.statusCode == 200){

        var data = json.decode(response.body);
        if (data != null) {
          var transaction =  data["transactionmaster"];
          Get.to(PaymentSuccessful(payee: payee, purpose: purpose, paymentType: type, payment: paymentResponse,transaction: transaction,));
        } else {
          Fluttertoast.showToast(msg: "$data");
        }

    } else {
  //              var message;
  //     try {
  //   message = json.decode(response.body);
  // } on FormatException catch (e) {
  //   message = response.body;
  //   print(e.message);
  // }
      Fluttertoast.showToast(msg: '${response.body}');
    }}
    catch(ex){
    Fluttertoast.showToast(msg: "$ex");
    }}

  housePaymentVerificationAPI(String type, var payee) async {
    showLoading();
    var body =
      {
    "customerid": MyApp.logindetails["userid"],
    "recipientid":0,
    "recipientuid":"",
    "purposeid": housePurpose["value"],
    "purpose": housePurpose["description"],
    "province": "",
    "billamount":"",
    "startdate": startDate.text,
    "enddate": endDate.text,
    "invoiceno": invoiceNoCnl.text,
    "invoicedate": invoiceDateCnl.text
      };
    var response = await BaseClient()
        .post(API().housePaymentVerify, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
    var dataValue = json.decode(response);
    var data = json.decode(dataValue);
    if (data["status"] == "success") {
      return "Success";
    } else {
      Fluttertoast.showToast(msg: "This is an existing Relationship");
      return null;
    }
  }

  void housePaymentDocumentAPI(String type, var payee) async {
    if(pickedFile != null) {
      Get.to(Registerloading());
      var body = {
        "verification_id": null,
        "customer_id": MyApp.logindetails["userid"],
        // "documentnumber":,
        // "documenttype":,
        // "payeeid":,
        // "payeeuid":,
        // "purpose":,
        // "pro_address":,
        // "startdate":,
        // "enddate":,
        // "invoicenumb":,
        // "invoicedate":,
        // "uploadfilename":,
        // "uploadpath":,
        // "status":"",
        "remarks":"",
        "uploadDoc": pickedFile
      };
      var response = await BaseClient()
          .post(API().housePaymentDocument, body)
          .catchError(handleError);
      Get.back();
      if (response == null) return;
        // var data = json.decode(response);
        // if (data["status"] == "success") {
        //   var jsonResponse = json.encode(data["data"]);
        //   var responce1 = json.decode(jsonResponse);
        //   var responce = json.decode(responce1);
          var house = {
            "payee": housePayee,
            "purpose": housePurpose,
            "house_no": addressNoCnl.text,
            "street": streetNameCnl.text,
            "province": province,
            "city": city,
            "postal_code": postalCode.text,
            "start": startDate.text,
            "end": endDate.text,
            "invoice":invoiceNoCnl.text,
            "invoice_date": invoiceDateCnl.text
          };
      var responce;
       responce = {
         "bankname":"HDFC",
         "accountno": "1234 **** **** 2342",
         "invoiceno": "12323232",
            "KEYVALUE": {
              "PIN": "003-19-003-07-004",
              "Taxpayer": "NACION, FELIX & EDITHA SPS",
              "Bill Date": "November 15, 2022",
              "Declared Owner": " NACION, FELIX & EDITHA SPS",
              "Location": "SAN BARTOLOME",
              "BILL AMOUNT": "P 75.68",
              "BAR CODE": "00319220022090"
            },
            "DOCNAME": "MUNICIPAL STATEMENT",
            "TableResult": {
              "statement summary": [
                {
                  "A/V": "4,730.00",
                  "PERIOD": "2023",
                  "BASIC": "47.30",
                  "D/P1": "-9.46",
                  "TOTAL": "75.68"
                }
              ]
            }
          };


          var dateList = responce["TableResult"]["statement summary"] ?? [];
          startYearList = dateList ?? [];
          endYearList = dateList ?? [];
          startYear = startYearList.first;
          endYear = endYearList.last;
          Get.to(PurposeDetails(
              paymentType: type, payee: payee, purpose: house, purposeResponse: responce));
        // } else {
        //   Fluttertoast.showToast(msg: "This is an existing Relationship");
        // }
      }
    else {
      Fluttertoast.showToast(msg: "Please Upload Statement of Account");
    }

  }

  housePaymentDetailsAPI(String type, var payee, var purpose, var purposeRes, String billAmount) async {
    showLoading();
    var body = {
      "billamount": billAmount,
    };
    var response = await BaseClient()
        .post(API().housePaymentDetails, body)
        .catchError(handleError);
    hideLoading();
    if (response == null) return;
      // var dataValue = json.decode(response);
      // var data = json.decode(dataValue);
        var details = {
          "start": startYear,
          "end": endYear,
          "bill_amount": billAmount
        };
    var data = {
      "paystatus":"paying",
      "username": "Raj",
      "profileurl": null,
      "CC_totalamount":"$billAmount",
      "CC_carditnowfee": "20",
      "billamount":"200",
      "feereason": "Some reason"
    };
    Get.to(OverviewPayment(payee: payee, purpose: purpose, paymentType: type, payment: details, paymentResponse: data,));
  }


   transactionListAPI() async {

    var body ={
      "customerid":MyApp.logindetails["userid"]
    };
    var response = await BaseClient()
        .post(API().recentransaction,body)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);

    transactionList.value = data;
  }


  // getlgu customers

   getlgu() async {
    var response = await BaseClient()
        .get(API().getlgucustomers)
        .catchError(handleError);
    if (response == null) return;
    var data = json.decode(response);
    getlgucust = data["lgUcustomers"];
  }


  locationPermission() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        Fluttertoast.showToast(msg: "you should have to enable location");
      }else if(permission == LocationPermission.deniedForever){
        print("'Location permissions are permanently denied");
        Fluttertoast.showToast(msg: "you should have to enable location");
      }else{
        print("GPS Location service is granted");
        return await getLocation();
      }
    }else{
      print("GPS Location permission granted.");
    return await getLocation();
    }
    return false;
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457
   return true;
  }

}