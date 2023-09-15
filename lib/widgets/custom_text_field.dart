import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key,this.inputType, this.hintText, this.onChanged, this.obscureText});
  Function(String)? onChanged;
  String? hintText;
  TextInputType? inputType;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13, left: 13, top: 5),
      child: TextField(
        // because it will doing update,it doesn't need to validate,so i used TextField not TextFormField
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        keyboardType: inputType,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
