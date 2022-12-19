class DataUser {
  String title;
  String url;

  DataUser.fromJson(Map<String, dynamic> map)
      : title = map['title'] == null ? '' : map['title'].toString(),
        url = map['url'] == null ? '' : map['url'].toString();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'url': url,
    };
    return map;
  }
}
