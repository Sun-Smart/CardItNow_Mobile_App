// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/ui/register/select_avatar_screen.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../themes/styles.dart';
import 'register_screen.dart';
import 'twofactor.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final AuthCon con = Get.find();
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final middlenamecontroller = TextEditingController();
  final nicknamecontroller = TextEditingController();
  final cityNameController = TextEditingController();
  final stateNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final requiredNoController = TextEditingController();
  final dateOfBrithController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiredDateController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

  String? dropdownvalue;
  String? dropdownvalueCity;
  String? dropdownintrest;
  var selectedcountry = ['UAE', 'Philipines'];
  var philipinecity = ['Manila', 'Davao City', 'Cebu City', 'loliocity'];
  var uaecities = ['Dubai', 'Abudhabi', 'Sharjah', 'Fujariah'];
  var uaeData = ['UAE'];
  var interests = ["Racing", "Riding", "Gaming"];

  assignvalues(){
    if(con.profileinfo != {}){
      // firstNameController.text=con.profileinfo["firstname"];
      // lastNameController.text=con.profileinfo["lastname"];
      // dateOfBrithController.text=con.profileinfo[""]
    }

  }
  @override
  void initState() {
    assignvalues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: bulildbutton(),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black)),
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: Responsive.isMobile(context)
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              buildtitle(),
              buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      child:
      
      GetStorage().read('username') == null
          ? Text('Hey! Please Tell About Your Self!',
        style: TextStyle(
        fontSize: 28,
        fontFamily: 'Sora',
        color:
        themeChange.darkTheme ? Colors.white : HexColor('#004751'),
        fontWeight: FontWeight.bold,
      ),
      )
          : Text(
              'Hey ${GetStorage().read('username')}! Tell About Your Self',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Sora',
                color:
                    themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget buildForm() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCustomInputBox(
              enabled: true,
              label: "First Name ",
              controller: firstNameController,
              obsecureText: false,
              inputHint: "Your First Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (firstNameController.text.isEmpty) {
                  return "Please Enter First Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'First Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                // border: const OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey)),
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide:
                //         const BorderSide(color: Colors.grey, width: 1.0)),
                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide:
                //         const BorderSide(color: Colors.grey, width: 1.0)),
                // focusedErrorBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     gapPadding: 7,
                //     borderSide: const BorderSide(color: Colors.grey)),
                // errorBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide: const BorderSide(color: Colors.grey)),
                // errorStyle: const TextStyle(
                //     fontFamily: 'Sora',
                //     fontSize: 13,
                //     fontWeight: FontWeight.bold),
              ),
            ),

            // const SizedBox(height: 10),

            MyCustomInputBox(
              enabled: true,
              label: "Middle Name ",
              controller: middlenamecontroller,
              obsecureText: false,
              inputHint: "Your Middle Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (middlenamecontroller.text.isEmpty) {
                  return "Please Enter middle Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Middle Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                // border: const OutlineInputBorder(
                //     borderSide: BorderSide(color: Colors.grey)),
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide:
                //         const BorderSide(color: Colors.grey, width: 1.0)),
                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide:
                //         const BorderSide(color: Colors.grey, width: 1.0)),
                // focusedErrorBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     gapPadding: 7,
                //     borderSide: const BorderSide(color: Colors.grey)),
                // errorBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(4),
                //     borderSide: const BorderSide(color: Colors.grey)),
                // errorStyle: const TextStyle(
                //     fontFamily: 'Sora',
                //     fontSize: 13,
                //     fontWeight: FontWeight.bold),
              ),
            ),

            MyCustomInputBox(
              enabled: true,
              label: "Last Name ",
              controller: lastNameController,
              obsecureText: false,
              inputHint: "Your Last Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (lastNameController.text.isEmpty) {
                  return "Please Enter Last Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Last Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            MyCustomInputBox(
              enabled: true,
              keyboardType: TextInputType.none,
              label: "Date Of Brith",
              controller: dateOfBrithController,
              obsecureText: false,
              validator: (value) {
                if (dateOfBrithController.text.isEmpty) {
                  return "Please Select Date Of Brith...";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = (await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100)))!;
                    dateOfBrithController.text =
                        DateFormat("yyyy-MM-dd").format(date);
                  },
                  child: Icon(Icons.date_range, color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'YYYY-MM-DD',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            // MyCustomInputBox(
            //   enabled: true,
            //   label: "City ",
            //   controller: cityNameController,
            //   obsecureText: false,
            //   inputHint: "Your City Name",
            //   textInputType: TextInputType.text,
            //   validator: (value) {
            //     if (cityNameController.text.isEmpty) {
            //       return "Please Enter City Name...";
            //     } else {
            //       return null;
            //     }
            //   },
            //   textInputAction: TextInputAction.next,
            //   inputDecoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'City Name',
            //     floatingLabelBehavior: FloatingLabelBehavior.never,
            //     helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
            //     hintStyle: const TextStyle(
            //         fontSize: 12,
            //         fontFamily: 'Sora',
            //         fontWeight: FontWeight.normal),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //     focusColor: Colors.grey.shade300,
            //     border: const OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey)),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         gapPadding: 7,
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorStyle: const TextStyle(
            //         fontFamily: 'Sora',
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // const SizedBox(height: 10),
            // MyCustomInputBox(
            //   enabled: true,
            //   label: "State ",
            //   controller: stateNameController,
            //   obsecureText: false,
            //   inputHint: "Your State Name",
            //   textInputType: TextInputType.text,
            //   validator: (value) {
            //     if (stateNameController.text.isEmpty) {
            //       return "Please Enter State Name...";
            //     } else {
            //       return null;
            //     }
            //   },
            //   textInputAction: TextInputAction.next,
            //   inputDecoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'State Name',
            //     floatingLabelBehavior: FloatingLabelBehavior.never,
            //     helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
            //     hintStyle: const TextStyle(
            //       fontSize: 12,
            //       fontFamily: 'Sora',
            //       fontWeight: FontWeight.normal,
            //     ),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //     focusColor: Colors.grey.shade300,
            //     border: const OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey)),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         gapPadding: 7,
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorStyle: const TextStyle(
            //         fontFamily: 'Sora',
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),

            MyCustomInputBox(
              enabled: true,
              label: "Email id ",
              controller: con.emailController,
              obsecureText: false,
              inputHint: "Your First Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (con.emailController.text.isEmpty) {
                  return "Please Enter EmailId...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'First Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),

            MyCustomInputBox(
              enabled: true,
              label: "What Should we Called you ",
              controller: nicknamecontroller,
              obsecureText: false,
              inputHint: "Enter Your nick name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (nicknamecontroller.text.isEmpty) {
                  return "Please Enter Nick Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter Your Nick Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            MyCustomInputBox(
              enabled: true,
              label: "Phone Number",
              maxLength: 10,
              controller: requiredNoController,
              obsecureText: false,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              inputHint: "Your Required Number",
              validator: (value) {
                if (requiredNoController.text.isEmpty) {
                  return "Please Enter Required Number...";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Required Number',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),
            // MyCustomInputBox(
            //   enabled: true,
            //   label: "Issue Date",
            //   keyboardType: TextInputType.none,
            //   controller: issueDateController,
            //   obsecureText: false,
            //   validator: (value) {
            //     if (issueDateController.text.isEmpty) {
            //       return "Please Select Issue Date...";
            //     } else {
            //       return null;
            //     }
            //   },
            //   inputDecoration: InputDecoration(
            //     suffixIcon: GestureDetector(
            //       onTap: () async {
            //         DateTime date = DateTime(1900);
            //         FocusScope.of(context).requestFocus(new FocusNode());
            //         date = (await showDatePicker(
            //             context: context,
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime(1900),
            //             lastDate: DateTime(2100)))!;
            //         issueDateController.text =
            //             DateFormat("yyyy-MM-dd").format(date);
            //       },
            //       child: Icon(Icons.date_range, color: Colors.black),
            //     ),
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'YYYY-MM-DD',
            //     floatingLabelBehavior: FloatingLabelBehavior.never,
            //     helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
            //     hintStyle: const TextStyle(
            //       fontSize: 12,
            //       fontFamily: 'Sora',
            //       fontWeight: FontWeight.normal,
            //     ),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //     focusColor: Colors.grey.shade300,
            //     border: const OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey)),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         gapPadding: 7,
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorStyle: const TextStyle(
            //         fontFamily: 'Sora',
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // // const SizedBox(height: 10),
            // MyCustomInputBox(
            //   enabled: true,
            //   label: "Expired Date",
            //   keyboardType: TextInputType.none,
            //   controller: expiredDateController,
            //   obsecureText: false,
            //   validator: (value) {
            //     if (expiredDateController.text.isEmpty) {
            //       return "Please Select Expired Date...";
            //     } else {
            //       return null;
            //     }
            //   },
            //   inputDecoration: InputDecoration(
            //     suffixIcon: GestureDetector(
            //       onTap: () async {
            //         DateTime date = DateTime(1900);
            //         FocusScope.of(context).requestFocus(new FocusNode());
            //         date = (await showDatePicker(
            //             context: context,
            //             initialDate: DateTime.now(),
            //             firstDate: DateTime(1900),
            //             lastDate: DateTime(2100)))!;
            //         expiredDateController.text =
            //             DateFormat("yyyy-MM-dd").format(date);
            //       },
            //       child: Icon(Icons.date_range, color: Colors.black),
            //     ),
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'YYYY-MM-DD',
            //     floatingLabelBehavior: FloatingLabelBehavior.never,
            //     helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
            //     hintStyle: const TextStyle(
            //         fontSize: 12,
            //         fontFamily: 'Sora',
            //         fontWeight: FontWeight.normal),
            //     contentPadding:
            //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            //     focusColor: Colors.grey.shade300,
            //     border: const OutlineInputBorder(
            //         borderSide: BorderSide(color: Colors.grey)),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide:
            //             const BorderSide(color: Colors.grey, width: 1.0)),
            //     focusedErrorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         gapPadding: 7,
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(4),
            //         borderSide: const BorderSide(color: Colors.grey)),
            //     errorStyle: const TextStyle(
            //         fontFamily: 'Sora',
            //         fontSize: 13,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            const SizedBox(height: 10),
            MyCustomInputBox(
              enabled: true,
              label: "Address",
              controller: addressController,
              obsecureText: false,
              validator: (value) {
                if (addressController.text.isEmpty) {
                  return "Please Enter Address...";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your Address',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text('Select Your Interests',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        color: Styles.whitecustomlable))),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.5
                      : MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  underline: const SizedBox(),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  value: dropdownintrest,
                  hint: Text('Select Your Interests',
                      style: TextStyle(
                          color: Styles.whitecustomlable, fontSize: 14)),
                  icon: InkWell(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                    // color: themeChange.darkTheme
                    //     ? Colors.white
                    //     : Colors.black45
                  )),
                  items: interests.map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      // dropdownvalueCity = null;
                      dropdownintrest = newValue!;
                      // con.choosedDocId = newValue;
                      // con.isUAE.value = dropdownvalue == 'UAE' ? true : false;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 10),
            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text('Select Your country',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        color: Styles.whitecustomlable))),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.5
                      : MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  underline: const SizedBox(),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  value: dropdownvalue,
                  hint: Text('Select Your Country',
                      style: TextStyle(
                          color: Styles.whitecustomlable, fontSize: 14)),
                  icon: InkWell(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                    // color: themeChange.darkTheme
                    //     ? Colors.white
                    //     : Colors.black45
                  )),
                  items: selectedcountry.map((String item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item,
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueCity = null;
                      dropdownvalue = newValue!;
                      con.choosedDocId = newValue;
                      con.isUAE.value = dropdownvalue == 'UAE' ? true : false;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),

            Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text('Select Your City',
                    style: TextStyle(
                        fontFamily: 'Sora',
                        fontSize: 14,
                        color: Styles.whitecustomlable))),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
                  : Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width / 4.5
                      : MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 15,
              decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0XffB7C5C7), width: 1.5),
                  borderRadius: const BorderRadius.all(Radius.circular(3))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  underline: const SizedBox(),
                  dropdownColor: Colors.white,
                  isExpanded: true,
                  value: dropdownvalueCity,
                  hint: Text('Select Your City',
                      style: TextStyle(
                          color: Styles.whitecustomlable, fontSize: 14)),
                  icon: InkWell(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                    // color: themeChange.darkTheme
                    //     ? Colors.white
                    //     : Colors.black45
                  )),
                  items: con.isUAE.value
                      ? uaecities.map((String item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)));
                        }).toList()
                      : philipinecity.map((String item) {
                          return DropdownMenuItem(
                              value: item,
                              child: Text(item,
                                  style: const TextStyle(
                                      color: Color(0Xff413D4B), fontSize: 14)));
                        }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalueCity = newValue!;
                      con.choosedDocId = newValue;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 10),
            MyCustomInputBox(
              enabled: true,
              label: "Postal Code",
              validator: (value) {
                if (postalCodeController.text.isEmpty) {
                  return "Please Enter Postal Code...";
                } else {
                  return null;
                }
              },
              controller: postalCodeController,
              obsecureText: false,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your Postal Code',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.normal,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    gapPadding: 7,
                    borderSide: const BorderSide(color: Colors.grey)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                errorStyle: const TextStyle(
                    fontFamily: 'Sora',
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget bulildbutton() {
    return AuthButton(
        decoration: BoxDecoration(
            color: HexColor('#CEE812'), borderRadius: BorderRadius.circular(5)),
        onTap: () {

            if (firstNameController.text.isEmpty) {
              Fluttertoast.showToast(
                  msg: "Enter your First name");
            }
            else if(lastNameController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your last name");
            }
            else if(dateOfBrithController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your Date of birth");
            }
            else if(dateOfBrithController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your Date of birth");
            }
            else if(addressController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your address");
            }
            else if(requiredNoController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your mobile no");
            }
            else if(postalCodeController.text.isEmpty){
              Fluttertoast.showToast(
                  msg: "Enter your postalcode");
            }


            else {
              con.profileInformatrion(
                con.emailController.text,
                firstNameController.text,
                lastNameController.text,
                cityNameController.text,
                stateNameController.text,
                requiredNoController.text,
                dateOfBrithController.text,
                // issueDateController.text,
                // expiredDateController.text,
                addressController.text,
                postalCodeController.text,
              );
              // Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
            }
          },

        text: "Next");
  }
}
