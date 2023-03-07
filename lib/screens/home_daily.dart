import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeDaily extends StatelessWidget {
  const HomeDaily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F8),
      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 15),
              child: Container(
                height: Get.height / 6.02,
                width: Get.width / 1.09,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Color(0xff7646FF),offset: Offset(2, 2),blurRadius: 10,spreadRadius: 5,)
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("صبح بخیر افشین"),
                      SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("امروز",style: TextStyle(fontFamily: "vazir",color: Color(0xff7646FF)),),
                          Text("تکمیل شده",style: TextStyle(fontFamily: "vazir",color: Color(0xff4CD964))),
                        ],
                      ),
                      SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("28 فرودین 1402"),
                          Padding(
                            padding:  EdgeInsets.only(left: 10),
                            child: Text("5 / 10",),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],

      ),
    );
  }
}
