import 'package:dio/dio.dart';
import 'package:nexteons_test/config/api_key.dart';
import 'package:nexteons_test/model/request_model.dart';

class GetDataService extends ApiToken {
  getJwelleryData() async {
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add a custom header to the request
          options.headers['Authorization'] = token;
          return handler.next(options);
        },
      ),
    );
    final response = await dio.post(
        'https://ajcjewel.com:4000/api/global-gallery/list',
        data: RequestModel.body());
   
    return response;
  }
}
