
import 'package:cardit/api/regster_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  RegisterAPI reg = RegisterAPI();

  @override
  void initState() {
    reg.notificationListAPI();
    super.initState();
  }

  String getNotificationTime(String dateTime){
    DateTime lastDate = DateTime.parse(dateTime);
    if (!DateTime.now().difference(lastDate).isNegative) {
      if (DateTime.now().difference(lastDate).inMinutes < 1) {
        return "few seconds";
      } else if (DateTime.now().difference(lastDate).inMinutes < 60) {
        return "${DateTime.now().difference(lastDate).inMinutes} minutes";
      } else if (DateTime.now().difference(lastDate).inMinutes < 1440) {
        return "${DateTime.now().difference(lastDate).inHours} hours";
      } else if (DateTime.now().difference(lastDate).inMinutes > 1440) {
        return "${DateTime.now().difference(lastDate).inDays} days";
      }
    }
    return "";
  }

  String getInitials(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black
        ),
        centerTitle: true,
        title: const Text("Notification",

          style: TextStyle(
              fontSize: 18, fontFamily: "Sora",color: Color(0Xff004751),fontWeight: FontWeight.bold
          ),),
      ),
      body:  Obx(()=>
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: reg.notificationList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = reg.notificationList[index];
                return notificationWidget(item);
              }),
      ),
    );
  }

  Widget notificationWidget(var item) {
    return ListTile(
      leading: Container(
        alignment: Alignment.center,
          width: 40, height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: HexColor('#CEE812'),
        ),

        child: Text(getInitials(item["paidto"]),
            style: TextStyle(
            fontFamily: 'Sora',
            fontWeight: FontWeight.bold,
            color: HexColor('#036D7B'),
            fontSize: 16)),
      ),
      // Image.asset('assets/banner/down_arrow.png', width: 40, height: 40),
      title: Text('${item["title"]}',
    style: const TextStyle(
    fontFamily: 'Sora',
    fontWeight: FontWeight.bold,
        fontSize: 16)),
      subtitle: Text(getNotificationTime(item["date"]),
    style: const TextStyle(
    fontFamily: 'Sora',
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 16)),
      trailing: TextButton(
    onPressed: () {  },
    child: Text('Pay Now',
    style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: HexColor('#036D7B'),
    fontFamily: 'Sora')),
    ),
    );
  }
}
