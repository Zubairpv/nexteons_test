import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:nexteons_test/controller/services/get_data_services.dart';
import 'package:nexteons_test/model/get_model.dart';

class GetDataController extends GetxController with StateMixin {
  @override
  void onInit() async {
    getData();
    super.onInit();
  }

  RxList<GetDataModel> jwelleryDatas = <GetDataModel>[].obs;
  getData() async {
    final service = GetDataService();

    try {
      Response response = await service.getJwelleryData();
      print(response.data);
      if (response.statusCode == 201 || response.statusCode == 200) {
        List dataList = response.data["data"]["list"];

        jwelleryDatas.value =
            dataList.map((json) => GetDataModel.fromJson(json)).toList();

        change(null, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      print(e);
    }
  }
}
