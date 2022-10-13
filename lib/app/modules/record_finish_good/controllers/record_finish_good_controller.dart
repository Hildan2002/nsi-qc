import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qc_nis/app/data/finish_good_model.dart';

class RecordFinishGoodController extends GetxController {
  //TODO: Implement RecordFinishGoodController
  final formKey = GlobalKey<FormState>();
  final pic = TextEditingController();

  var selectedTime = TimeOfDay.now().obs;

  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();

 late TextEditingController jam_mulaiC;
 late TextEditingController jam_selesaiC;
 late TextEditingController part_noC;
 late TextEditingController lot_noC;
 late TextEditingController qty_checkC;
 late TextEditingController qty_okC;
 late TextEditingController qty_ngC;
 late TextEditingController ngns_scratchC;
 late TextEditingController ngns_spiralC;
 late TextEditingController ngns_dentedC;
 late TextEditingController ngns_dimensC;
 late TextEditingController ngns_pin_gC;
 late TextEditingController ngns_cgC;
 late TextEditingController ngns_piptilC;
 late TextEditingController ngns_chipC;
 late TextEditingController ngns_shortcutC;
 late TextEditingController ngns_burryC;
 late TextEditingController ngns_mprosesC;
 late TextEditingController ngns_mproses_ketC;
 late TextEditingController ngm_pinholeC;
 late TextEditingController ngm_bendingC;
 late TextEditingController ngm_rustyC;
 late TextEditingController ngm_colourC;
 late TextEditingController keteranganC;
 late TextEditingController namaPICC;
 String? shift;
 Map<String, TextEditingController> mapTextEditingController = {};

var idtanggal = DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(hours: 7)));
// var idtanggal = DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(hours: 7)));

  CollectionReference koleksi = FirebaseFirestore.instance.collection("Finish Good");

 Future<void> addFinishGood() async {
   String namaDoc = '$idtanggal@${namaPICC.text}';
   DocumentReference finishgoods = koleksi.doc(namaDoc);
   bool docExists = await checkIfDocExists(koleksi, namaDoc);

   List<DetailFinish> listDetail = [];
   DetailFinish detailFinish = DetailFinish(
       jamMulai: jam_mulaiC.text,
       jamSelesai: jam_selesaiC.text,
       partNo: part_noC.text,
       lotNo: lot_noC.text,
       qtyCheck: qty_checkC.text,
       qtyOk: qty_okC.text,
       qtyNg: qty_ngC.text,
       ngnsScratch: ngns_scratchC.text,
       ngnsSpiral: ngns_spiralC.text,
       ngnsDented: ngns_dentedC.text,
       ngnsDimens: ngns_dimensC.text,
       ngnsPinG: ngns_pin_gC.text,
       ngnsCg: ngns_cgC.text,
       ngnsPiptil: ngns_piptilC.text,
       ngnsChip: ngns_chipC.text,
       ngnsShortcut: ngns_shortcutC.text,
       ngnsBurry: ngns_burryC.text,
       ngnsMproses: ngns_mprosesC.text,
       // ngnsMprosesKet: ngns_mproses_ketC.text,
       ngmPinhole: ngm_pinholeC.text,
       ngmBending: ngm_bendingC.text,
       ngmRusty: ngm_rustyC.text,
       ngmColour: ngm_colourC.text,
       keterangan: keteranganC.text,
   );
   listDetail.add(detailFinish);

   FinishModel finishModel = FinishModel(
     tanggal: idtanggal,
     nama_pic: namaPICC.text,
     shift: shift,
     detail: listDetail
   );

   try {
     if (!docExists) {
        await finishgoods.set(finishModel.toJson());
      } else {
       await finishgoods.update({"detail": FieldValue.arrayUnion(listDetail.map((e) => e.toJson()).toList())});
     }

     Get.defaultDialog(
       title: "Berhasil",
       middleText: "Anda Berhasil Menambahkan Laporan Finish Good",
       onConfirm: () => Get.back(),
       textConfirm: "Okay",
     );
   } catch (e){
     Get.defaultDialog(
       title: "Terjadi Kesalahan",
       middleText: "Anda Gagal Menambahkan Laporan Finish Good\n dikarenakan ${e.toString()}",
       onConfirm: () => Get.back(),
       textConfirm: "Okay",
     );
   }
   kosongkan();
 }

  Future<bool> checkIfDocExists(CollectionReference collectionReference, String docId) async {
    try {
      var doc = await collectionReference.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }

  Future<String> chooseTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: Get.context!,
        initialTime: selectedTime.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        initialEntryMode: TimePickerEntryMode.dial,
        helpText: 'Select Departure Time',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorInvalidText: 'Provide valid time',
        hourLabelText: 'Select Hour',
        minuteLabelText: 'Select Minute');
    if(pickedTime == null){
      return "";
    }
    selectedTime.value = pickedTime;
    return "${pickedTime.hour.toString().padLeft(2, '0')}.${pickedTime.minute.toString().padLeft(2, '0')}";
  }

  @override
  void onInit() {
    jam_mulaiC = TextEditingController();
    jam_selesaiC = TextEditingController();
    part_noC = TextEditingController();
    lot_noC = TextEditingController();
    qty_checkC = TextEditingController();
    qty_okC = TextEditingController();
    qty_ngC = TextEditingController();
    ngns_scratchC = TextEditingController();
    ngns_spiralC = TextEditingController();
    ngns_dentedC = TextEditingController();
    ngns_dimensC = TextEditingController();
    ngns_pin_gC = TextEditingController();
    ngns_cgC = TextEditingController();
    ngns_piptilC = TextEditingController();
    ngns_chipC = TextEditingController();
    ngns_shortcutC = TextEditingController();
    ngns_burryC = TextEditingController();
    ngns_mprosesC = TextEditingController();
    ngns_mproses_ketC = TextEditingController();
    ngm_pinholeC = TextEditingController();
    ngm_bendingC = TextEditingController();
    ngm_rustyC = TextEditingController();
    ngm_colourC = TextEditingController();
    keteranganC = TextEditingController();
    namaPICC = TextEditingController();

    mapTextEditingController["Scratch"] = ngns_scratchC;
    mapTextEditingController["Dented"] = ngns_dentedC;
    mapTextEditingController["Dimens"] = ngns_dimensC;
    mapTextEditingController["Pin G"] = ngns_pin_gC;
    mapTextEditingController["CG"] = ngns_cgC;
    mapTextEditingController["Piptil"] = ngns_piptilC;
    mapTextEditingController["Chip"] = ngns_chipC;
    mapTextEditingController["Spiral"] = ngns_spiralC;
    mapTextEditingController["Shortcut"] = ngns_shortcutC;
    mapTextEditingController["Burry"] = ngns_burryC;
    mapTextEditingController["M Proses"] = ngns_mprosesC;
    mapTextEditingController["Pin Hole"] = ngm_pinholeC;
    mapTextEditingController["Bending"] = ngm_bendingC;
    mapTextEditingController["Rusty"] = ngm_rustyC;
    mapTextEditingController["Color"] = ngm_colourC;
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    jam_mulaiC.dispose();
    jam_selesaiC.dispose();
    part_noC.dispose();
    lot_noC.dispose();
    qty_checkC.dispose();
    qty_okC.dispose();
    qty_ngC.dispose();
    ngns_scratchC.dispose();
    ngns_spiralC.dispose();
    ngns_dentedC.dispose();
    ngns_dimensC.dispose();
    ngns_pin_gC.dispose();
    ngns_cgC.dispose();
    ngns_piptilC.dispose();
    ngns_chipC.dispose();
    ngns_shortcutC.dispose();
    ngns_burryC.dispose();
    ngns_mprosesC.dispose();
    ngns_mproses_ketC.dispose();
    ngm_pinholeC.dispose();
    ngm_bendingC.dispose();
    ngm_rustyC.dispose();
    ngm_colourC.dispose();
    keteranganC.dispose();
    namaPICC.dispose();
    super.onClose();
  }

  void kosongkan() {
    jam_mulaiC.text =  "";
    jam_selesaiC.text =  "";
    part_noC.text =  "";
    lot_noC.text =  "";
    qty_checkC.text =  "";
    qty_okC.text =  "";
    qty_ngC.text =  "";
    ngns_scratchC.text =  "";
    ngns_spiralC.text =  "";
    ngns_dentedC.text =  "";
    ngns_dimensC.text =  "";
    ngns_pin_gC.text =  "";
    ngns_cgC.text =  "";
    ngns_piptilC.text =  "";
    ngns_chipC.text =  "";
    ngns_shortcutC.text =  "";
    ngns_burryC.text =  "";
    ngns_mprosesC.text =  "";
    ngns_mproses_ketC.text =  "";
    ngm_pinholeC.text =  "";
    ngm_bendingC.text =  "";
    ngm_rustyC.text =  "";
    ngm_colourC.text =  "";
    keteranganC.text =  "";
    namaPICC.text =  "";
  }

  void cekInputDanSubmit() {
    idtanggal = DateFormat("yyyy-MM-dd").format(DateTime.now().subtract(const Duration(hours: 7)));
    try {
      var totalNG = 0;
      mapTextEditingController.forEach((key, value) {
        if (value.text.isNotEmpty) {
          if (value.text.contains(",")) {
            totalNG = totalNG + int.parse(value.text.split(",")[0]);
          }
          else {
            if (value.text.contains(" ")){
              Get.snackbar("Error", "Periksa lagi inputannya");
              return;
            }
            else {
              totalNG = totalNG + int.parse(value.text);
            }
          }
        }
      });
      if (totalNG == int.parse(qty_ngC.text)){
        addFinishGood();
      } else {
        Get.snackbar("Salah Itung woi", "Gak teliti SP");
      }
    } on Exception catch (e) {
      print("Error nih: $e");
      Get.snackbar("Error", "Heran");
    }
  }
}
