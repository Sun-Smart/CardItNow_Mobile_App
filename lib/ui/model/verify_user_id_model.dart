class verifyUserIdModel {
  String? userID;
  dynamic? userIDNumber;
  String? uploadProfile;

  verifyUserIdModel({
    this.userID,
    this.userIDNumber,
    this.uploadProfile,
  });

  //From the Server
  verifyUserIdModel.fromJson(Map<String, dynamic> json) {
    userID = json['userId'];
    userIDNumber = json['userIDNumber'];
    uploadProfile = json['uploadProfile'];
  }

  //To the server
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['userIDNumber'] = this.userIDNumber;
    data['uploadProfile'] = this.uploadProfile;
    return data;
  }
}
