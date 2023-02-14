// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, avoid_print

import 'package:cardit/auth/auth.dart';
import 'package:cardit/responsive/responsive.dart';
import 'package:cardit/themes/theme_notifier.dart';
import 'package:cardit/widgets/auth_button.dart';
import 'package:cardit/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final buildingnamecontroller = TextEditingController();
  final streetnamecontroller = TextEditingController();
  final postalCodeController = TextEditingController();

 
  String? dropdownintrest;
  var selectedcountry = ['UAE', 'Philipines'];
  var philipinecity = ['Manila', 'Davao City', 'Cebu City', 'loliocity'];
  var uaecities = ['Dubai', 'Abudhabi', 'Sharjah', 'Fujariah'];
  var uaeData = ['UAE'];
  var interests = ["Racing", "Riding", "Gaming"];

  assignvalues(){
    if(con.profileinfo != {}){
      setState(() {
        firstNameController.text=con.profileinfo["firstname"] ?? "";
        lastNameController.text=con.profileinfo["lastname"] ?? "";
        dateOfBrithController.text=con.profileinfo["dob"] ?? "";
      });

    }else{

    }
  }

  @override
  void initState() {
    assignvalues();
    if(con.dropdownvalue!=null){
      con.cityselection(con.dropdownvalue["geoid"].toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      bottomNavigationBar: Responsive.isMobile(context)?bulildbutton():null,
      appBar: Responsive.isMobile(context)? AppBar(
          backgroundColor: Colors.transparent,
          leading: BackButton(
              color: themeChange.darkTheme ? Colors.white : Colors.black)):null,
      body: Responsive.isMobile(context)?Container(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
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
      ): Responsive.isDesktop(context)
              ? Row(children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 1,
                    color: Color(0XFF004751),
                    child: Center(
                        child: Image.asset("assets/applogo-02.png",
                                width: MediaQuery.of(context).size.width / 1.5, height: MediaQuery.of(context).size.height / 3
                              )),
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
                                width: MediaQuery.of(context).size.width / 1.5, height:  MediaQuery.of(context).size.height / 3
                              )),
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

          GetStorage().read('username') == null
              ? Text(
                  'Hey! Please Tell About Your Self!',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    color:
                        themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Text(
                  'Hey ${firstNameController.text}! ',
                  style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'Sora',
                    color:
                        themeChange.darkTheme ? Colors.white : HexColor('#004751'),
                    fontWeight: FontWeight.bold,
                  ),
                ),
          Text(
            'Tell About Your Self!',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Sora',
              color:
              themeChange.darkTheme ? Colors.white : HexColor('#004751'),
              fontWeight: FontWeight.bold,
            ),
          )
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
                        Text("First Name *",
                        style: TextStyle(
                          fontFamily: 'Sora',
                        ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
    
                            enabled: true,
                            //label: "First Name ",
                            controller: firstNameController,
                            obscureText: false,
                            //inputHint: "Your First Name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (firstNameController.text.isEmpty) {
                                return "Please Enter First Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'First Name *',
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
                        Text("Middle Name *"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            //label: "First Name ",
                            controller: middlenamecontroller,
                            obscureText: false,
                            //inputHint: "Your First Name",
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (firstNameController.text.isEmpty) {
                                return "Please Enter First Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              hoverColor: Colors.transparent,
                              fillColor: Colors.white,
                              hintText: 'Middle Name',
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
                        Text("Last Name *"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "Last Name ",
                            controller: lastNameController,
                            obscureText: false,
                            // inputHint: "Your Last Name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (lastNameController.text.isEmpty) {
                                return "Please Enter Last Name...";
                              } else {
                                return null;
                              }
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Last Name',
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
                        Text("Date Of Birth"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            keyboardType: TextInputType.none,
                            // label: "Date Of Brith",
                            controller: dateOfBrithController,
                            obscureText: false,
                            validator: (value) {
                              if (dateOfBrithController.text.isEmpty) {
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = (await showDatePicker(
                        builder: (context, child) {
    return Theme(
    data: Theme.of(context)
        .copyWith(
    colorScheme:
    ColorScheme.light(
    primary:HexColor('#CEE812'),
    ),

    textButtonTheme:
    TextButtonThemeData(
    style: TextButton
        .styleFrom(
    primary: HexColor('#CEE812'), // button text color
    ),
    ),
    ),
    child: child!,
    );
    },
                        context: context,
                        initialDate: DateTime(DateTime.now().year-18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year-18)));
                    if(date!= null) {
                      dateOfBrithController.text =
                    DateFormat("yyyy-MM-dd").format(date);
                  }
                  },
                  child: Icon(Icons.date_range, color: Colors.black),
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
                        Text("What should we call you?"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "What Should we Called you ",
                            controller: nicknamecontroller,
                            obscureText: false,
                            // inputHint: "Enter Your nick name",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (nicknamecontroller.text.isEmpty) {
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
                        Text("Enter your Email"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "Email id ",
                            controller: con.emailController,
                            obscureText: false,
                            // inputHint: "Enter Valid Email id",
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (con.emailController.text.isEmpty) {
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
                        Text("Phone Number *"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            inputFormatters: [
    FilteringTextInputFormatter.digitsOnly,
  ],
                            enabled: true,
                            //: "Phone Number",
                            maxLength: 10,
                            controller: requiredNoController,
                            obscureText: false,
                            keyboardType: TextInputType.number,

                            textInputAction: TextInputAction.next,
                            //inputHint: "Your Required Number",
                            validator: (value) {
                              if (requiredNoController.text.isEmpty) {
                                return "Please Enter Required Number...";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hoverColor: Colors.transparent,
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
                          'Select Your Interests',
                        ),
                        const SizedBox(height: 10),
                        Container(
                          // margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 13,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DropdownButton(
                              focusColor: Colors.transparent,
                              underline: const SizedBox(),
                              dropdownColor: Colors.white,
                              isExpanded: true,
                              value: dropdownintrest,
                              hint: Text('Select Your Interests',
                                  style: TextStyle(
                                      color: Styles.whitecustomlable,
                                      fontSize: 14)),
                              icon: GestureDetector(
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
                        Text("Address *"),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: TextFormField(
                            enabled: true,
                            // label: "Address",
                            controller: addressController,
                            obscureText: false,
                            validator: (value) {
                              if (addressController.text.isEmpty) {
                                return "Please Enter Address...";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hoverColor: Colors.transparent,
                              hintText: 'Your Address',
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
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 13,
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
                              value: con.dropdownvalue,
                              hint: Text('Select Your Country',
                                  style: TextStyle(
                                      color: Styles.whitecustomlable, fontSize: 14)),
                              icon: GestureDetector(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    // color: themeChange.darkTheme
                                    //     ? Colors.white
                                    //     : Colors.black45
                                  )),
                              items: con.pickcountry.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["geoname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {

                      con.dropdownvalue = newValue!;
                      con.cityselection(con.dropdownvalue["geoid"].toString()).then((value){
                          setState(() {
                          con.pickcity;
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
                        ),
                        const SizedBox(height: 10),
                        Container(
                           width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 13,
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
                              value: con.dropdownvalueCity,
                              hint: Text('Select Your city',
                                  style: TextStyle(
                                      color: Styles.whitecustomlable, fontSize: 14)),
                              icon: InkWell(
                                  child: Icon(
                                    Icons.keyboard_arrow_down,

                                  )),
                               items: con.pickcity.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["cityname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {
                    setState(() {
                      con.dropdownvalueCity = newValue!;
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
                              if (postalCodeController.text.isEmpty) {
                                return "Please Enter Postal Code...";
                              } else {
                                return null;
                              }
                            },
                            controller: postalCodeController,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (firstNameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your First name");
                        } else if (lastNameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your last name");
                        } else if (dateOfBrithController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter your Date of birth");
                        } else if (dateOfBrithController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter your Date of birth");
                        } else if (addressController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your address");
                        } else if (requiredNoController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your mobile no");
                        } else if (postalCodeController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your postalcode");
                        } else {
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
Widget buttontab(){
  return    Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (firstNameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your First name");
                        } else if (lastNameController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your last name");
                        } else if (dateOfBrithController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter your Date of birth");
                        } else if (dateOfBrithController.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter your Date of birth");
                        } else if (addressController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your address");
                        } else if (requiredNoController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your mobile no");
                        } else if (postalCodeController.text.isEmpty) {
                          Fluttertoast.showToast(msg: "Enter your postalcode");
                        } else {
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
                labelStyle: const TextStyle(
                fontFamily: 'Sora',fontWeight: FontWeight.bold
              ),
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
              enabled: false,
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
              enabled: false,
              label: "Last Name",
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
                // filled: true,
                // fillColor: Colors.white,
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
                // focusColor: Colors.grey.shade300,
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
                    DateTime? date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    date = (await showDatePicker(
                        builder: (context, child) {
    return Theme(
    data: Theme.of(context)
        .copyWith(
    colorScheme:
    ColorScheme.light(
    primary:HexColor('#004751'),
    ),

    textButtonTheme:
    TextButtonThemeData(
    style: TextButton
        .styleFrom(
    primary: HexColor('#004751'), // button text color
    ),
    ),
    ),
    child: child!,
    );
    },
                        context: context,
                        initialDate: DateTime(DateTime.now().year-18),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(DateTime.now().year-18)));
                    if(date!= null) {
                      dateOfBrithController.text =
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
              controller: con.emailController,
              obsecureText: false,
              inputHint: "Your Email ID",
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
              label: "Phone Number *",
              maxLength:con.dropdownvalue == con.pickcountry[0]? 9:8,
              keyboardType: TextInputType.number,
              controller: requiredNoController,
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
                if (requiredNoController.text.isEmpty) {
                  return "";
                } else {
                  return null;
                }
              },
              inputDecoration: InputDecoration(

               
                prefixIcon: TextButton(onPressed: (){}, child:
                con.dropdownvalue == con.pickcountry[0]?
                Text("+971",style: TextStyle(color: Colors.black,fontFamily: 'sora',fontWeight: FontWeight.bold),):
                Text("+63",style: TextStyle(color: Colors.black,fontFamily: 'sora',fontWeight: FontWeight.bold),)
                ),
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

              controller: issueDateController,
              obsecureText: false,
              validator: (value) {

              },
              inputDecoration: InputDecoration(
                filled: true,
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
              controller: addressController,
              obsecureText: false,
              validator: (value) {
                // if (addressController.text.isEmpty) {
                //   return "Please Enter Address...";
                // } else {
                //   return null;
                // }
              },
              inputDecoration: InputDecoration(
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
              controller: buildingnamecontroller,
              obsecureText: false,
              validator: (value) {
                // if (addressController.text.isEmpty) {
                //   return "Please Enter Address...";
                // } else {
                //   return null;
                // }
              },
              inputDecoration: InputDecoration(
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
              controller: streetnamecontroller,
              obsecureText: false,
              validator: (value) {
                // if (addressController.text.isEmpty) {
                //   return "Please Enter Address...";
                // } else {
                //   return null;
                // }
              },
              inputDecoration: InputDecoration(
                filled: true,
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
            const SizedBox(height: 20),
            MyCustomInputBox(
              enabled: true,
              label: "Postal Code *",
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
              SizedBox(
                height: 10,
              ),

            // Container(
            //    margin: Responsive.isMobile(context)
            //       ? EdgeInsets.fromLTRB(15, 0, 15, 0)
            //       : EdgeInsets.only(
            //           left: MediaQuery.of(context).size.width / 7.5,
            //           ),
            //
            //     child: Text('Select Your Interests',
            //         style: TextStyle(
            //             fontFamily: 'Sora',
            //             fontSize: 14,
            //             color: Styles.whitecustomlable))),
            // const SizedBox(height: 10),
            // Container(
            //   margin: Responsive.isMobile(context)
            //       ? EdgeInsets.fromLTRB(15, 0, 15, 0)
            //       : EdgeInsets.only(
            //           left: MediaQuery.of(context).size.width / 7.5,
            //           ),
            //   width: Responsive.isMobile(context)
            //       ? MediaQuery.of(context).size.width / 1
            //
            //           : MediaQuery.of(context).size.width / 2.5,
            //   height: MediaQuery.of(context).size.height / 15,
            //   decoration: BoxDecoration(
            //       border:
            //           Border.all(color: const Color(0XffB7C5C7), width: 1.5),
            //       borderRadius: const BorderRadius.all(Radius.circular(3))),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10),
            //     child: DropdownButton(
            //       underline: const SizedBox(),
            //       dropdownColor: Colors.white,
            //       isExpanded: true,
            //       value: dropdownintrest,
            //       hint: Text('Select Your Interests',
            //           style: TextStyle(
            //               color: Styles.whitecustomlable, fontSize: 14)),
            //       icon: InkWell(
            //           child: Icon(
            //         Icons.keyboard_arrow_down,
            //         // color: themeChange.darkTheme
            //         //     ? Colors.white
            //         //     : Colors.black45
            //       )),
            //       items: interests.map((String item) {
            //         return DropdownMenuItem(
            //             value: item,
            //             child: Text(item,
            //                 style: const TextStyle(
            //                     color: Color(0Xff413D4B), fontSize: 14)));
            //       }).toList(),
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           // dropdownvalueCity = null;
            //           dropdownintrest = newValue!;
            //           // con.choosedDocId = newValue;
            //           // con.isUAE.value = dropdownvalue == 'UAE' ? true : false;
            //         });
            //       },
            //       style: const TextStyle(color: Colors.black),
            //     ),
            //   ),
            // ),
            //
            // const SizedBox(height: 10),
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
                  value: con.dropdownvalue,
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
                  items: con.pickcountry.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["geoname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {

                      con.dropdownvalue = newValue!;
                      con.cityselection(con.dropdownvalue["geoid"].toString()).then((value){
                          setState(() {
                          con.pickcity;
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
                    style:  TextStyle(
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
                  value: con.dropdownvalueCity,
                  hint: Text('Select Your city',
                      style: TextStyle(
                          color: Styles.whitecustomlable, fontSize: 14)),
                  icon: InkWell(
                      child: Icon(
                        Icons.keyboard_arrow_down,

                      )),
                  items: con.pickcity.map((dynamic item) {
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item["cityname"],
                            style: const TextStyle(
                                color: Color(0Xff413D4B), fontSize: 14)));
                  }).toList(),
                  onChanged: (dynamic newValue) {
                    setState(() {
                      con.dropdownvalueCity = newValue!;
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
            Fluttertoast.showToast(msg: "Enter your First name");
          }
            else if (dateOfBrithController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your Date of birth");
          } else if (addressController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your address");
          } else if (requiredNoController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your mobile no");
          } else if (postalCodeController.text.isEmpty) {
            Fluttertoast.showToast(msg: "Enter your postalcode");
          } else {
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
