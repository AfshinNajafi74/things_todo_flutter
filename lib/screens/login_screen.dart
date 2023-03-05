import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120,),
              /// logo
              Image.asset("assets/icons/Logo.png",width: Get.width / 3.6,),
              SizedBox(height: 120,),
              /// text fields
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(fontFamily: "vazir"),
                            decoration: InputDecoration(
                                hintText: "نام کاربری",
                                hintStyle: TextStyle(fontFamily: "vazir"),
                                prefixIcon: Icon(Icons.person_outline,),
                                border: InputBorder.none,
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            indent: 2,
                            endIndent: 2,
                          ),
                          TextField(
                            style: TextStyle(fontFamily: "vazir"),
                            decoration: InputDecoration(
                                hintText: "رمز عبور",
                                hintStyle: TextStyle(fontFamily: "vazir"),
                                prefixIcon: Icon(Icons.lock_outlined),
                                border: InputBorder.none
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    /// login btn
                    ElevatedButton(
                      onPressed: (){
                        Get.to(HomeScreen());
                      },
                      child: Text("ورود",style: TextStyle(fontFamily: "vazir",fontSize: 24),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6035D0),
                          fixedSize: Size(292, 55)
                      ),
                    ),
                    SizedBox(height: 40,),
                    /// other login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 2,
                          width: 125,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text("یــا",style: TextStyle(fontSize: 20,fontFamily: "vazir"),),
                        ),
                        Container(
                          height: 2,
                          width: 125,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("با استفاده از رسانه های اجتماعی وارد شوید",style: TextStyle(fontFamily: "vazir"),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffDD4B39)
                    ),
                    child: Image.asset("assets/icons/google-plus-logo.png",scale: 2,)
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff1DA1F2)
                    ),
                    child: Image.asset("assets/icons/twitter.png",scale: 2,)),
                  Icon(Icons.facebook_outlined,color: Color(0xff3B5998),size: 65,),
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }
}
