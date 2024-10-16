import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.controller,
      this.isFilledColor = true,
      this.hintText = '',
      this.suffixPadding = 7.5,
      this.prefixPadding = 7.5,
      this.containersize = 60,
      this.txtweight = FontWeight.w400,
      this.hintweight = FontWeight.w400,
      this.hintSize = 15.0,
      this.fontsize = 15.0,
      this.hintColor = AppColors.grey,
      this.borderColor = AppColors.grey,
      this.readOnly = false,
      this.iconColor,
      this.fontFamily = 'Poppins',
      this.minLines = 1,
      this.maxLines = 1,
      this.textOnTap,
      this.onChanged,
      this.validator,
      this.changeicon = false,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.inputType = TextInputType.text,
      this.suffixIcon,
      this.suffixIconOnTap,
      this.pass = false,
      this.enableBorder = AppColors.grey,
      this.disableBorder = AppColors.grey,
      this.textColor = AppColors.black,
      this.cursorColor = AppColors.black,
      this.padding = const EdgeInsets.all(0.0),
      this.contentPadding =
          const EdgeInsets.only(right: 20.0, top: 18, bottom: 14, left: 10.0),
      this.prefix,
      this.isBorderEnabled = false,
      this.isSuffix = true,
      this.textOverflow,
      this.label,
      this.inputFormatter,
      this.enableInteractiveSelection});

  final double suffixPadding;
  final double prefixPadding;
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
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final int minLines;
  final int? maxLines;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconOnTap;
  final Widget? prefix;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry contentPadding;
  final AutovalidateMode? autoValidateMode;
  final bool isBorderEnabled;
  final bool isSuffix;
  final TextOverflow? textOverflow;
  final String? label;
  final List<TextInputFormatter>? inputFormatter;
  final bool? enableInteractiveSelection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            CommonText(
              text: label ?? '',
              fontSize: 12,
              weight: FontWeight.w600,
            ),
          if (label != null)
            const SizedBox(
              height: 10,
            ),
          TextFormField(
              enableInteractiveSelection: enableInteractiveSelection,
              inputFormatters: inputFormatter,
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
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.grey, width: .5),
                  ),
                  // fillColor: AppColors.fieldBgColor,
                  filled: isFilledColor,
                  hintText: hintText,
                  // suffix: GestureDetector(onTap: suffixIconIconTap),
                  suffixIcon: isSuffix
                      ? IconButton(
                          onPressed: suffixIconOnTap,
                          icon: Icon(
                            suffixIcon,
                            color: iconColor ?? AppColors.grey,
                          ),
                          color: AppColors.grey,
                        )
                      : null,
                  prefixIcon: prefix,
                  prefixIconConstraints: const BoxConstraints(maxHeight: 26),
                  // suffixIconConstraints: const BoxConstraints(maxHeight: 26),
                  contentPadding: contentPadding,
                  hintStyle: TextStyle(
                      color: hintColor.withOpacity(0.7),
                      fontFamily: fontFamily,
                      fontSize: hintSize,
                      fontWeight: hintweight),
                  focusedBorder: OutlineInputBorder(
                      borderSide: isBorderEnabled
                          ? BorderSide(color: borderColor, width: .5)
                          : BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  border: OutlineInputBorder(
                      borderSide: isBorderEnabled
                          ? BorderSide(color: borderColor, width: .5)
                          : BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: disableBorder, width: .5)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: isBorderEnabled
                        ? BorderSide(color: enableBorder, width: .5)
                        : BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: isBorderEnabled
                          ? const BorderSide(color: Colors.red, width: 1.25)
                          : BorderSide.none))),
        ],
      ),
    );
  }
}
