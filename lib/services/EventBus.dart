import 'package:event_bus/event_bus.dart';


//Bus 初始化 

EventBus eventBus = EventBus();

//跳转到添加页面广播
class AddProductContentEvent{
  String str;
  AddProductContentEvent(String str){
    this.str=str;
  }
}

//用户中心广播
class UserEvent{
  String str;
  UserEvent(String str){
    this.str=str;
  }
}

//收货地址广播
class AddressEvent{
  String str;
  AddressEvent(String str){
    this.str=str;
  }
}

//结算页面
class CheckOutEvent{
  String str;
  CheckOutEvent(String str){
    this.str=str;
  }
}



