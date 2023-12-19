import "package:flutter/material.dart";

InputDecoration getAutenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
  );
}
