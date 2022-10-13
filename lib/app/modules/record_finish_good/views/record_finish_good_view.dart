import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qc_nis/app/constant/constant.dart';

import '../../../constant/wijet.dart';
import '../controllers/record_finish_good_controller.dart';

class RecordFinishGoodView extends GetView<RecordFinishGoodController> {
  const RecordFinishGoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: colorPrimaryDark,
        title: Text('Menu Record Finish Good', style: GoogleFonts.roboto(color: colorPrimaryText)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                RawAutocomplete(
                    focusNode: controller.f1,
                    textEditingController: controller.namaPICC,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listNama.where((String option) {
                        return option.toLowerCase().contains(
                            textEditingValue.text.toLowerCase());
                      });
                    },

                    fieldViewBuilder: (BuildContext context,
                        TextEditingController texteditingcontroller,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        // autofocus: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Form ini wajib diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "PIC",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black), //<-- SEE HERE
                          ),
                        ),
                        controller: texteditingcontroller,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String selection) {
                          onFieldSubmitted();
                        },
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        void Function(String) onSelected,
                        Iterable<String> options) {
                      return Material(
                          child: SizedBox(
                              height: 200,
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: options.map((opt) {
                                      return GestureDetector(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets
                                                  .only(right: 60),
                                              child: Card(
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                        .all(10),
                                                    child: Text(opt),
                                                  )
                                              )
                                          )
                                      );
                                    }).toList(),
                                  )
                              )
                          )
                      );
                    }),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black), //<-- SEE HERE
                      ),
                    ),
                    value: controller.shift,
                    hint: const Text(
                      'Pilih Shift',
                    ),
                    onChanged: (value) =>
                    controller.shift = value!,
                    validator: (value) =>
                    value == null
                        ? 'field required'
                        : null,
                    items:
                    ['Shift 1', 'Shift 2'].map<DropdownMenuItem<String>>((
                        String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 10),
                Text("Jam",
                  style: GoogleFonts.openSans(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () async {
                            controller.jam_mulaiC.text =
                            await controller.chooseTime();
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            margin: const EdgeInsets.only(top: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                  width: 3, color: Colors.black),),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: controller.jam_mulaiC,
                              decoration: const InputDecoration(
                                  hintText: ('Jam Mulai'),
                                  disabledBorder:
                                  UnderlineInputBorder(borderSide: BorderSide
                                      .none),
                                  contentPadding: EdgeInsets.only(top: 0.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: InkWell(
                          onTap: () async {
                            controller.jam_selesaiC.text =
                            await controller.chooseTime();
                          },
                          child: Container(
                            width: 250,
                            height: 50,
                            margin: const EdgeInsets.only(top: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                              border: Border.all(
                                  width: 3, color: Colors.black),),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                              enabled: false,
                              keyboardType: TextInputType.text,
                              controller: controller.jam_selesaiC,
                              decoration: const InputDecoration(
                                  hintText: ('Jam Berakhir'),
                                  disabledBorder:
                                  UnderlineInputBorder(borderSide: BorderSide
                                      .none),
                                  contentPadding: EdgeInsets.only(top: 0.0)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                RawAutocomplete(
                    focusNode: controller.f2,
                    textEditingController: controller.part_noC,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listPartnumber.where((String option) {
                        return option.toLowerCase().startsWith(
                            textEditingValue.text.toLowerCase());
                      });
                    },

                    fieldViewBuilder: (BuildContext context,
                        TextEditingController texteditingcontroller,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Form ini wajib diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Part Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black), //<-- SEE HERE
                          ),
                        ),
                        controller: texteditingcontroller,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String selection) {
                          onFieldSubmitted();
                          if (texteditingcontroller.text.contains(";")){
                            List<String> a = texteditingcontroller.text.split(";");
                            controller.part_noC.text = a[3];
                            controller.lot_noC.text = a.last;
                          }
                        },
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        void Function(String) onSelected,
                        Iterable<String> options) {
                      return Material(
                          child: SizedBox(
                              height: 200,
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: options.map((opt) {
                                      return GestureDetector(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets
                                                  .only(right: 60),
                                              child: Card(
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                        .all(10),
                                                    child: Text(opt),
                                                  )
                                              )
                                          )
                                      );
                                    }).toList(),
                                  )
                              )
                          )
                      );
                    }),

                const SizedBox(height: 10),

                RawAutocomplete(
                    focusNode: controller.f3,
                    textEditingController: controller.lot_noC,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return listLotnumber.where((String option) {
                        return option.toLowerCase().startsWith(
                            textEditingValue.text.toLowerCase());
                      });
                    },

                    fieldViewBuilder: (BuildContext context,
                        TextEditingController texteditingcontroller,
                        FocusNode focusNode,
                        VoidCallback onFieldSubmitted) {
                      return TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Form ini wajib diisi';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: "Lot Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: Colors.black), //<-- SEE HERE
                          ),
                        ),
                        controller: texteditingcontroller,
                        focusNode: focusNode,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (String selection) {
                          onFieldSubmitted();
                        },
                      );
                    },
                    optionsViewBuilder: (BuildContext context,
                        void Function(String) onSelected,
                        Iterable<String> options) {
                      return Material(
                          child: SizedBox(
                              height: 200,
                              child: SingleChildScrollView(
                                  child: Column(
                                    children: options.map((opt) {
                                      return GestureDetector(
                                          onTap: () {
                                            onSelected(opt);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets
                                                  .only(right: 60),
                                              child: Card(
                                                  child: Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                        .all(10),
                                                    child: Text(opt),
                                                  )
                                              )
                                          )
                                      );
                                    }).toList(),
                                  )
                              )
                          )
                      );
                    }),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextFormField(
                          controller: controller.qty_checkC,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Form ini wajib diisi';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Qty Check",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black), //<-- SEE HERE
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: TextFormField(
                          controller: controller.qty_okC,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Form ini wajib diisi';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Qty Ok",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black), //<-- SEE HERE
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: controller.qty_ngC,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Form ini wajib diisi';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Qty NG",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3, color: Colors.black), //<-- SEE HERE
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                Text("REJECT NIHON SEIKI", style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),

                const SizedBox(height: 15),

                Row(
                  children: [
                    buatTextFormField("Scratch", controller.mapTextEditingController),
                    buatTextFormField("Dented", controller.mapTextEditingController),
                    buatTextFormField("Dimens", controller.mapTextEditingController),
                  ],
                ),
                Row(
                  children: [
                    buatTextFormField("Pin G", controller.mapTextEditingController),
                    buatTextFormField("CG", controller.mapTextEditingController),
                    buatTextFormField("Piptil", controller.mapTextEditingController),
                  ],
                ),
                Row(
                  children: [
                    buatTextFormField("Chip", controller.mapTextEditingController),
                    buatTextFormField("Spiral", controller.mapTextEditingController),
                    buatTextFormField("Shortcut", controller.mapTextEditingController),
                  ],
                ),
                Row(
                  children: [
                    buatTextFormField("Burry", controller.mapTextEditingController),
                    buatTextFormField("M Proses", controller.mapTextEditingController),
                  ],
                ),

                const SizedBox(height: 15),

                Text("REJECT MATERIAL", style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),

                const SizedBox(height: 15),

                Row(
                  children: [
                    buatTextFormField("Pin Hole", controller.mapTextEditingController),
                    buatTextFormField("Bending", controller.mapTextEditingController),
                  ],
                ),

                const SizedBox(height: 15),

                Text("REJECT PLATING", style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),

                const SizedBox(height: 15),

                Row(
                  children: [
                    buatTextFormField("Rusty", controller.mapTextEditingController),
                    buatTextFormField("Color", controller.mapTextEditingController),
                  ],
                ),

                const SizedBox(height: 15),

                Text("REMARK", style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.bold)),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                  child: TextFormField(
                    controller: controller.keteranganC,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Keterangan",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.black), //<-- SEE HERE
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),
                ),

                SizedBox(height: 18),

                ElevatedButton(
                  onPressed: () =>
                  controller.cekInputDanSubmit(),
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
