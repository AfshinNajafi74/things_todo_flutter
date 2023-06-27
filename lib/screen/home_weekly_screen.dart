import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/weekly_controller.dart';


class HomeWeeklyScreen extends StatelessWidget {
  HomeWeeklyScreen({super.key});
  final WeeklyController weeklyController = Get.find<WeeklyController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${weeklyController.today.value.formatter.mN} ${weeklyController.today.value.formatter.yyyy}"),
        ),
        Container(
          width: Get.width,
          height: Get.height * 0.12,
          color: const Color(0xff7646FF),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  7,
                  (index) {
                    return InkWell(
                      onTap: () async {
                        weeklyController.today.value = weeklyController.nextDay.value.addDays(index);
                        weeklyController.nextDay.value.addDays(index);
                        weeklyController.selectedBackground(index);
                      },
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: Get.width * 0.22,
                          height: Get.height * 0.12,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: weeklyController.isSelected.value == index
                                  ? Colors.white
                                  : Colors.transparent),
                          child: Column(
                            children: [
                              Text(
                                weeklyController.nextDay.value.addDays(index).formatter.wN,
                                style: TextStyle(
                                    color: weeklyController.isSelected.value ==
                                            index
                                        ? Colors.black
                                        : Colors.grey.shade400),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                weeklyController.nextDay.value.addDays(index).formatter.d,
                                style: TextStyle(
                                    color: weeklyController.isSelected.value ==
                                            index
                                        ? Colors.black
                                        : Colors.white),
                              )
                            ],
                          )),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}