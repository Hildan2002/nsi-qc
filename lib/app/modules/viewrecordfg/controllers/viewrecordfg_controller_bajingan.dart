// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:qc_nis/app/constant/constant.dart';
// //
// // class ViewrecordfgController extends GetxController {
// //   //TODO: Implement ViewrecordfgController
// //
// //   CollectionReference<Map<String, dynamic>> recordfg = FirebaseFirestore.instance.collection("Finish Good");
// //   RxBool isEditMode = false.obs;
// //
// //   // Map<String, bool> mapIsEditMode = {};
// //   List<String> listIdToggle = [];
// //   List<RxBool> listBoolToggle = [];
// //   List<Rx<TextEditingController>> listTextEditController = [];
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //   }
// //
// //   @override
// //   void onReady() {
// //     super.onReady();
// //   }
// //
// //   @override
// //   void onClose() {
// //     super.onClose();
// //   }
// //
// //   List<DataCell> kolomEntri(int columnHeaderCount, List rowColumn, DocumentSnapshot snapshot, int rowIndex) {
// //     List<DataCell> a = [];
// //     for (var i = 0; i < rowColumn.length; i++){
// //       listTextEditController.add(TextEditingController(text:snapshot['detail'][rowIndex][rowColumn[i]]).obs);
// //     }
// //     a.add(DataCell(Center(child: Row(
// //       children: [
// //         Switch(
// //             value: listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value,
// //             onChanged: (value) {
// //               listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value = value;
// //               if (!value){
// //                 Get.snackbar("${listTextEditController[3].value}", "${snapshot["detail"][rowIndex][rowColumn[3]]}");
// //                 listTextEditController.clear();
// //                 // for (var i = 0; i < rowColumn.length; i++){
// //                 //   listTextEditController[i].value.dispose();
// //                 // }
// //               }
// //               else {
// //                 for (var i = 0; i < rowColumn.length; i++){
// //                   listTextEditController[i] = TextEditingController().obs;
// //                 }
// //               }
// //             }),
// //         Text("${rowIndex+1}"),
// //       ],
// //     ))));
// //     for (var i = 1; i < columnHeaderCount; i++){
// //       a.add(
// //           DataCell(
// //               Center(
// //                 child: (
// //                     // isEditMode.value //&& mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"] != null)
// //                     listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value
// //                     // ? (mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"]!
// //                     ? TextFormField(
// //                       controller: listTextEditController[i].value,
// //                       // initialValue: snapshot['detail'][rowIndex][rowColumn[i]],
// //                       style: const TextStyle(fontSize: 14, color: colorPrimary))
// //                     : Text(snapshot['detail'][rowIndex][rowColumn[i]]))
// //                     // : Text(snapshot['detail'][rowIndex][rowColumn[i]]),
// //               )
// //           )
// //       );
// //     }
// //     return a;
// //   }
// //
// //   List<DataRow> rowEntri(DocumentSnapshot snapshot) {
// //     List<DataRow> a = [];
// //     for (var i = 0; i < snapshot['detail'].length; i++){
// //       // mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $i"] = false;
// //       listIdToggle.add("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $i");
// //       listBoolToggle.add(false.obs);
// //
// //       a.add(DataRow(cells: kolomEntri(daftarKolom.length, daftarKolomRow, snapshot, i)));
// //     }
// //     return a;
// //   }
// //
// //   List<DataColumn> kolomHeader(List<String> x) {
// //     List<DataColumn> a = [];
// //     for (var i = 0; i < x.length; i++){
// //       a.add(
// //         DataColumn(
// //           label: Expanded(
// //             child: Text(
// //               daftarKolom[i],
// //               textAlign: TextAlign.center,
// //               style: const TextStyle(fontStyle: FontStyle.italic,)
// //             ),
// //           ),
// //         ),
// //       );
// //     }
// //     return a;
// //   }
// //
// //   void editData(int rowIndex) {
// //
// //   }
// // }
// //
// //
// //
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:qc_nis/app/constant/constant.dart';
// // // import 'package:qc_nis/app/routes/app_pages.dart';
// // //
// // // class ViewrecordfgController extends GetxController {
// // //   //TODO: Implement ViewrecordfgController
// // //
// // //   CollectionReference<Map<String, dynamic>> recordfg = FirebaseFirestore.instance.collection("Finish Good");
// // //   // RxBool isEditMode = false.obs;
// // //
// // //   // Map<String, bool> mapIsEditMode = {};
// // //   // List<String> listIdToggle = [];
// // //   // List<RxBool> listBoolToggle = [];
// // //   // List<Rx<TextEditingController>> listTextEditController = [];
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //   }
// // //
// // //   @override
// // //   void onReady() {
// // //     super.onReady();
// // //   }
// // //
// // //   @override
// // //   void onClose() {
// // //     super.onClose();
// // //   }
// // //
// // //   List<DataCell> kolomEntri(int columnHeaderCount, List rowColumn, DocumentSnapshot snapshot, int rowIndex) {
// // //     List<DataCell> a = [];
// // //     // for (var i = 0; i < rowColumn.length; i++){
// // //     //   // listTextEditController.add(TextEditingController(text:snapshot['detail'][rowIndex][rowColumn[i]]).obs);
// // //     // }
// // //     a.add(DataCell(Center(child: ElevatedButton(
// // //         onPressed: ()
// // //         {
// // //           Get.toNamed(Routes.RECORD_FINISH_GOOD, arguments: snapshot);
// // //           Get.snackbar("Pindah", "${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex");
// // //         },
// // //         child: Text("${rowIndex+1}")))));
// // //     for (var i = 1; i < columnHeaderCount; i++){
// // //       a.add(
// // //           DataCell(
// // //               Center(
// // //                   child: (Text(snapshot['detail'][rowIndex][rowColumn[i]]))
// // //               )
// // //           )
// // //       );
// // //     }
// // //     return a;
// // //   }
// // //
// // //   List<DataRow> rowEntri(DocumentSnapshot snapshot) {
// // //     List<DataRow> a = [];
// // //     for (var i = 0; i < snapshot['detail'].length; i++){
// // //       // listIdToggle.add("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $i");
// // //       // listBoolToggle.add(false.obs);
// // //
// // //       a.add(DataRow(cells: kolomEntri(daftarKolom.length, daftarKolomRow, snapshot, i)));
// // //     }
// // //     return a;
// // //   }
// // //
// // //   List<DataColumn> kolomHeader(List<String> x) {
// // //     List<DataColumn> a = [];
// // //     for (var i = 0; i < x.length; i++){
// // //       a.add(
// // //         DataColumn(
// // //           label: Expanded(
// // //             child: Text(
// // //                 daftarKolom[i],
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(fontStyle: FontStyle.italic,)
// // //             ),
// // //           ),
// // //         ),
// // //       );
// // //     }
// // //     return a;
// // //   }
// // //
// // //   void editData(int rowIndex) {
// // //
// // //   }
// // // }
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:qc_nis/app/constant/constant.dart';
//
// class ViewrecordfgController extends GetxController {
//   //TODO: Implement ViewrecordfgController
//
//   CollectionReference<Map<String, dynamic>> recordfg = FirebaseFirestore.instance.collection("Finish Good");
//   RxBool isEditMode = false.obs;
//
//   // Map<String, bool> mapIsEditMode = {};
//   List<String> listIdToggle = [];
//   List<RxBool> listBoolToggle = [];
//   // List<Rx<TextEditingController>> listTextEditController = [];
//   var apaya = TextEditingController().obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   List<DataCell> kolomEntri2(int columnHeaderCount, List rowColumn, DocumentSnapshot snapshot, int rowIndex) {
//     List<DataCell> a = [];
//     // for (var i = 0; i < rowColumn.length; i++){
//     //   listTextEditController.add(TextEditingController(text:snapshot['detail'][rowIndex][rowColumn[i]]).obs);
//     // }
//     a.add(DataCell(Center(child: Row(
//       children: [
//         Switch(
//             value: listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value,
//             onChanged: (value) {
//               listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value = value;
//               if (!value){
//                 Get.snackbar("{listTextEditController[3].value}", "${snapshot["detail"][rowIndex][rowColumn[3]]}");
//                 //   listTextEditController.clear();
//                 //   // for (var i = 0; i < rowColumn.length; i++){
//                 //   //   listTextEditController[i].value.dispose();
//                 //   // }
//                 // }
//                 // else {
//                 //   for (var i = 0; i < rowColumn.length; i++){
//                 //     listTextEditController[i] = TextEditingController().obs;
//                 //   }
//               }
//             }),
//         Text("${rowIndex+1}"),
//       ],
//     ))));
//     for (var i = 1; i < columnHeaderCount; i++){
//       a.add(
//           DataCell(
//               Center(
//                   child: (
//                       // isEditMode.value //&& mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"] != null)
//                       listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value
//                       // ? (mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"]!
//                           ? TextFormField(
//                         // controller: listTextEditController[i].value,
//                           initialValue: snapshot['detail'][rowIndex][rowColumn[i]],
//                           style: const TextStyle(fontSize: 14, color: colorPrimary))
//                           : Text(snapshot['detail'][rowIndex][rowColumn[i]]))
//                 // : Text(snapshot['detail'][rowIndex][rowColumn[i]]),
//               )
//           )
//       );
//     }
//     return a;
//   }
//
//   List<DataCell> kolomEntri(int columnHeaderCount, List rowColumn, DocumentSnapshot snapshot, int rowIndex) {
//     List<DataCell> a = [];
//     // for (var i = 0; i < rowColumn.length; i++){
//     //   listTextEditController.add(TextEditingController(text:snapshot['detail'][rowIndex][rowColumn[i]]).obs);
//     // }
//     a.add(DataCell(Center(child: Row(
//       children: [
//         Switch(
//             value: listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value,
//             onChanged: (value) {
//               listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value = value;
//               if (!value){
//                 Get.snackbar("${apaya.value.text}", "${snapshot["detail"][rowIndex][rowColumn[3]]}");
//                 //   listTextEditController.clear();
//                 //   // for (var i = 0; i < rowColumn.length; i++){
//                 //   //   listTextEditController[i].value.dispose();
//                 //   // }
//                 // }
//                 // else {
//                 //   for (var i = 0; i < rowColumn.length; i++){
//                 //     listTextEditController[i] = TextEditingController().obs;
//                 //   }
//               }
//             }),
//         Text("${rowIndex+1}"),
//       ],
//     ))));
//
//     a.add(
//         DataCell(
//             Center(
//                 child: (
//                     // isEditMode.value //&& mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"] != null)
//                     listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value
//                     // ? (mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"]!
//                         ? TextFormField(
//                         controller: apaya.value,
//                         // initialValue: snapshot['detail'][rowIndex][rowColumn[i]],
//                         style: const TextStyle(fontSize: 14, color: colorPrimary))
//                         : Text(snapshot['detail'][rowIndex][rowColumn[1]]))
//               // : Text(snapshot['detail'][rowIndex][rowColumn[i]]),
//             )
//         )
//     );
//
//     for (var i = 2; i < columnHeaderCount; i++){
//       a.add(
//           DataCell(
//               Center(
//                   child: (
//                       // isEditMode.value //&& mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"] != null)
//                       listBoolToggle[listIdToggle.indexOf("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex")].value
//                       // ? (mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $rowIndex"]!
//                           ? TextFormField(
//                         // controller: listTextEditController[i].value,
//                           initialValue: snapshot['detail'][rowIndex][rowColumn[i]],
//                           style: const TextStyle(fontSize: 14, color: colorPrimary))
//                           : Text(snapshot['detail'][rowIndex][rowColumn[i]]))
//                 // : Text(snapshot['detail'][rowIndex][rowColumn[i]]),
//               )
//           )
//       );
//     }
//     return a;
//   }
//
//   List<DataRow> rowEntri(DocumentSnapshot snapshot) {
//     List<DataRow> a = [];
//     for (var i = 0; i < snapshot['detail'].length; i++){
//       // mapIsEditMode["${snapshot["tanggal"]}@${snapshot["nama_pic"]} $i"] = false;
//       listIdToggle.add("${snapshot["tanggal"]}@${snapshot["nama_pic"]} $i");
//       listBoolToggle.add(false.obs);
//
//       a.add(DataRow(cells: kolomEntri(daftarKolom.length, daftarKolomRow, snapshot, i)));
//     }
//     return a;
//   }
//
//   List<DataColumn> kolomHeader(List<String> x) {
//     List<DataColumn> a = [];
//     for (var i = 0; i < x.length; i++){
//       a.add(
//         DataColumn(
//           label: Expanded(
//             child: Text(
//                 daftarKolom[i],
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontStyle: FontStyle.italic,)
//             ),
//           ),
//         ),
//       );
//     }
//     return a;
//   }
//
//   void editData(int rowIndex) {
//
//   }
// }