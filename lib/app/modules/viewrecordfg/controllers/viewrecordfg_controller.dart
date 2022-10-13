import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qc_nis/app/constant/constant.dart';

class ViewrecordfgController extends GetxController {
  //TODO: Implement ViewrecordfgController

  Stream<QuerySnapshot> recordfg = FirebaseFirestore.instance.collection("Finish Good").snapshots();

  bool? _isEditMode = false;


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<DataCell> kolomEntri(int columnHeaderCount, List rowColumn, List detailModel, int rowIndex) {
    List<DataCell> a = [];
    a.add(DataCell(Center(child: Text("${rowIndex+1}"))));
    for (var i = 1; i < columnHeaderCount; i++){
      a.add(
          DataCell(
              Center(
                child: Text(detailModel[rowIndex][rowColumn[i]]),
              )
          )
      );
    }
    return a;
  }

  List<DataRow> rowEntri(List snapshotDetail) {
    List<DataRow> a = [];
    for (var i = 0; i < snapshotDetail.length; i++){
      a.add(DataRow(cells: kolomEntri(daftarKolom.length, daftarKolomRow, snapshotDetail, i)));
    }
    return a;
  }

  List<DataColumn> kolomHeader(List<String> x) {
    List<DataColumn> a = [];
    for (var i = 0; i < x.length; i++){
      a.add(
        DataColumn(
          label: Expanded(
            child: Text(
              daftarKolom[i],
              textAlign: TextAlign.center,
              style: const TextStyle(fontStyle: FontStyle.italic,)
            ),
          ),
        ),
      );
    }
    return a;
  }
}
