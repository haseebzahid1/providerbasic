
import 'package:flutter/cupertino.dart';
import 'package:providerbasis/modal/user.dart';


class FormProvider extends ChangeNotifier{

  /// form start
  // String userName = "";
  // String password = "";
  String confirmPassword = "";
/// form End
  /// Form provider Start

  var user = User();


  void onSaveUsername(String? value){
    user.userName = value ?? "";
  }

  void onSavedPassword  (String? value) {
    user.password = value ?? "";
    // print (password);
  }

  void onSaveConfirmPassword(String? value){
    confirmPassword = value ?? "";
  }

  void onChancedPassword  (String value) {
    user.password = value;
  }
  void onChangedConfirmPassword  (String value) {
    confirmPassword = value;
  }

  String? validateUsername(String? value){
    user.userName = value ?? "";
    if(value==null || value.isEmpty){
      return "please enter your user Name";
    }else if(value.length<3 ){
      return "Name length must be 3 or greater";
    }else if(value.length>16){
      return "Name length must be 16 character or less";
    }else{
      return null;
    }
  }

  String? validatePassword(String? value){
    user.password = value;
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }else if(value.length<8){
      return "Passwrod length must be 8 character or long";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String? value){
    confirmPassword = value ?? "";
    if(value==null  || value.isEmpty){
      return "Confirm password is required";
    }
    else if(value.length<8){
      return "password must 8 charactor or long";
    }
    else if(user.password != confirmPassword){
      return "password not match";
    }

    return null;
  }

  void onSubmit(){
    print({"${user.userName}, ${user.password}, $confirmPassword"});
  }
/// Form provider End
}
