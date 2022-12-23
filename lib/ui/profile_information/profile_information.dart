import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
          leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black)),
      body: Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              enabled: false,
              label: "First Name ",
              controller: firstNameController,
              obsecureText: false,
              inputHint: "Your First Name",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Last Name ",
              controller: lastNameController,
              obsecureText: false,
              inputHint: "Your Last Name",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Required Number",
              controller: requiredNoController,
              obsecureText: false,
              inputHint: "Your Required Number",
            ),
            MyCustomInputBox(
              label: "Date Of Brith ",
              controller: dateOfBrithController,
              obsecureText: false,
              enabled: false,
              inputHint: "Your Date Of Brith",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Issue ",
              controller: issueDateController,
              obsecureText: false,
              inputHint: "Your Issue",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Expired Date",
              controller: expiredDateController,
              obsecureText: false,
              inputHint: "Your Expired Date",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Address",
              controller: addressController,
              obsecureText: false,
              inputHint: "Your Address",
            ),
            MyCustomInputBox(
              enabled: false,
              label: "Postal Code",
              controller: postalCodeController,
              obsecureText: false,
              inputHint: "Your Postal Code",
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
          Navigator.of(context).pushNamed('/avatarPageView');
        },
        text: "Next");
  }
}
