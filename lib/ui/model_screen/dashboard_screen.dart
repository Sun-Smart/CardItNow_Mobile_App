import 'package:cardit/ui/model_screen/user_screen.dart';

class DataDashboard {
  String date;

  List<DataUser> user;
  List<DataUser> partners;

  DataDashboard.fromJson(Map<String, dynamic> map)
      : date = map['date'] == null ? '' : map['date'],
        user = map['user'] == null
            ? []
            : (map['user'] as List)
                .map((item) => DataUser.fromJson(item))
                .toList(),
        partners = map['partners'] == null
            ? []
            : (map['partners'] as List)
                .map((item) => DataUser.fromJson(item))
                .toList();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'date': date,
      'user': user.map((e) => e.toMap()).toList(),
      'partners': user.map((e) => e.toMap()).toList(),
    };
    return map;
  }
}
