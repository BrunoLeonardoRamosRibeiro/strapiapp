import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:strapiapp/controllers/home_page_controller.dart';
import 'package:strapiapp/pages/load_from_web_api_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Menu Principal'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('BUSCAR DIRETO DO SITE'),
                onPressed: () {
                  Get.to(LoadFromWebApiPage());
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                child: Text('CARREGAR DO SHARED LOCAL'),
                onPressed: () {
                  // TODO: ABRIR NOVA PAGE
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
