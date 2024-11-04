import 'package:finance_vertexware/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppColors {
  static const Color primaryBlue = Color(0xFF1A237E); // Azul escuro
  static const Color white = Colors.white; // Branco
  static const Color accentOrange = Color(0xFFF57C00); // Laranja
}

class TextFieldWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool border;
  final TextInputType? textInputType;
  final int? maxLines;

  const TextFieldWidget({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.border = true,
    this.textInputType,
    this.onSaved,
    this.onTap,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      initialValue: widget.initialValue,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      obscureText: isObscure,
      keyboardType: widget.textInputType,
      maxLines: widget.isSecret ? 1 : widget.maxLines,
      validator: widget.validator,
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: AppColors.primaryBlue),
        labelText: widget.label,
        border: widget.border ? OutlineInputBorder() : InputBorder.none,
        suffixIcon: widget.isSecret
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryBlue,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
