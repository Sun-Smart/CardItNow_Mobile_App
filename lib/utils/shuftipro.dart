import 'dart:convert';


import 'package:fluttertoast/fluttertoast.dart';

import 'package:shuftipro_sdk/shuftipro_sdk.dart';

import '../api/regster_api.dart';

import 'package:http/http.dart' as http;


class Shuftipro {
  static const String clientId =
      "0a75ae5dd88a098765cac9d4e8d27f46c3ea3477e0670a452c3b31e02f295c21"; // enter client id here
  static const String secretKey =
      "gN9GRTB89OTWjbTd2Ue4CDYYPHw5hszm"; // enter secret key here

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
      "proof": "",
      "additional_proof": "",
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

  Map<String, Object> configObj = {
    "open_webview": false,
    "asyncRequest": false,
    "captureEnabled": false,
    "dark_mode": false,
    "font_color": "#263B54",
    "button_text_color": "#004751",
    "button_background_color": "#CEE812"
  };

  Future<void> initPlatformState() async {
    try {
      var response = await ShuftiproSdk.sendRequest(
          authObject: authObject,
          createdPayload: createdPayload,
          configObject: configObj);
      var res = jsonDecode(response);
      if (res["event"] == "verification.accepted") {
        var body = jsonDecode(res["body"].toString());
        print(body.toString());
        ShuftiProValues = body;
      } else if (res["event"] == "verification.declined") {
        var body = jsonDecode(res["body"].toString());
        ShuftiProValues = body;
        Fluttertoast.showToast(msg: body["declined_reason"].toString());
      } else if (res["event"] == "verification.cancelled") {
        // print(res["message"].toString());
        ShuftiProValues = null;
        Fluttertoast.showToast(msg: res["message"].toString());
      } else {
        ShuftiProValues = null;
        Fluttertoast.showToast(msg: "Data get failed");
      }
    } catch (e) {
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
  //for web(shuftipro integration)........

   tokenRequest() async {
    var tokenapi = "https://api.shuftipro.com/get/access/token/";
    String username = clientId;
    String password = secretKey;
    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    var r = await http
        .post(Uri.parse(tokenapi), headers: {'authorization': basicAuth});
      var  token_access = json.decode(r.body);
      var tokenvalue= token_access["access_token"];
       print("testttt"+tokenvalue);
       return tokenvalue;
  }
  void loadreference(){
      var v = DateTime.now();
    var reference = "CardITNow${v.day}${v.millisecond}";
    var url_Callback='https://demo.herbie.ai/carditnow/#/';
    var url_redirect='https://demo.herbie.ai/carditnow/#/';
    createdPayload["reference"] = reference;
    createdPayload["callback_url"]=url_Callback;
    createdPayload["redirect_url"]=url_redirect;
     shuftiproweb();
  }

   shuftiproweb() async {
    var token = await tokenRequest();
    var url = 'https://api.shuftipro.com/';
    Map data = {
      "reference": "1645467",
      "callback_url": "http://www.example.com/",
      "email": "johndoe@example.com",
      "country": "GB",
      "language": "EN",
      "redirect_url": "http://www.example.com",
      "verification_mode": "image_only",
      "document": {
        "proof": "",
        "supported_types": ["id_card", "driving_license", "passport"],
        "name": "",
        "dob": "",
        "issue_date": "",
        "expiry_date": "",
        "document_number": ""
      },
      "address": {
        "proof": "",
        "supported_types": ["id_card", "bank_statement"],
        "name": "",
        "issue_date": "",
        "full_address": "",
        "address_fuzzy_match": "1"
      }
    };

    String body = json.encode(createdPayload);

    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          'Authorization':
              'Bearer $token',
        },
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
  }
  
  
  //
}
