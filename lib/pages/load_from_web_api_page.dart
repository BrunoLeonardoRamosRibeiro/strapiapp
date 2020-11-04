import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapiapp/controllers/load_from_web_api_controller.dart';

class LoadFromWebApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoadFromWebApiController>(
      init: LoadFromWebApiController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Carregar da API Web'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud_download),
          onPressed: () async {
            // TODO: fazer o código
            await controller.getAll();
          },
        ),
        body: Obx(()=> Center(child: controller.isLoading.value ? CircularProgressIndicator(): Text(controller.message.value),)),
      ),
    );
  }
}
