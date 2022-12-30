import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../themes/Themes.dart';
import '../../widgets/auth_button.dart';

class BiometricsScreen extends StatefulWidget {
  const BiometricsScreen({super.key});

  @override
  State<BiometricsScreen> createState() => _BiometricsScreenState();
}

class _BiometricsScreenState extends State<BiometricsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildbutton(),
      // appBar: AppBar(
      //   elevation: 0,
      //   leading: InkWell(
      //     child: Icon(Icons.arrow_back,
      //     color: Colors.black,),
      //     onTap: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 10),
      //       child: Row(
      //         children: [
      //           Container(
                  
      //       width:60 ,
      //           height: 30,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(25),
      //             border: Border.all(
      //               color: HexColor('#004751') 
      //             )
                  
      //           ),
      //           child: Center(
      //             child: Text("Skip",
      //             style: TextStyle(
      //               color:  HexColor('#004751')
      //             ),),
      //           ),),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
      body:
      Container(
        
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, bottom: 30),
                    margin: EdgeInsets.only(top: 40),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/loginbg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          
                          children: [
                          InkWell(
                                child: Icon(Icons.arrow_back,
                                color: Colors.black,),
                                onTap: (){
                                  Navigator.pop(context);
                                },
                              ),
                             
                                Row(
                                  children: [
                                    Container(
                                      
                                width:60 ,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(
                                        color: HexColor('#004751') 
                                      )
                                      
                                    ),
                                    child: Center(
                                      child: Text("Skip",
                                      style: TextStyle(
                                        color:  HexColor('#004751')
                                      ),),
                                    ),),
                                  ],
                                )],),
                      ),
        
Row(
  children: [
    SizedBox(width: 20,),
        Text("Enable",
    
    style: TextStyle(
    
      color:  HexColor('#004751'),
    
      fontSize: 28,
    
      fontWeight: FontWeight.bold
    
    ),),
  ],
),
  
Row(
  children: [
     SizedBox(width: 20,),
        Text("Biometrics",
    
    style: TextStyle(
    
      color:  HexColor('#004751'),
    
      fontSize: 28,
    
      fontWeight: FontWeight.bold
    
    ),),
  ],
),
SizedBox(height: MediaQuery.of(context).size.height/5,),
Row(
  //crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    
        
        InkWell(child: Image.asset('assets/touch  id 1.png'),
        onTap: (){},),
        SizedBox(width: 20,),
          
          InkWell(child: Image.asset('assets/face id.png'),
          onTap: (){},),
  ],
),
 SizedBox(height: 20,),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   
    Text("Enable Touch ID and Face ID \n  to verify Login",
    textAlign: TextAlign.center,
     style: TextStyle(
    
      color:  HexColor('#004751'),
    
      fontSize: 18,
    
      fontWeight: FontWeight.w700
    
    ),)
  ],
)
      ]),
            )]))));
  }



   Widget buildbutton() {
    return AuthButton(
      onTap: () {
        Navigator.pop(context);
        // Navigator.of(context).pushNamed(
        //   '/onboardrecipient',
        // );
        // if (formKey.currentState!.validate()) {}
      },
      text: "Enable",  decoration: BoxDecoration(
        color: HexColor('#CEE812'),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }



}