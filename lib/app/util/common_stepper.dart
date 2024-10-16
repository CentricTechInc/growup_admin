import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CommonStepper extends StatelessWidget {
  const CommonStepper(
      {super.key, this.currentStep = 1, required this.stepText});

  final int steps = 5;
  final int currentStep;
  final List<String> stepText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
          decoration: BoxDecoration(
              color: AppColors.greyish,
              borderRadius: BorderRadius.circular(8.0)),
          width: context.width,
          constraints: BoxConstraints(
              maxWidth: context.width, minHeight: 18, maxHeight: 25),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepText.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 5);
            },
            itemBuilder: (context, index) {
              return Visibility(
                visible: index == currentStep,
                replacement: Center(
                  child: Container(
                    width: (context.width - 90) / stepText.length,
                    height: currentStep > index ? 2.5 : 3,
                    decoration: BoxDecoration(
                        color: currentStep > index
                            ? AppColors.primary
                            : AppColors.grey.withOpacity(0.5)),
                  ),
                ),
                child: SizedBox(
                  width: (context.width - 90) / stepText.length,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 3,
                          decoration:
                              const BoxDecoration(color: AppColors.primary),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(2.0)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2.5,
                          decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepText.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 5);
            },
            itemBuilder: (context, index) {
              return Center(
                child: Container(
                  width: (context.width - 90) / stepText.length,
                  alignment: Alignment.center,
                  child: CommonText(
                    text: stepText[index],
                    fontSize: 7.sp,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
