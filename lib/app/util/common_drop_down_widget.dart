import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/strings.dart';

// ignore: must_be_immutable
class CommonDropDownWidget<T> extends StatelessWidget {
  CommonDropDownWidget(
      {super.key,
      required this.onChanged,
      this.compareFn,
      this.enabled = true,
      this.hintText = '',
      this.suffixSearchIcon = '',
      required this.arryList,
      this.selectedItem,
      this.validator,
      this.borderEnable = false,
      this.iconColor = AppColors.grey,
      this.iconSize = 20,
      this.borderSize = 0,
      this.itemAsString,
      this.dropDownSize = 16,
      this.label = '',
      this.labelColor = AppColors.primaryText,
      this.labelSize = 12.0,
      this.labelWeight = FontWeight.w600,
      this.weight = FontWeight.w300,
      this.contextpadding = 25,
      this.requiredField = false,
      this.maxHeight = 190,
      this.showSearchBox = false,
      this.prefixIcon,
      this.prefixIconColor,
      this.prefixIconSized = 10,
      this.fillColor = AppColors.white,
      this.dropDownHeight,
      this.selectedItemHeight,
      this.hintColor = AppColors.grey,
      this.isFilledColor = true,
      this.borderColor = AppColors.grey,
      this.enableBorder = AppColors.grey,
      this.disableBorder = AppColors.grey,
      this.suffix,
      this.prefix,
      this.hintweight = FontWeight.w300,
      this.hintSize = 12,
      this.selectedFontSize});

  final Color hintColor;
  final bool isFilledColor;
  final String suffixSearchIcon;
  final bool enabled;
  final bool Function(T value1, T value2)? compareFn;
  final FontWeight weight;
  final Color borderColor;
  final Color enableBorder;
  final Color disableBorder;
  final FontWeight hintweight;
  final double hintSize;
  final double borderSize;
  final String? prefixIcon;
  final Color? prefixIconColor;
  final double? prefixIconSized;
  final double dropDownSize;
  Function(T? value)? onChanged;
  final String? Function(T? value)? validator;
  final String hintText;
  final double iconSize;
  final List<T> arryList;
  final T? selectedItem;

  // String? iconUrl;
  final Color? iconColor;
  final double contextpadding;
  final bool borderEnable;
  final bool requiredField;
  final String Function(T)? itemAsString;
  final bool showSearchBox;
  final double maxHeight;
  final Color? fillColor;
  final double? dropDownHeight;
  final double? selectedItemHeight;
  final Widget? suffix;
  final Widget? prefix;

  //
  final String label;
  final double labelSize;
  final Color labelColor;
  final FontWeight labelWeight;
  final double? selectedFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty)
          CommonText(
            text: label,
            fontSize: labelSize,
            color: labelColor,
            weight: labelWeight,
          ),
        if (label.isNotEmpty)
          const SizedBox(
            height: 10,
          ),
        SizedBox(
          // height: dropDownHeight ?? 55,
          child: DropdownSearch<T>(
            enabled: enabled,
            validator: validator,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            dropdownButtonProps: DropdownButtonProps(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                Icons.arrow_drop_down,
                size: iconSize,
                color: iconColor,
              ),
            ),
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              showSearchBox: showSearchBox,
              constraints: BoxConstraints(maxHeight: maxHeight),
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  suffix: ImageIcon(
                    AssetImage(suffixSearchIcon),
                    color: prefixIconColor ?? AppColors.black,
                    size: prefixIconSized ?? 24.0,
                  ),
                  filled: true,
                  fillColor: AppColors.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderSize),
                    borderSide: borderEnable
                        ? const BorderSide(color: AppColors.grey, width: 2.0)
                        : BorderSide.none,
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderSize),
                      borderSide:
                          const BorderSide(color: AppColors.grey, width: 1.0)),
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                  hintText: "Search here..",
                  hintStyle: const TextStyle(
                      fontSize: 10, fontFamily: Strings.fontFamily),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                ),
              ),
              menuProps: MenuProps(
                backgroundColor: AppColors.white,
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            itemAsString: itemAsString,
            items: arryList.isNotEmpty ? arryList : [],
            compareFn: compareFn,
            selectedItem: selectedItem,
            onChanged: onChanged,
            dropdownDecoratorProps: DropDownDecoratorProps(
              baseStyle: TextStyle(
                  fontFamily: Strings.fontFamily,
                  fontSize: selectedFontSize ?? 12),
              dropdownSearchDecoration: InputDecoration(
                fillColor: fillColor,
                filled: isFilledColor,
                hintText: hintText,
                prefixIcon: prefix,
                prefixIconConstraints: const BoxConstraints(maxHeight: 26),
                suffixIconConstraints: const BoxConstraints(maxHeight: 26),
                labelStyle: const TextStyle(fontSize: 10),
                hintStyle: TextStyle(
                    color: hintColor,
                    fontFamily: Strings.fontFamily,
                    fontSize: hintSize,
                    fontWeight: hintweight),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor, width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: borderColor, width: 1)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1)),
                alignLabelWithHint: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
