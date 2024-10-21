import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_drop_down_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';

class UserParentPage extends StatelessWidget {
  const UserParentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CommonText(
            text: 'Parents',
            fontSize: 24,
            weight: FontWeight.w700,
          ),
          const VerticalSpacing(30),
          const ParentTableHeader(
            // value: false,
            titleList: ['User ID', 'Name', 'Email', 'Phone'],
          ),
          const VerticalSpacing(10),
          InkWell(
            onTap: () {
              context
                  .push(PagePath.userParents + PagePath.parentDetails.toRoute);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 35,
                          child: Checkbox(
                            value: false,
                            activeColor: AppColors.primary,
                            splashRadius: 10,
                            onChanged: (p0) {},
                            side: const BorderSide(
                                color: AppColors.grey, width: 1),
                          ),
                        ),
                        const HorizontalSpacing(30),
                        const CommonText(
                          text: '#HS5896',
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                  const CommonVerticalDivider(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: AppColors.grey,
                    thickness: 2,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: CommonText(
                        text: 'Jason Borne',
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const CommonVerticalDivider(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: AppColors.grey,
                    thickness: 2,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: CommonText(
                        text: 'jasonborne@abc.com',
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const CommonVerticalDivider(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: AppColors.grey,
                    thickness: 2,
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 30.0),
                      child: CommonText(
                        text: '+ 0000 0000 000',
                        fontSize: 12,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Image.asset(Assets.shareIcon, scale: 2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CommonBackButton extends StatelessWidget {
  const CommonBackButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        Assets.backIcon,
        scale: 2,
      ),
    );
  }
}

class UserParentDetails extends StatelessWidget {
  const UserParentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonBackButton(onTap: () {}),
          const VerticalSpacing(30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.cardGrey,
                  ),
                  child: Row(
                    children: [
                      const CommonText(
                        text: 'User ID',
                        fontSize: 16,
                        weight: FontWeight.w700,
                      ),
                      const HorizontalSpacing(20),
                      const CommonText(
                        text: '#D10889',
                        fontSize: 16,
                        color: AppColors.primary,
                        weight: FontWeight.w700,
                      ),
                      const Spacer(),
                      const CommonText(
                        text: 'Status',
                        fontSize: 16,
                        weight: FontWeight.w700,
                      ),
                      const HorizontalSpacing(20),
                      SizedBox(
                          width: 160,
                          child: CommonDropDownWidget(
                              onChanged: (p0) {}, arryList: []))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ParentTableHeader extends StatelessWidget {
  const ParentTableHeader({super.key, required this.titleList});

  final List<String> titleList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[0],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[1],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[2],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const CommonVerticalDivider(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: AppColors.primary,
            thickness: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: CommonText(
                text: titleList[3],
                weight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}

// class TableHeader extends StatelessWidget {
//   const TableHeader({super.key, required this.value, required this.titleList});
//
//   final bool value;
//   final List<String> titleList;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         color: AppColors.primary.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Row(
//         children: List.generate(
//           titleList.length,
//           (index) => Expanded(
//             child: Visibility(
//               visible: index != 0,
//               replacement: Padding(
//                 padding: const EdgeInsets.only(left: 70),
//                 child: CommonText(
//                   text: titleList[index],
//                   weight: FontWeight.w700,
//                   fontSize: 12,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   const CommonVerticalDivider(
//                     padding: EdgeInsets.symmetric(vertical: 10),
//                     color: AppColors.primary,
//                     thickness: 2,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 30),
//                     child: CommonText(
//                       text: titleList[index],
//                       weight: FontWeight.w700,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
