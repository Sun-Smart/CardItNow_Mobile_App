import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class RecipientType extends StatefulWidget {
  const RecipientType({super.key});

  @override
  State<RecipientType> createState() => _RecipientTypeState();
}

class _RecipientTypeState extends State<RecipientType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        centerTitle: true,
        title: const Text("Select Type of Seller",
            style: TextStyle(
              color: Color(0xFF413D4B),
              fontSize: 16,
              fontFamily: "Sora",
              fontWeight: FontWeight.w600,
            )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          individualrecipient(),
          const SizedBox(
            height: 20,
          ),
          registeredrecipient()
        ],
      ),
    );
  }

  Widget individualrecipient() {
    return InkWell(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Individual Recipient",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Recipient like Landloards , Tution Teachers etc.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w200,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {},
    );
  }

  Widget registeredrecipient() {
    return InkWell(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: const Color(0xFFE5E5E5)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Registered Recipient",
                      style: TextStyle(
                          color: HexColor('#004751'),
                          fontFamily: "Sora",
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Flexible(
                      child: Text(
                        "Pay to Recipient like Fasion Stores, Grocery Stores etc.",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 14,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w200,
                            color: Color.fromRGBO(65, 61, 75, 0.5)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
