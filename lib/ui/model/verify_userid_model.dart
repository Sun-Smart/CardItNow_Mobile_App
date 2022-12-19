class userIdModel {
  String? userID;
  String? userIDNumber;
  String? uploadProfile;

  userIdModel({this.userID, this.userIDNumber, this.uploadProfile});

  //From the Server
  userIdModel.fromJson (Map<String, dynamic> json){
    userID = json['userId'];
    userIDNumber = json['userIDNumber'];
    uploadProfile = json['uploadProfile'];
  }

  //To the server
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userIDNumber'] = this.userIDNumber;
    data['uploadProfile'] = this.uploadProfile;
    return data;
  }

}