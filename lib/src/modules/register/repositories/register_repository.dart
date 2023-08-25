import 'package:dio/dio.dart';
import 'package:my_money/src/modules/register/model/register_data_model.dart';

import '../../../http/app-dio.dart';

class RegisterRepository {
  String baseUrl = "http://192.168.32.136:3099/user";

  Future<Response<Map<String, dynamic>>> sendRegisterData(
      RegisterDataModel registerData) async {
    final Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    print('Dados ${registerData.toJson()}');

    return clientHTTP.post('$baseUrl/create', data: registerData.toJson());
  }
}
