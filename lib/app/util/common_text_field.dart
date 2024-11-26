import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.isFilledColor = false,
    this.hintText = '',
    this.suffixPadding = 7.5,
    this.prefixPadding,
    this.containersize = 60,
    this.txtweight = FontWeight.w400,
    this.hintweight = FontWeight.w400,
    this.hintSize = 15.0,
    this.fontsize = 15.0,
    this.hintColor = AppColors.grey,
    this.borderColor = AppColors.grey,
    this.readOnly = false,
    this.iconColor,
    this.fontFamily = 'Cabin',
    this.minLines = 1,
    this.maxLines = 1,
    this.textOnTap,
    this.onChanged,
    this.validator,
    this.changeicon = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.inputType = TextInputType.text,
    this.suffix,
    this.suffixIconOnTap,
    this.pass = false,
    this.enableBorder = AppColors.grey,
    this.disableBorder = AppColors.grey,
    this.textColor = AppColors.black,
    this.cursorColor = AppColors.secondary,
    this.padding = const EdgeInsets.all(0.0),
    this.contentPadding =
        const EdgeInsets.only(right: 10.0, top: 18, bottom: 14, left: 10),
    this.prefix,
    this.isBorderEnabled = true,
    this.isSuffix = true,
    this.textOverflow,
    this.focusNode,
    this.label,
    this.labelIcon,
    this.fillColor,
    this.borderRadius,
    this.textAlign,
    this.inputFormatter,
    this.suffixIcon,
    this.onFieldSubmitted,
  });

  final double suffixPadding;
  final EdgeInsetsGeometry? prefixPadding;
  final TextEditingController controller;
  final String hintText;
  final String fontFamily;
  final double fontsize;
  final double containersize;
  final FontWeight txtweight;
  final FontWeight hintweight;
  final double hintSize;
  final Color hintColor;
  final Color borderColor;
  final Color enableBorder;
  final Color disableBorder;
  final Color textColor;
  final Color cursorColor;
  final Color? iconColor;
  final bool pass;
  final bool readOnly;
  final bool changeicon;
  final bool isFilledColor;
  final Function()? textOnTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final int minLines;
  final int? maxLines;
  final Widget? suffix;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnTap;
  final Widget? prefix;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final AutovalidateMode? autoValidateMode;
  final bool isBorderEnabled;
  final bool isSuffix;
  final TextOverflow? textOverflow;
  final FocusNode? focusNode;
  final String? label;
  final String? labelIcon;
  final Color? fillColor;
  final double? borderRadius;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        textAlign: textAlign ?? TextAlign.start,
        focusNode: focusNode,
        controller: controller,
        cursorColor: cursorColor,
        keyboardType: inputType,
        obscureText: pass,
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        onTap: textOnTap,
        validator: validator,
        autovalidateMode: autoValidateMode,
        inputFormatters: inputFormatter,
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: txtweight,
          fontSize: fontsize,
          color: textColor,
          overflow: textOverflow,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          errorMaxLines: 6,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // label: labelIcon != null
          //     ? Row(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.asset(
          //             labelIcon ?? '',
          //             color: AppColors.primary,
          //             // scale: 1.7,
          //             height: 20,
          //           ),
          //           const HorizontalSpacing(5),
          //           CommonText(
          //             text: label ?? '',
          //             fontSize: 15,
          //             weight: FontWeight.w700,
          //           ),
          //         ],
          //       )
          //     : CommonText(
          //         text: label ?? '',
          //         fontSize: 15,
          //         weight: FontWeight.w700,
          //       ),
          fillColor: fillColor ?? Colors.white,
          filled: isFilledColor,
          hintText: hintText,
          suffixIcon: InkWell(
            onTap: suffixIconOnTap,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 5),
              child: suffix ??
                  Icon(
                    suffixIcon,
                    color: AppColors.grey,
                  ),
            ),
          ),
          prefixIcon: Padding(
            padding:
                prefixPadding ?? const EdgeInsets.only(left: 14.0, right: 8),
            child: prefix,
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 26),
          suffixIconConstraints: const BoxConstraints(maxHeight: 56),
          contentPadding: contentPadding,
          hintStyle: TextStyle(
              color: hintColor.withOpacity(0.7),
              fontFamily: fontFamily,
              fontSize: hintSize,
              fontWeight: hintweight),
          focusedBorder: isBorderEnabled
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius ?? 8))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: .5),
                ),
          border: isBorderEnabled
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius ?? 8))
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: disableBorder, width: .5),
                ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: disableBorder, width: .5)),
          enabledBorder: isBorderEnabled
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: enableBorder, width: .5),
                  borderRadius: BorderRadius.circular(borderRadius ?? 8))
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: enableBorder,
                    width: .5,
                  ),
                ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.25)),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
