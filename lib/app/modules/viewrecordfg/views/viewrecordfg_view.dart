import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constant/constant.dart';
import '../controllers/viewrecordfg_controller.dart';

class ViewrecordfgView extends GetView<ViewrecordfgController> {
  const ViewrecordfgView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: colorPrimaryDark,
        title: const Text('Record Finish Good'),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.recordfg,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasData ) {
            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
                  var detail = documentSnapshot['detail'];
                  return Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.all(5),
                        child: ExpansionTile(
                          title: Text(documentSnapshot['nama_pic']),
                          subtitle: Text(documentSnapshot['tanggal']),
                          children: <Widget>[
                            Text(documentSnapshot['nama_pic']),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                border: TableBorder.all(),
                                columnSpacing: Get.width / 115,
                                dividerThickness: 2,
                                columns: controller.kolomHeader(daftarKolom),
                                rows: controller.rowEntri(detail)
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
