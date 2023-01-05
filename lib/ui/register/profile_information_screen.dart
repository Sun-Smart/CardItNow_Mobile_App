// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print

import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final requiredNoController = TextEditingController();
  final dateOfBrithController = TextEditingController();
  final issueDateController = TextEditingController();
  final expiredDateController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();

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
      child: Text(
        'Profile Information',
        style: TextStyle(
          fontSize: 28,
          fontFamily: 'Sora',
          color: themeChange.darkTheme ? Colors.white : HexColor('#004751'),
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
              label: "Required Number",
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
                hintText: 'Date Of Brith',
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
              label: "Issue Date",
              keyboardType: TextInputType.none,
              controller: issueDateController,
              obsecureText: false,
              validator: (value) {
                if (issueDateController.text.isEmpty) {
                  return "Please Select Issue Date...";
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
                    issueDateController.text =
                        DateFormat("yyyy-MM-dd").format(date);
                  },
                  child: Icon(Icons.date_range, color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your Issue',
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
              label: "Expired Date",
              keyboardType: TextInputType.none,
              controller: expiredDateController,
              obsecureText: false,
              validator: (value) {
                if (expiredDateController.text.isEmpty) {
                  return "Please Select Expired Date...";
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
                    expiredDateController.text =
                        DateFormat("yyyy-MM-dd").format(date);
                  },
                  child: Icon(Icons.date_range, color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your Expired Date',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.normal),
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
          if (formKey.currentState!.validate()) {
            if (issueDateController.text != expiredDateController.text) {
              Fluttertoast.showToast(msg: "Date has mismatched");
            }
            print('Done');
          } else {
            //   Get.to(() => isChecked1 == true ? Twofactor() : AvatarPageView());
          }
        },
        text: "Next");
  }
}
