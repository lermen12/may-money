import 'package:flutter/cupertino.dart';
import 'package:my_money/src/modules/register/model/register_data_model.dart';
import 'package:my_money/src/modules/register/repositories/register_repository.dart';

class RegisterService{
  final RegisterRepository repository = RegisterRepository();

  Future<void> sendRegisterData(String name, String email, String password) async{
    try{
      RegisterDataModel registerData = RegisterDataModel(fullName: name, email: email, password: password);

      await repository.sendRegisterData(registerData);
    }catch(exception){
      debugPrint(exception.toString());
      rethrow;
    }
  }

}