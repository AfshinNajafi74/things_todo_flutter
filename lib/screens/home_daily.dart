import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:things_todo/data/fake_data.dart';

class HomeDaily extends StatelessWidget {
  const HomeDaily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F8),
      body: Column(
          children: [
            /// display information of all today's tasks
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                height: Get.height / 6.02,
                width: Get.width / 1.09,
                decoration: const BoxDecoration(
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
                      const Text("صبح بخیر افشین"),
                      const SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                           Text("امروز",style: TextStyle(fontFamily: "vazir",color: Color(0xff7646FF)),),
                           Text("تکمیل شده",style: TextStyle(fontFamily: "vazir",color: Color(0xff4CD964))),
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
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
            Expanded(
              child: ListView.builder(
                  itemCount: myTask.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: const Color(0xff7646FF),
                      child: ListTile(
                        horizontalTitleGap: 40,
                        leading: SizedBox(
                          width: Get.width / 5.3,
                          height: double.maxFinite,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.pink,
                                ),
                              ),

                              IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.star_outline)
                              )
                            ],
                          ),
                        ),
                        title: Text(myTask[index].taskName!),
                        subtitle: Text(myTask[index].category!),
                        trailing: Column(
                          children:  [
                            SizedBox(height: 5),
                            Text("${myTask[index].time.toString()}:00"),
                            SizedBox(height: 5),
                            Text( myTask[index].time! < 12 ? "صبح" : "ظهر"),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            )
          ],

      ),
    );
  }
}
