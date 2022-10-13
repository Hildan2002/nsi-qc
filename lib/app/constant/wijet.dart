import 'package:flutter/material.dart';

Expanded buatTextFormField(String s, Map<String, TextEditingController> a) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(left: 2.0, right: 2.0),
      child: TextFormField(
        controller: a[s],
        // controller: ngns_scratchC,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: s,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 3, color: Colors.black),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                width: 3, color: Colors.black), //<-- SEE HERE
          ),
        ),
        textInputAction: TextInputAction.next,
      ),
    ),
  );
}