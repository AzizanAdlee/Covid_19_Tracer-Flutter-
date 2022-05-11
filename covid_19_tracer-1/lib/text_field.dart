import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? validatorLabel;
  final String? errorlabel;
  final bool? label1;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.validatorLabel,
      this.errorlabel,
      this.label1})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // late bool isObscure = widget.obscureText != null;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: widget.controller,
        validator: (val) {
          if (widget.errorlabel != null && widget.label1 == null) {
            return val!.isNotEmpty ? null : 'Please enter ${widget.errorlabel}';
          }
          return null;
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          // prefixIcon: const Icon(Icons.email),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
          labelText: widget.label,
        ),
      ),
    );
  }
}
