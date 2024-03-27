import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_test/controller/application/get_data_impl.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GetDataController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: controller.obx(
                onLoading: Center(
                  child: CircularProgressIndicator(),
                ),
                onError: (error) {
                  return Center(
                    child: Text(error!),
                  );
                },
                (state) => DataTable(
                    horizontalMargin: 10,
                    dataRowMaxHeight: 120,
                    columnSpacing: 20,
                    headingTextStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    // Datatable widget that have the property columns and rows.
                    columns: const [
                      // Set the name of the column
                      DataColumn(
                        label: Text('Name'),
                      ),
                      DataColumn(
                        label: Text('UID'),
                      ),
                      DataColumn(
                        label: Text('Doc type'),
                      ),
                      DataColumn(
                        label: Text('image'),
                      ),
                    ],
                    rows: List.generate(
                      controller.jwelleryDatas.length,
                      (index) => DataRow(cells: [
                        DataCell(SizedBox(
                            width: size.width / 5,
                            child: Text(controller.jwelleryDatas[index].name))),
                        DataCell(SizedBox(
                            width: size.width / 10,
                            child: Text(controller.jwelleryDatas[index].uid
                                .toString()))),
                        DataCell(SizedBox(
                          width: size.width / 10,
                          child: Text(controller.jwelleryDatas[index].docType
                              .toString()),
                        )),
                        DataCell(SizedBox(
                            width: size.width / 10,
                            child: Image.network(controller
                                .jwelleryDatas[index].url
                                .toString()))),
                      ]),
                    )),
              ))),
    );
  }
}
