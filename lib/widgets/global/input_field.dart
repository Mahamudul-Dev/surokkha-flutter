// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? prefixText;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final String? hint;
  final Widget? label;
  final int? maxLength;
  final bool? obscureText;
  final int? maxLines;
  final bool? isFilled;
  final Widget? suffixIcon;
  final bool? readOnly;
  final String? Function(String? value)? validator;
  final TextEditingController? textEditingController;
  const InputField({
    Key? key,
    this.prefixText,
    this.prefixIcon,
    this.hint,
    this.label,
    this.maxLength,
    this.maxLines,
    this.textEditingController,
    this.validator,
    this.suffixIcon,
    this.obscureText,
    this.readOnly,
    this.isFilled,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: TextFormField(
        readOnly: readOnly ?? false,
        controller: textEditingController,
        validator: validator,
        keyboardType: textInputType,
        obscureText: obscureText ?? false,
        decoration: InputDecoration(
            label: label,
            hintText: hint,
            fillColor: Colors.grey,
            filled: isFilled,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixText: prefixText,
            prefixIcon: prefixIcon),
        maxLength: maxLength,
        maxLines: maxLines,
      ),
    );
  }
}

class DropdownField extends StatelessWidget {
  const DropdownField(
      {required this.items,
      this.function,
      this.label,
      this.prefixText,
      this.prefixIcon,
      Key? key,
      this.selectedValue,
      this.hint,
      this.isFilled})
      : super(key: key);
  final List<String> items;
  final void Function(String? newValue)? function;
  final String? selectedValue;
  final Widget? label;
  final String? hint;
  final bool? isFilled;
  final String? prefixText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: function,
      decoration: InputDecoration(
          label: label,
          hintText: hint,
          fillColor: Colors.grey,
          filled: isFilled,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixText: prefixText,
          prefixIcon: prefixIcon),
    );
  }
}
