import 'package:cardit/const/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../api/regster_api.dart';
import '../../themes/styles.dart';

class ProfileInformation extends StatefulWidget {
  const ProfileInformation({Key? key}) : super(key: key);

  @override
  State<ProfileInformation> createState() => _ProfileInformationState();
}

class _ProfileInformationState extends State<ProfileInformation> {
  final RegisterAPI reg = Get.put(RegisterAPI());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // print(reg.postalCodeController.text);
    // if(reg.dropdownvalue!=null){
    //   reg.cityselection(reg.dropdownvalue["geoid"].toString());
    // }
    // reg.assignProfileInfo();
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context) ? bulildbutton() : null,
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.transparent,
              leading: BackButton(
                  color: themeChange.darkTheme ? Colors.white : Colors.black))
          : null,
      body: Responsive.isMobile(context)
          ? Container(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: reg.dropdownvalue == null
                    ? Center(
                        child: LinearProgressIndicator(
                        backgroundColor: HexColor('#004751'),
                        valueColor: AlwaysStoppedAnimation(Colors.green),
                      ))
                    : Column(
                        crossAxisAlignment: Responsive.isMobile(context)
                            ? CrossAxisAlignment.start
                            : CrossAxisAlignment.center,
                        children: [
                          buildtitle(),
                          buildForm(),
                          // bulildbutton()
                        ],
                      ),
              ),
            )
          : Responsive.isDesktop(context)
              ? Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Container(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildToptitle(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildtitle(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              buildformweb(),
                              //  buildtitle(),
                            ],
                          ),
                        ],
                        //  buildToptitle(),
                      ),
                    ),
                  )
                ])
              : Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    //   height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: MediaQuery.of(context).size.height / 3)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildToptitle(),
                          buildtitle(),
                          buildForm(),
                          buttontab()
                        ],
                      ),
                    ),
                  )
                ]),
    );
  }

  Widget buildToptitle() {
    // final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      IconButton(
        hoverColor: Colors.transparent,
        icon: Icon(Icons.arrow_back, size: 30),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      Container()
    ]);
  }

