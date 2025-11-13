import 'package:get/get.dart';

class AssessmentCenterController extends GetxController {
  RxInt selectedToggleIndex = 0.obs;

  void onTogglePressed(int index) {
    selectedToggleIndex.value = index;
  }
}
