import 'package:career_guidance_project/aiAssistentPage.dart';
import 'package:career_guidance_project/androidDevPage.dart';
import 'package:career_guidance_project/cyberSecurityDevPage.dart';
import 'package:career_guidance_project/gameDevPage.dart';
import 'package:career_guidance_project/util.dart';
import 'package:career_guidance_project/webDevPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({ Key? key }) : super(key: key);

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  bool isVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          centerTitle: true,
          title: Text("S A A R T H I", style: myTextStyle30().copyWith(fontSize: 25)),
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: myGradient2(Alignment.topRight, Alignment.topLeft),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => AiAssistantPage(),));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple.shade100,
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height/6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Column(
                          children: [
                            Spacer(),
                        Center(child: Text("SAARTHI",style: myTextStyle30Blacky().copyWith(fontSize: 25,))),
                        Center(child: Text("the",style: myTextStyle30Blacky().copyWith(fontSize: 22,))),
                        Center(child: Text("AI Counselor",style: myTextStyle30Blacky().copyWith(fontSize: 20,))),
                        // SizedBox(width: 20,),
                        Spacer(),
                          ],
                        ),
                        Lottie.asset("assets/RoboLottie.json",repeat: true,),
                        
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(color: Colors.black,),
                Text("🔽 Job-Roles based Guidance 🔽",style: myTextStyle15Blacky(),),
                Divider(color: Colors.black,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => AndroidDevPage(),));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          color: Colors.purple.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(child: Text("Android Development",style: myTextStyle15Blacky(),)),
                              Lottie.asset("assets/lottie1.json"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => GameDevPage()));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          color: Colors.purple.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(child: Text("Game Development",style: myTextStyle15Blacky(),)),
                              // SizedBox(height: 35,),
                              Lottie.asset("assets/lottie3.json",height: 150,width: 150),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => WebDevPage(),));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          color: Colors.purple.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(child: Text("Web Development",style: myTextStyle15Blacky(),)),
                              Lottie.asset("assets/lottie4.json",width: 150,height: 150),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => CyberSecurityDevPage(),));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          color: Colors.purple.shade100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FittedBox(child: Text("Cyber Security",style: myTextStyle15Blacky(),)),
                              Lottie.asset("assets/lottie5.json",height: 150,width: 150),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}