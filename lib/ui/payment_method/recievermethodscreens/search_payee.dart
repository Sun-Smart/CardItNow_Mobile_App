
import 'package:cardit/api/regster_api.dart';
import 'package:cardit/ui/payment_method/recievermethodscreens/reciever_transaction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/custom_input.dart';

class SearchPayee extends StatefulWidget {
  const SearchPayee({Key? key}) : super(key: key);

  @override
  State<SearchPayee> createState() => _SearchPayeeState();
}

class _SearchPayeeState extends State<SearchPayee> {
  RegisterAPI reg = RegisterAPI();

  @override
  void initState() {
    super.initState();
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
        title: const Text("Search Results",

          style: TextStyle(
              fontSize: 18, fontFamily: "Sora",color: Color(0Xff004751),fontWeight: FontWeight.bold
          ),),
      ),
      body:  Obx(()=>
          Column(
            children: [
              MyCustomInputBox(
                controller: reg.payeeSearchCnl,
                obsecureText: false,
                read: false,
                textInputType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  reg.payeeSearchListAPI();
                },
                inputDecoration: InputDecoration(
                    suffixIcon:  Icon(Icons.search),
                    border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                    hintText: "Search",
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Color(0xFFE5E5E5))),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    helperStyle:
                    const TextStyle(fontFamily: 'Sora', fontSize: 14),
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(65, 61, 75, 0.6))),
                enabled: true,
              ),
              const SizedBox(height: 10),
              reg.payeeSearchList.isNotEmpty
             ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: EdgeInsets.all(5),
                   child: Text("Search Results",

                     style: TextStyle(
                         fontSize: 15, fontFamily: "Sora",color: Colors.black,fontWeight: FontWeight.bold
                     ),),
                 ),
                 ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
                      itemCount: reg.payeeSearchList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = reg.payeeSearchList[index];
                        return payeeWidget(item);
                      }),
               ],
             )
              : Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/notesimg.png',
                        fit: BoxFit.cover,
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'User not found',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff413D4B),
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {

                        },
                        child: Text(
                          'Send the Invite link',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:  HexColor('#CEE812'),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }

  Widget payeeWidget(var item) {
    return InkWell(
      onTap: (){
        Get.to(ReceiverTransaction(payee: item,));
      },
      child: ListTile(
        leading: Container(
          alignment: Alignment.center,
          width: 40, height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: HexColor('#CEE812'),
          ),

          child: Text(getInitials(item["name"]),
              style: TextStyle(
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                  color: HexColor('#036D7B'),
                  fontSize: 16)),
        ),
        // Image.asset('assets/banner/down_arrow.png', width: 40, height: 40),
        title: Text('${item["name"]}',
            style: const TextStyle(
                fontFamily: 'Sora',
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        subtitle: Text('${item["email"]}',
            style: const TextStyle(
                fontFamily: 'Sora',
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ),
    );
  }
}
