
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shuftipro_sdk/shuftipro_sdk.dart';

class Shuftipro{
  static const String clientId = "0a75ae5dd88a098765cac9d4e8d27f46c3ea3477e0670a452c3b31e02f295c21"; // enter client id here
  static const String secretKey = "gN9GRTB89OTWjbTd2Ue4CDYYPHw5hszm"; // enter secret key here

  var authObject = {
    "auth_type": "basic_auth",
    "client_id": clientId,
    "secret_key": secretKey,
  };


  Map<String, Object> createdPayload = {
    "country": "IN",
    "language": "EN",
    "email": "",
    "show_consent": 1,
    "show_privacy_policy": 1,
    "verification_mode": "image_only",
    "face": {},
    "document": {
      "supported_types": [
        "passport",
        "id_card",
        "driving_license",
        "credit_or_debit_card",
      ],
      "name": {
        "first_name": "frstName",
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
    "button_text_color" : "#FFFFFF",
    "button_background_color" : "#1F5AF6"
  };

  Future<void> initPlatformState() async {
    String response = '';
    try{
      response = await ShuftiproSdk.sendRequest(authObject: authObject,
          createdPayload: createdPayload, configObject: configObj);
      print(response.toString());
      print(response);
      Fluttertoast.showToast(msg: response.toString());
      Fluttertoast.showToast(msg: "$response");
    }catch(e){
      print(e);
    }
  }

  void continueFun() {
    var v = DateTime.now();
    var reference = "package_sample_Flutter_$v";
    createdPayload["reference"] = reference;
    initPlatformState();

  }
}