import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordFinishGoodController extends GetxController {
  //TODO: Implement RecordFinishGoodController

  var f1 = FocusNode();
  var f2 = FocusNode();
  var f3 = FocusNode();

  String? selectedSalutation;
  var picC = TextEditingController();
  String? shift;
  var partnumberC = TextEditingController();
  var lotnumberC = TextEditingController();
  var jammulai = TextEditingController();
  String? jamselesai;
  String? qtycheck;
  String? qtyok;
  String? qtyng;
  String? scratch;
  String? dented;
  String? dimens;
  String? ping;
  String? cgspiral;
  String? peptil;

  final count = 0.obs;
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

  void increment() => count.value++;

  final formKey = GlobalKey<FormState>();
  final pic = TextEditingController();
  final jam_mulai = TextEditingController();
  final jam_berakhir = TextEditingController();
  final part_number = TextEditingController();
  final lot_number = TextEditingController();

  var output_pn = ''.obs;
  var output_ln = ''.obs;
  var output = ''.obs;

  var nama  = [
    "Ambar Afriyani",
    "Ana Febrina",
    "Arif Rahman",
    "Audia Awali",
    "Ayu Ratna Ningsih",
    "Azuardi",
    "Basyarani Ursha",
    "Binah",
    "Bovi Ferdiansa",
    "Diyan Supriyadi",
    "Endang Trimurtini",
    "Erna Diana Astuti",
    "Ery Safitri",
    "Etik Lestari",
    "Fauziarti",
    "Fika Dian Pratami",
    "Fitri Rahmawati",
    "Ikhda Fitrotunnisa",
    "Irma Ayu Santika",
    "Jesi Nur Rochmawati",
    "Junita",
    "Justiawan Indra Atmaja",
    "Kokok Susilo",
    "Lia Yunita",
    "Lilis Handayani",
    "Mad Saefurohman",
    "Malahayati",
    "Mayasari",
    "Muki",
    "Muslimatun",
    "Nanditha Shendi Thriziska",
    "Novan Wicaksono",
    "Novi Dwi Santoso",
    "Novi Sari Handayani",
    "Novi Utami",
    "Novia Tri Handayani",
    "Nurhidayatul Laili",
    "Nuril Amelia",
    "Nurul Alfiyani",
    "Nurul Komariyah",
    "Nuswantari",
    "Oktivianne Nurertha K",
    "Puji Rahayu",
    "Rani Riswanti",
    "Rifani Madjid",
    "Rikha Susanti",
    "Rinna Untari",
    "Riyana",
    "Rizka Novining Dias",
    "Romasti Naomi Hutauruk",
    "Rosimah",
    "Rosinih",
    "Rully Hendriyanto",
    "Siti Aliyah",
    "Siti Aulia Yulistia",
    "Siti Jamangatun",
    "Siti Kartini",
    "Siti Rifa'atul H",
    "Soleh Ibnu",
    "Sri Sulastri",
    "Susi Listiani",
    "Suyatno Surtana",
    "Tri Kuati",
    "Tutut Rizki Pramudita",
    "Uki Indra Perwitasari",
    "Wahyu Deriana",
    "Wahyu Setiadi",
    "Weni Rezeki",
    "Wiji Lestari",
    "Yana Suryana",
    "Yohanes Alferdo Oktama",
    "Yustina Widhianti"
  ];

  var partnumber = [
    '1466273-00-A01',
    '1477428-00-A01',
    '1477429-00-A01',
    '168856-00-A01',
    '1705171-01-A01'];

  var lotnumber = [
    '22810N077200',
    '22810N078200',
    '22810N080200',
  ];

  var selectedTime = TimeOfDay.now().obs;

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
}