//for web,mobile,tablet......
  Widget buildtitle() {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      padding: Responsive.isMobile(context)
          ? EdgeInsets.all(15)
          : Responsive.isDesktop(context)
              ? EdgeInsets.only(left: MediaQuery.of(context).size.width / 6)
              : EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reg.firstNameController.text.isEmpty
              ? Text(
                  'Hey! Please Tell About Your Self!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    color: themeChange.darkTheme
                        ? Colors.white
                        : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Hey ${reg.firstNameController.text} Tell About Your Self! ',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    color: themeChange.darkTheme
                        ? Colors.white
                        : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }

//for web.......
  Widget buildformweb() {
    return Container(
        width: MediaQuery.of(context).size.width / 1.56,
        //padding: const EdgeInsets.all(15),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "First Name *",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: false,
                            //  label: "First Name",
                            controller: reg.firstNameController,
                            obscureText: false,
                            // inputHint: "Your First Name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (reg.firstNameController.text.isEmpty) {
                                return "Please Enter First Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              labelStyle: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              // filled: true,
                              // fillColor: Colors.white,
                              hintText: 'First Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Middle Name *",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: false,
                            //  label: "First Name",
                            controller: reg.middleNameController,
                            obscureText: false,
                            // inputHint: "Your First Name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (reg.middleNameController.text.isEmpty) {
                                return "Please Enter Middle Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              labelStyle: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              // filled: true,
                              // fillColor: Colors.white,
                              hintText: 'Middle Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Last Name *",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: false,
                            //  label: "First Name",
                            controller: reg.lastNameController,
                            obscureText: false,
                            // inputHint: "Your First Name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (reg.lastNameController.text.isEmpty) {
                                return "Please Enter Last Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              labelStyle: TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              // filled: true,
                              // fillColor: Colors.white,
                              hintText: 'Last Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date Of Birth",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            keyboardType: TextInputType.none,
                            // label: "Date Of Brith",
                            controller: reg.dateOfBrithController,
                            obscureText: false,
                            validator: (value) {
                              if (reg.dateOfBrithController.text.isEmpty) {
                                return "Please Select Date Of Brith...";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              suffixIcon: GestureDetector(
                                onTap: () async {
                                  DateTime? date = DateTime(1900);
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  date = (await showDatePicker(
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: ColorScheme.light(
                                              primary: HexColor('#CEE812'),
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                primary: HexColor(
                                                    '#CEE812'), // button text color
                                              ),
                                            ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                      context: context,
                                      initialDate:
                                          DateTime(DateTime.now().year - 18),
                                      firstDate: DateTime(1900),
                                      lastDate:
                                          DateTime(DateTime.now().year - 18)));
                                  if (date != null) {
                                    reg.dateOfBrithController.text =
                                        DateFormat("yyyy-MM-dd").format(date);
                                  }
                                },
                                child:
                                    Icon(Icons.date_range, color: Colors.black),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'YYYY-MM-DD',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "What should we call you?",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "What Should we Called you ",
                            controller: reg.nickNameController,
                            obscureText: false,
                            // inputHint: "Enter Your nick name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (reg.nickNameController.text.isEmpty) {
                                return "Please Enter Nick Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Your Nick Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter your Email",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "Email id ",
                            controller: reg.emailController,
                            obscureText: false,
                            // inputHint: "Enter Valid Email id",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (reg.emailController.text.isEmpty) {
                                return "Please Enter EmailId...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Enter Your Email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Phone Number *",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            enabled: true,
                            //: "Phone Number",
                            maxLength:
                                reg.dropdownvalue["geoname"] == "UAE" ? 9 : 8,
                            controller: reg.mobileNoController,
                            obscureText: false,
                            keyboardType: TextInputType.number,

                            textInputAction: TextInputAction.next,
                            //inputHint: "Your Required Number",
                            validator: (value) {
                              if (reg.mobileNoController.text.isEmpty) {
                                return "Please Enter Required Number...";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              prefixIcon: TextButton(
                                  onPressed: () {},
                                  child: reg.dropdownvalue["geoname"] == "UAE"
                                      ? Text(
                                          "+971",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'sora',
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          "+63",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'sora',
                                              fontWeight: FontWeight.bold),
                                        )),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Required Number',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            //  label: "Gender",

                            controller: reg.genderController,
                            obscureText: false,
                            validator: (value) {},
                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: Colors.transparent,
                              fillColor: Colors.white,
                              hintText: 'Your Gender',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.bold,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            //   label: "Address",
                            controller: reg.addressController,
                            obscureText: false,
                            validator: (value) {
                              // if (addressController.text.isEmpty) {
                              //   return "Please Enter Address...";
                              // } else {
                              //   return null;
                              // }
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Your House No',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Building Name',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                         SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            //  label: "Building Name",
                            controller: reg.buildingNameController,
                            obscureText: false,
                            validator: (value) {
                              // if (addressController.text.isEmpty) {
                              //   return "Please Enter Address...";
                              // } else {
                              //   return null;
                              // }
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Your Building Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Street Name',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                         SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            //  label: "Street Name",
                            controller: reg.streetNameController,
                            obscureText: false,
                            validator: (value) {},
                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: Colors.transparent,
                              fillColor: Colors.white,
                              hintText: 'Your Street Name',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 13,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0XffB7C5C7), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: reg.dropdownvalue,
                              hint: Text('Select Your Country',
                                  style: TextStyle(
                                      color: Styles.whitecustomlable,
                                      fontSize: 14)),
                              icon: InkWell(
                                  child: Icon(
                                Icons.keyboard_arrow_down,
                                // color: themeChange.darkTheme
                                //     ? Colors.white
                                //     : Colors.black45
                              )),
                              items: reg.pickcountry.map((dynamic item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item["geoname"],
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                reg.dropdownvalue = newValue!;
                                reg
                                    .cityselection(
                                        reg.dropdownvalue["geoid"].toString())
                                    .then((value) {
                                  setState(() {
                                    reg.pickcity;
                                  });
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                 SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 13,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0XffB7C5C7), width: 1.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(3))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: reg.dropdownvalueCity,
                              hint: Text('Select Your city',
                                  style: TextStyle(
                                      color: Styles.whitecustomlable,
                                      fontSize: 14)),
                              icon: InkWell(
                                  child: Icon(
                                Icons.keyboard_arrow_down,
                              )),
                              items: reg.pickcity.map((dynamic item) {
                                return DropdownMenuItem(
                                    value: item,
                                    child: Text(item["cityname"],
                                        style: const TextStyle(
                                            color: Color(0Xff413D4B),
                                            fontSize: 14)));
                              }).toList(),
                              onChanged: (dynamic newValue) {
                                setState(() {
                                  reg.dropdownvalueCity = newValue!;
                                });
                              },
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Postal Code',
                          style: TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            enabled: true,
                            //  label: "Postal Code",
                            validator: (value) {
                              if (reg.postalCodeController.text.isEmpty) {
                                return "Please Enter Postal Code...";
                              } else {
                                return null;
                              }
                            },
                            controller: reg.postalCodeController,
                            obscureText: false,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Your Postal Code',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              helperStyle: const TextStyle(
                                  fontFamily: 'Sora', fontSize: 14),
                              hintStyle: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Sora',
                                fontWeight: FontWeight.normal,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              focusColor: Colors.grey.shade300,
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0)),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  gapPadding: 7,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              errorStyle: const TextStyle(
                                  fontFamily: 'Sora',
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (reg.firstNameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your First name");
                        } else if (reg.dateOfBrithController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter your Date of birth");
                        } else if (reg.addressController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your address");
                        } else if (reg.mobileNoController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your mobile no");
                        } else if (reg.dropdownvalueCity != null) {
                          Fluttertoast.showToast(msg: "Select City");
                        } else if (reg.postalCodeController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your postalcode");
                        } else {
                          reg.profileInformatrion();
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        width: Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.width / 1
                            : Responsive.isDesktop(context)
                                ? MediaQuery.of(context).size.width / 4.4
                                : MediaQuery.of(context).size.width / 2.5,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: HexColor('#CEE812'),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: HexColor('#004751'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }

  Widget buttontab() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            if (reg.firstNameController.text.isEmpty) {
              Fluttertoast.showToast(msg: "Enter your First name");
            } else if (reg.dateOfBrithController.text.isEmpty) {
              Fluttertoast.showToast(msg: "Enter your Date of birth");
            } else if (reg.addressController.text.isEmpty) {
              Fluttertoast.showToast(msg: "Enter your address");
            } else if (reg.mobileNoController.text.isEmpty) {
              Fluttertoast.showToast(msg: "Enter your mobile no");
            } else if (reg.dropdownvalueCity != null) {
              Fluttertoast.showToast(msg: "Select City");
            } else if (reg.postalCodeController.text.isEmpty) {
              Fluttertoast.showToast(msg: "Enter your postalcode");
            } else {
              reg.profileInformatrion();
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width / 1
                : Responsive.isDesktop(context)
                    ? MediaQuery.of(context).size.width / 4.4
                    : MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
                color: HexColor('#CEE812'),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                "Next",
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#004751'),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildForm() {
    return Container(
      padding:
          Responsive.isMobile(context) ? EdgeInsets.all(15) : EdgeInsets.all(5),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyCustomInputBox(
              enabled: false,
              label: "First Name",
              controller: reg.firstNameController,
              obsecureText: false,
              inputHint: "Your First Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (reg.firstNameController.text.isEmpty) {
                  return "Please Enter First Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                labelStyle: const TextStyle(
                    fontFamily: 'Sora', fontWeight: FontWeight.bold),
                // filled: true,
                // fillColor: Colors.white,
                hintText: 'First Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
              ),
            ),

            // const SizedBox(height: 10),

            MyCustomInputBox(
              enabled: false,
              label: "Middle Name ",
              controller: reg.middleNameController,
              obsecureText: false,
              inputHint: "Your Middle Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (reg.middleNameController.text.isEmpty) {
                  return "Please Enter middle Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                // filled: true,
                // fillColor: Colors.white,
                hintText: 'Middle Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                focusColor: Colors.grey.shade300,
              ),
            ),

            MyCustomInputBox(
              enabled: false,
              label: "Last Name",
              controller: reg.lastNameController,
              obsecureText: false,
              inputHint: "Your Last Name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (reg.lastNameController.text.isEmpty) {
                  return "Please Enter Last Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                hintText: 'Last Name',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
              label: "Date Of Brith *",
              controller: reg.dateOfBrithController,
              obsecureText: false,
              validator: (value) {
                if (reg.dateOfBrithController.text.isEmpty) {
                  return "Please Select Date Of Brith...";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                suffixIcon: GestureDetector(
                  onTap: () async {
                    DateTime? date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = (await showDatePicker(
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: HexColor('#004751'),
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: TextButton.styleFrom(
                                  primary:
                                      HexColor('#004751'), // button text color
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year - 18)));
                    if (date != null) {
                      reg.dateOfBrithController.text =
                          DateFormat("yyyy-MM-dd").format(date);
                    }
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

            MyCustomInputBox(
              enabled: true,
              label: "Email ID",
              controller: reg.emailController,
              obsecureText: false,
              inputHint: "Your Email ID",
              textInputType: TextInputType.text,
              validator: (value) {
                if (reg.emailController.text.isEmpty) {
                  return "Please Enter EmailId...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                filled: true,
                hoverColor: Colors.transparent,
                fillColor: Colors.white,
                hintText: 'Your Email ID',
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
              height: 10,
            ),
            MyCustomInputBox(
              enabled: true,
              label: "What Should we Called you ",
              controller: reg.nickNameController,
              obsecureText: false,
              inputHint: "Enter Your nick name",
              textInputType: TextInputType.text,
              validator: (value) {
                if (reg.nickNameController.text.isEmpty) {
                  return "Please Enter Nick Name...";
                } else {
                  return null;
                }
              },
              textInputAction: TextInputAction.next,
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
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
              label: "Phone Number *",
              maxLength: reg.dropdownvalue["geoname"] == "UAE" ? 9 : 8,
              keyboardType: TextInputType.number,
              controller: reg.mobileNoController,
              obsecureText: false,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
              inputHint: "Your Required Number",
              inputFormatters: <TextInputFormatter>[
                // for below version 2 use this
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),

                FilteringTextInputFormatter.digitsOnly
              ],
              validator: (value) {
                if (reg.mobileNoController.text.isEmpty) {
                  return "";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                prefixIcon: TextButton(
                    onPressed: () {},
                    child: reg.dropdownvalue["geoname"] == "UAE"
                        ? Text(
                            "+971",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'sora',
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            "+63",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'sora',
                                fontWeight: FontWeight.bold),
                          )),
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
              label: "Gender",
              controller: reg.genderController,
              obsecureText: false,
              validator: (value) {},
              inputDecoration: InputDecoration(
                filled: true,
                hoverColor: Colors.transparent,
                fillColor: Colors.white,
                hintText: 'Your Gender',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                helperStyle: const TextStyle(fontFamily: 'Sora', fontSize: 14),
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Sora',
                  fontWeight: FontWeight.bold,
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
              label: "Address",
              controller: reg.addressController,
              obsecureText: false,
              validator: (value) {
                // if (addressController.text.isEmpty) {
                //   return "Please Enter Address...";
                // } else {
                //   return null;
                // }
              },
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your House No',
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
              label: "Building Name",
              controller: reg.buildingNameController,
              obsecureText: false,
              validator: (value) {
                // if (addressController.text.isEmpty) {
                //   return "Please Enter Address...";
                // } else {
                //   return null;
                // }
              },
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Your Building Name',
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
              height: 10,
            ),
            const SizedBox(height: 10),
            MyCustomInputBox(
              enabled: true,
              label: "Street Name",
              controller: reg.streetNameController,
              obsecureText: false,
              validator: (value) {},
              inputDecoration: InputDecoration(
                filled: true,
                hoverColor: Colors.transparent,
                fillColor: Colors.white,
                hintText: 'Your Street Name',
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
              height: 10,
            ),

            Container(
                margin: Responsive.isMobile(context)
                    ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7.5,
                      ),
                child: Text('Select Your country',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(height: 10),
            Container(
              margin: Responsive.isMobile(context)
                  ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                  : EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 7.5,
                    ),
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
                  value: reg.dropdownvalue,
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
                  items: reg.pickcountry.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["geoname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {
                    reg.dropdownvalue = newValue!;
                    reg
                        .cityselection(reg.dropdownvalue["geoid"].toString())
                        .then((value) {
                      setState(() {
                        reg.pickcity;
                      });
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
                margin: Responsive.isMobile(context)
                    ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                    : EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 7.5,
                      ),
                child: Text('Select Your City',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
            const SizedBox(height: 10),
            Container(
              margin: Responsive.isMobile(context)
                  ? EdgeInsets.fromLTRB(15, 0, 15, 0)
                  : EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 7.5,
                    ),
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width / 1
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
                  value: reg.dropdownvalueCity,
                  hint: Text('Select Your city',
                      style: TextStyle(
                          color: Styles.whitecustomlable, fontSize: 14)),
                  icon: InkWell(
                      child: Icon(
                    Icons.keyboard_arrow_down,
                  )),
                  items: reg.pickcity.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["cityname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {
                    setState(() {
                      reg.dropdownvalueCity = newValue!;
                    });
                  },
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 20),
            MyCustomInputBox(
              enabled: true,
              label: "Postal Code *",
              validator: (value) {
                if (reg.postalCodeController.text.isEmpty) {
                  return "Please Enter Postal Code...";
                } else {
                  return null;
                }
              },
              controller: reg.postalCodeController,
              obsecureText: false,
              inputDecoration: InputDecoration(
                hoverColor: Colors.transparent,
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
          if (reg.firstNameController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your First name");
          } else if (reg.dateOfBrithController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your Date of birth");
          } else if (reg.addressController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your address");
          } else if (reg.mobileNoController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your mobile no");
          } else if (reg.dropdownvalueCity != null) {
            Fluttertoast.showToast(msg: "Select City");
          } else if (reg.postalCodeController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your postalcode");
          } else {
            reg.profileInformatrion();
          }
        },
        text: "Next");
  }
}
