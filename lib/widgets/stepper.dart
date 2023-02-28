import 'package:cardit/api/regster_api.dart';
import 'package:cardit/const/responsive.dart';
import 'package:cardit/ui/bank_transection/loading_screen.dart';
import 'package:cardit/ui/register/4digit_passcode_screen.dart';
import 'package:cardit/ui/register/congratsfiles/passcodecongrats.dart';
import 'package:cardit/ui/register/profile_information_screen.dart';
import 'package:cardit/ui/register/register_screen.dart';
import 'package:cardit/ui/register/security_question.dart';
import 'package:cardit/ui/register/select_avatar_screen.dart';
import 'package:cardit/ui/register/verify_email_screen.dart';
import 'package:cardit/ui/register/verify_userid_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


 PageController? pageController;
class StepperWeb extends StatefulWidget {
  @override
  State<StepperWeb> createState() => _StepperWebState();
}

class _StepperWebState extends State<StepperWeb> {
  int _currentProgress = 0;

  // late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController!.addListener(() {
      setState(() {
        _currentProgress = _decideProgress(
            int.parse(pageController!.page?.floor().toString() ?? "0"));
      });
    });
  }

  int _decideProgress(int progress) {
    if(progress==1){
      return 1;
    }
    if (progress == 2 || progress == 3 || progress == 4||progress == 5 ) {
      return 2;
    }
 if (progress == 6 || progress == 7 ) {
      return 3;
    }
    if (progress > 7) {
      progress = progress - 2;
    }
     return progress;
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Row(
        children: [
          Container(
            width: Responsive.isDesktop(context)
                ? MediaQuery.of(context).size.width / 4
                : MediaQuery.of(context).size.width / 3,
            color: HexColor('#004751'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/login_logo.png",
                        width: 120, height: 60),
                  ],
                ),
                StepperProgress(
                       currentStep: _currentProgress,
                  steps: [
                    StepperStep(
                        title: "Onboarding",
                       ),
                    StepperStep(title: "Verify", 
                    
                      
                    ),
                    StepperStep(title: "Personal Details"),
                    StepperStep(title: "Getting Started"),
                  ],
                ),
              ],
            ),
          ),
           Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        children: const [
                          Center(
                            child: Register(),
                          ),
                          //
                          Center(
                            child: VerifyEmail(),
                          ),
                          Center(
                            child: Passcode(),
                          ),
                          Center(
                            child:passcodecongrats(),
                          ),
                          Center(
                            child:VerifyUserId(),
                          ),
                          Center(
                            child: AvatarPageView(),
                          ),
                          Center(
                            child:ProfileInformation(),
                          ),
                          Center(
                            child:SecurityQuestion(),
                            //
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       _pageController.nextPage(
                    //           duration: Duration(milliseconds: 200),
                    //           curve: Curves.linear);
                    //     },
                    //     child: const Text("Next page"),
                    //   ),
                    // )
                  ],
                ),
              ),
            )
         
        ],
      ),
    );
  }
}

class StepperStep {
  String? title;
  bool isCompleted = false;
  bool isActive = false;

  StepperStep(
      {required this.title, this.isCompleted = false, this.isActive = false});
}

class StepperProgress extends StatefulWidget {
List<StepperStep> steps = [];
  int currentStep = 0;
  StepperProgress({required this.steps, this.currentStep = 0});

  @override
  State<StepperProgress> createState() => _StepperProgressState();
}

class _StepperProgressState extends State<StepperProgress> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.steps.length,
      shrinkWrap: true,
      itemBuilder: (bc, i) {
        StepperStep? step = widget.steps[i];
        if (i < widget.currentStep) {
          step.isCompleted = true;
        }
        if (i == widget.currentStep) {
          step.isActive = true;
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: StepperItem(
            step: step,
            index: i,
          ),
        );
      },
    );
  }
}

class StepperItem extends StatelessWidget {
  const StepperItem({
    super.key,
    required this.step,
    required this.index,
  });

  final StepperStep? step;
  final int index;

  Color getColor() {
    if (step != null) {
      if (step!.isCompleted) {
        return Color(0XFFCEE812);
      }
      if (step!.isActive) {
        return Colors.white;
      }
    }

    return Colors.grey.withOpacity(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: step!.isCompleted
              ? BoxDecoration(
                  color: Color(0XFFCEE812),
                  borderRadius: BorderRadius.circular(50))
              : BoxDecoration(
                  border: Border.all(color: getColor()),
                  borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: step!.isCompleted
                ? Icon(Icons.check)
                : Text(
                    (index + 1).toString(),
                    style: TextStyle(
                        color: getColor(),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Text(
          step?.title ?? "",
          style: TextStyle(
              color: getColor(),
              fontSize: 18,
              fontFamily: "Sora",
              fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}