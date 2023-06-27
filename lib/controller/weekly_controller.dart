import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class WeeklyController extends GetxController{
  RxInt isSelected = 0.obs;
  final Rx<Jalali> nextDay = Jalali.now().addDays(1).obs;
  final Rx<Jalali> today = Jalali.now().obs;

  selectedBackground(int index,){
    isSelected.update((val) {
      isSelected.value = index;
    });
  }
}