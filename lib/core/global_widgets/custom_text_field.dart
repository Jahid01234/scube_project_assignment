import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scube_assignment/core/const/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? height;
  final double? radius;
  final Color? borderColor;
  final bool? readOnly;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final bool obsecureText;
  final TextInputType? textInputType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hinText,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.obsecureText = false,
    this.textInputType,
    this.height,
    this.radius,
    this.borderColor,
    this.readOnly,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 56,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? AppColors.gray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
      child: Center(
        child: TextField(
          onTap: onTap,
          autofocus: false,
          controller: controller,
          obscureText: obsecureText,
          keyboardType: textInputType,
          onChanged: onChanged,
          readOnly: readOnly ?? false,
          cursorColor: Colors.grey,
          enableInteractiveSelection: false,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
          ),
          decoration: InputDecoration(
            hintText: hinText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: AppColors.white,
            hintStyle: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.gray,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          ),
        ),
      ),
    );
  }
}