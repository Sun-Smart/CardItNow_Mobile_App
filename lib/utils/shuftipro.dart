
import 'package:shuftipro_sdk/shuftipro_sdk.dart';

class Shuftipro{
  static const String clientId = ""; // enter client id here
  static const String secretKey = ""; // enter secret key here

  var authObject = {
    "auth_type": "basic_auth",
    "client_id": clientId,
    "secret_key": secretKey,
  };


  Map<String, Object> createdPayload = {
    "country": "PH",
    "language": "EN",
    "email": "",
    "callback_url": "http://www.example.com",
    "redirect_url": "https://www.mydummy.package_sample.com/",
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
      print(response);

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