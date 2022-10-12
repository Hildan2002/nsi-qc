import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qc_nis/app/constant/constant.dart';
import 'package:qc_nis/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width* 0.38;
    var  height =  MediaQuery.of(context).size.width* 0.2;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorPrimaryDark,
        title: const Text('APP QC'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: ()=>Get.toNamed(Routes.RECORD_FINISH_GOOD),
                child: SizedBox(
                  width: width,
                  height: height,
                  child: const Card(
                    color: colorPrimary,
                    child: Center(
                      child: Text(
                        'Record Finish Good',
                        style: TextStyle(
                          color: colorPrimaryText,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ), //Text
                    ), //Center
                  ), //Card
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: const Card(
                    color: colorPrimary,
                    child: Center(
                      child: Text(
                        'Record OQC Finish Good',
                        style: TextStyle(
                          color: colorPrimaryText,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ), //Text
                    ), //Center
                  ), //Card
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: const Card(
                    color: colorPrimary,
                    child: Center(
                      child: Text(
                        'Record OQC Finish Good',
                        style: TextStyle(
                          color: colorPrimaryText,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ), //Text
                    ), //Center
                  ), //Card
                ),
              ),
              GestureDetector(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: const Card(
                    color: colorPrimary,
                    child: Center(
                      child: Text(
                        'Record OQC Finish Good',
                        style: TextStyle(
                          color: colorPrimaryText,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ), //Text
                    ), //Center
                  ), //Card
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
