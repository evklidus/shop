import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  final String? hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: TextFormField(
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        validator: validator,
        style: const TextStyle(color: Colors.black54),
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: const Color.fromARGB(255, 235, 244, 253),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
