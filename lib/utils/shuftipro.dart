
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:shuftipro_sdk/shuftipro_sdk.dart';

import '../api/regster_api.dart';

class Shuftipro{
  static const String clientId = "0a75ae5dd88a098765cac9d4e8d27f46c3ea3477e0670a452c3b31e02f295c21"; // enter client id here
  static const String secretKey = "gN9GRTB89OTWjbTd2Ue4CDYYPHw5hszm"; // enter secret key here
  RegisterAPI reg = RegisterAPI();
  var authObject = {
    "auth_type": "basic_auth",
    "client_id": clientId,
    "secret_key": secretKey,
  };


  Map<String, Object> createdPayload = {
    "country": "PH",
    "language": "EN",
    "email": "",
    "show_consent": 0,
    "show_privacy_policy": 0,
    "verification_mode": "image_only",
    "face": {},
    "document": {
      "proof":"",
      "additional_proof":"",
      "supported_types": [
        "passport",
        "id_card",
        "driving_license",
        "credit_or_debit_card",
      ],
      "name": {
        "first_name": "",
        "last_name": "",
        "middle_name": "",
      },
      "dob": "",
      "document_number": "",
      "expiry_date": "",
      "issue_date": "",
      "fetch_enhanced_data": "",
      "gender": "",
      "backside_proof_required": "0",
    },
  };

  Map<String,Object> configObj = {
    "open_webview": false,
    "asyncRequest": false,
    "captureEnabled": false,
    "dark_mode" : false,
    "font_color" : "#263B54",
    "button_text_color" : "#004751",
    "button_background_color" : "#CEE812"
  };

  Future<void> initPlatformState() async {
    try{
     var response = await ShuftiproSdk.sendRequest(authObject: authObject,
          createdPayload: createdPayload, configObject: configObj);
     var res = response;
     if(res["event"] == "verification.accepted"){
       var body = jsonDecode(res["body"].toString());
       print(body.toString());
       ShuftiProValues = body;
     } else if(res["event"] == "verification.declined"){
       var body = jsonDecode(res["body"].toString());
       ShuftiProValues = body;
       Fluttertoast.showToast(msg: body["declined_reason"].toString());
     }
     else if(res["event"] == "verification.cancelled"){
      // print(res["message"].toString());
       ShuftiProValues = null;
       Fluttertoast.showToast(msg: res["message"].toString());
     } else{
       ShuftiProValues = null;
       Fluttertoast.showToast(msg: "Data get failed");
     }
    }catch(e){
      ShuftiProValues = null;
      print("Shuftipro : " + e.toString());
    }
  }

  void continueFun() {
    var v = DateTime.now();
    var reference = "CardITNow${v.day}${v.millisecond}";
    createdPayload["reference"] = reference;
    initPlatformState();

  }
}