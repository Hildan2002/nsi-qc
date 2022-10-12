// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

FinishModel usersModelFromJson(String str) =>
    FinishModel.fromJson(json.decode(str));

String usersModelToJson(FinishModel data) => json.encode(data.toJson());

class FinishModel {
  FinishModel({
    this.tanggal,
    this.nama_pic,
    this.shift,
    this.detail,
  });

  String? tanggal;
  String? nama_pic;
  String? shift;
  List<DetailFinish>? detail;

  factory FinishModel.fromJson(Map<String, dynamic> json) => FinishModel(
    tanggal: json["tanggal"],
    nama_pic: json["nama_pic"],
    shift: json["shift"],
  );

  Map<String, dynamic> toJson() => {
    "tanggal": tanggal,
    "nama_pic": nama_pic,
    "shift": shift,
    "detail": detail!.map((e) => e.toJson()).toList()
  };
}

class DetailFinish {
  DetailFinish({
    this.jamMulai,
    this.jamSelesai,
    this.partNo,
    this.lotNo,
    this.qtyCheck,
    this.qtyOk,
    this.qtyNg,
    this.ngnsScratch,
    this.ngnsSpiral,
    this.ngnsDented,
    this.ngnsDimens,
    this.ngnsPinG,
    this.ngnsCg,
    this.ngnsPiptil,
    this.ngnsChip,
    this.ngnsShortcut,
    this.ngnsBurry,
    this.ngnsMproses,
    this.ngnsMprosesKet,
    this.ngmPinhole,
    this.ngmBending,
    this.ngmRusty,
    this.ngmColour,
    this.keterangan,
  });

  String? jamMulai;
  String? jamSelesai;
  String? partNo;
  String? lotNo;
  String? qtyCheck;
  String? qtyOk;
  String? qtyNg;
  String? ngnsScratch;
  String? ngnsSpiral;
  String? ngnsDented;
  String? ngnsDimens;
  String? ngnsPinG;
  String? ngnsCg;
  String? ngnsPiptil;
  String? ngnsChip;
  String? ngnsShortcut;
  String? ngnsBurry;
  String? ngnsMproses;
  String? ngnsMprosesKet;
  String? ngmPinhole;
  String? ngmBending;
  String? ngmRusty;
  String? ngmColour;
  String? keterangan;

  factory DetailFinish.fromJson(Map<String, dynamic> json) => DetailFinish(
    jamMulai: json["jam_mulai"],
    jamSelesai: json["jam_selesai"],
    partNo: json["part_no"],
    lotNo: json["lot_no"],
    qtyCheck: json["qty_check"],
    qtyOk: json["qty_ok"],
    qtyNg: json["qty_ng"],
    ngnsScratch: json["ngns_scratch"],
    ngnsSpiral: json["ngns_spiral"],
    ngnsDented: json["ngns_dented"],
    ngnsDimens: json["ngns_dimens"],
    ngnsPinG: json["ngns_pin_g"],
    ngnsCg: json["ngns_cg"],
    ngnsPiptil: json["ngns_piptil"],
    ngnsChip: json["ngns_chip"],
    ngnsShortcut: json["ngns_shortcut"],
    ngnsBurry: json["ngns_burry"],
    ngnsMproses: json["ngns_mproses"],
    ngnsMprosesKet: json["ngns_mproses_ket"],
    ngmPinhole: json["ngm_pinhole"],
    ngmBending: json["ngm_bending"],
    ngmRusty: json["ngm_rusty"],
    ngmColour: json["ngm_colour"],
    keterangan: json["keterangan"],
  );

  Map<String, dynamic> toJson() => {
    "jam_mulai": jamMulai,
    "jam_selesai": jamSelesai,
    "part_no": partNo,
    "lot_no": lotNo,
    "qty_check": qtyCheck,
    "qty_ok": qtyOk,
    "qty_ng": qtyNg,
    "ngns_scratch": ngnsScratch,
    "ngns_spiral": ngnsSpiral,
    "ngns_dented": ngnsDented,
    "ngns_dimens": ngnsDimens,
    "ngns_pin_g": ngnsPinG,
    "ngns_cg": ngnsCg,
    "ngns_piptil": ngnsPiptil,
    "ngns_chip": ngnsChip,
    "ngns_shortcut": ngnsShortcut,
    "ngns_burry": ngnsBurry,
    "ngns_mproses": ngnsMproses,
    "ngns_mproses_ket": ngnsMprosesKet,
    "ngm_pinhole": ngmPinhole,
    "ngm_bending": ngmBending,
    "ngm_rusty": ngmRusty,
    "ngm_colour": ngmColour,
    "keterangan": keterangan,
  };
}