import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/config/app_router.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';

class Loader {
  static bool isOpen = false;

  static showLoader({
    bool? dismisss,
  }) {
    isOpen = true;
    return showDialog(
        context: globalContext!,
        barrierDismissible: dismisss ?? false,
        builder: (context) {
          return PopScope(
            onPopInvokedWithResult: (val, _) async {
              // When back button is pressed, close the loader and set isOpen to false
              isOpen = false;
              // return true; // Allow the dialog to close
            },
            child: Container(
              width: 130,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              height: 130,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(
                    radius: 30,
                    color: AppColors.white,
                  ),
                ],
              ),
            ),
          );
        }).then((value) {
      // isOpen = false; // Ensure isOpen is reset after the dialog is closed
    });
  }

  static hideLoading() {
    if (isOpen) {
      Navigator.pop(globalContext!);
      isOpen = false; // Reset isOpen when the loader is hidden
    }
  }
}
