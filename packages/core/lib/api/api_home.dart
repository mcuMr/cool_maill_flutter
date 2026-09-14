import 'package:core/model/home/model_home.dart';
import 'package:core/network/base_model.dart';
import 'package:core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_home.g.dart';

@RestApi()
abstract class ApiHome {
  static final ApiHome instance = _ApiHome(DioClient.instance.getDio());

  factory ApiHome() => instance;

  @GET('page/home')
  Future<BaseModel<ModelHome>> getUser();


}