import 'package:flutter/material.dart';

class RegistrationTextField extends StatelessWidget {
  RegistrationTextField({required this.hintText, required this.onChanged});
  final String hintText;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(color: Colors.white, fontSize: 20),
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.white30),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 17
            ),
        ),
      ),
    );
  }
}