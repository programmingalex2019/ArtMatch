import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MainController extends GetxController{

  var index = 0.obs;

  void changeIndex(int itemCount){

    index.value += 1;
    if(index.value == itemCount){
      index.value =  0;
    }
    print(index);
    
  }

  void swipeIndex(int newindex){
    index.value = newindex;
  }


}
