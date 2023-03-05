import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin  {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff7646FF),
        actions: [
          SizedBox(width: 10,),
          Icon(Icons.add,size: 30,),
          SizedBox(width: 5,),
          Icon(Icons.notifications_active_outlined,size: 30),
          Spacer(),
          SizedBox(
            width: Get.width / 3.6,
            child: Image.asset("assets/icons/app_logo.png",),
          ),
          Image.asset("assets/icons/menubar.png",scale: 3,),
        ],
      ),
      body: Column(
        children: [
          /// search box
          Container(
            color: Color(0xff7646FF),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                style: TextStyle(fontFamily: "vazir"),
                decoration: InputDecoration(

                  isDense: true,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none
                  ),
                  suffixIcon: Icon(Icons.search_rounded,size: 30,color: Color(0xff7646FF),),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "جستجو تـسـک",
                  hintStyle: TextStyle(color: Colors.grey,fontFamily: "vazir",)
                ),
              ),
            ),
          ),
          /// tab bar
        ],
      ),
    );
  }
}
