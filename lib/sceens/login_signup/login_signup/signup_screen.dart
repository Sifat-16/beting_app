import 'dart:ui';

import 'package:beting_app/bottom_nevigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Helper/fbase.dart';
import '../../../widget/login_widget.dart';
import 'login_screen.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FireBase fireBase = FireBase();

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
          children:[
            SizedBox(
                height: h,
                width: w,
                child: Image.asset("assets/login.jpg",fit: BoxFit.cover,)),

            Center(
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.1),
                  )
                ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Container(
                      height: h*0.9,
                      width: w,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(
                            width: 1.5,
                            color: Colors.white.withOpacity(0.1),
                          )),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:  EdgeInsets.only(left: w*0.03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: h*0.18,),
                              const Text("স্বাগতম Jade Ai!",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(height: h*0.06,),
                              const Text("আপনার ফোন নম্বার",style: TextStyle(color: Color(0xffA5A3A3)),),
                              SizedBox(height: h*0.02,),
                              LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
                                  controller: email,
                                  decoration: const InputDecoration(
                                    //labelText: "Input Gmail",
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: InputBorder.none,

                                  ),
                                ),
                              ),

                              SizedBox(height: h*0.02,),

                              Row(
                                children: [
                                  SizedBox(width: w*0.01,),
                                  Container(
                                      width: w*0.3,
                                      height: h*0.05,
                                      color: Colors.teal,
                                      child: TextButton(onPressed: (){}, child:const Text("get number varified",style: TextStyle(color: Colors.white,fontSize: 10),))),
                                  SizedBox(width: w*0.01,),
                                  LoginWidget(
                                    h: h*0.05, w: w*0.1,
                                    child:TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [ LengthLimitingTextInputFormatter(1)],
                                    ), ),
                                  SizedBox(width: w*0.01,),
                                  LoginWidget(
                                    h: h*0.05, w: w*0.1,
                                    child:TextFormField(

                                      keyboardType: TextInputType.number,
                                      inputFormatters: [ LengthLimitingTextInputFormatter(1)],
                                    ), ),
                                  SizedBox(width: w*0.01,),
                                  LoginWidget(
                                    h: h*0.05, w: w*0.1,
                                    child:TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [ LengthLimitingTextInputFormatter(1)],
                                    ), ),
                                  SizedBox(width: w*0.01,),
                                  LoginWidget(
                                    h: h*0.05, w: w*0.1,
                                    child:TextFormField(
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [ LengthLimitingTextInputFormatter(1)],
                                    ), ),
                                  SizedBox(width: w*0.01,),
                                  CircleAvatar(
                                    backgroundColor: Colors.teal,
                                    radius: 20,
                                    child: IconButton(onPressed: (){},
                                      icon: Icon(Icons.arrow_circle_right,color: Colors.white,),
                                    ),
                                  )

                                ],
                              ),
                              SizedBox(height: h*0.02,),

                              const Text("পাসওয়ার্ড লিখুন",
                                style:  TextStyle(color: Color(0xffA5A3A3)),),
                              SizedBox(height: h*0.02,),
                              LoginWidget( h: h*0.06, w: w*0.9,
                                child: TextFormField(
                                  controller: password,
                                  decoration: InputDecoration(

                                      labelText: "পাসওয়ার্ড লিখুন",
                                      contentPadding: const EdgeInsets.all(20.0),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(onPressed: (){},
                                          icon: const Icon(Icons.remove_red_eye)
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(height: h*0.02,),
                              const Text("পাসওয়ার্ড ভুলে গেছেন?",style: TextStyle(color: Color(0xffA5A3A3)),),
                              SizedBox(height: h*0.02,),
                              SizedBox(
                                  width: w*0.9,
                                  child: ElevatedButton(
                                      onPressed: ()async{
                                        final x = await fireBase.signUpWithEmailAndPassword(email.text.trim(), password.text.trim());
                                        if(x.user!=null){
                                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>NavegationBar()));
                                        }
                                      }, child: const Text("একাউন্ট খুলুন "))),
                              SizedBox(height: h*0.02,),
                              Row(
                                children: [
                                  const Text("একাউন্ট আছে?",style: TextStyle(color: Color(0xffA5A3A3)),),
                                  const Spacer(),
                                  InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                                      },
                                      child: const Text("লগ ইন করুন ।",style: TextStyle(color: Colors.white),))
                                ],
                              ),
                              Padding(
                                padding:  EdgeInsets.only(left: w*0.38,top: h*0.05),
                                child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: Colors.white,
                                    child: Image.asset("assets/google.png")),
                              )
                            ],
                          ),
                        ),
                      ),

                    ),
                  ),
                ),
              ),
            ),
          ]
      ),

    );
  }
}
