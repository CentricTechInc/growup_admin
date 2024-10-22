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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonBackButton(onTap: () {
              context.pop();
            }),
            const VerticalSpacing(30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
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
                                  onChanged: (p0) {},
                                  arryList: const [],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CommonText(
                                text: 'Parent Details',
                                fontSize: 20,
                                weight: FontWeight.w700,
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Name',
                                      fontSize: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Name',
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Total Gifting',
                                      fontSize: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  3,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Total Gifting',
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        Row(
                          children: List.generate(
                            3,
                            (index) => InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: index == 0
                                        ? AppColors.greyish
                                        : AppColors.transparent,
                                  ),
                                  child: const CommonText(
                                    text: 'Live Giftings',
                                    fontSize: 16,
                                    weight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const VerticalSpacing(20),
                        Container(
                          padding: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(
                                      3,
                                      (index) => InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: index == 0
                                                  ? AppColors.white
                                                  : AppColors.transparent,
                                            ),
                                            child: const CommonText(
                                              text: 'Live Giftings',
                                              fontSize: 16,
                                              weight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: Assets.deleteIcon,
                                    onTap: () {},
                                    color: AppColors.red,
                                  ),
                                  const HorizontalSpacing(20),
                                  IconButton(
                                    icon: Assets.upChevronIcon,
                                    onTap: () {},
                                    color: AppColors.darkGrey,
                                  ),
                                ],
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 140,
                                    width: 210,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                  Assets.schoolImg,
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: const LinearGradient(
                                              stops: [0, 1.0],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: AppColors.bwGradient,
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonText(
                                                text: 'help Us Succeed',
                                                fontSize: 16,
                                                weight: FontWeight.w600,
                                                color: AppColors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const HorizontalSpacing(20),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const VerticalSpacing(20),
                                        Row(
                                          children: List.generate(
                                            3,
                                            (index) => const Expanded(
                                              child: CommonText(
                                                text: 'Total Gifting',
                                                fontSize: 16,
                                                weight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const VerticalSpacing(10),
                                        Row(
                                          children: List.generate(
                                            3,
                                            (index) => const Expanded(
                                              child: CommonText(
                                                text: 'Total Gifting',
                                                fontSize: 16,
                                                weight: FontWeight.w400,
                                                color: AppColors.secondaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const VerticalSpacing(20),
                                        Row(
                                          children: List.generate(
                                            3,
                                            (index) => const Expanded(
                                              child: CommonText(
                                                text: 'Total Gifting',
                                                fontSize: 16,
                                                weight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const VerticalSpacing(10),
                                        Row(
                                          children: List.generate(
                                            3,
                                            (index) => const Expanded(
                                              child: CommonText(
                                                text: 'Total Gifting',
                                                fontSize: 16,
                                                weight: FontWeight.w400,
                                                color: AppColors.secondaryText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const VerticalSpacing(20),
                              const CommonText(
                                text: 'Description',
                                fontSize: 16,
                                weight: FontWeight.w700,
                              ),
                              const VerticalSpacing(10),
                              const CommonText(
                                text:
                                    'Help John achieve his dream of attending college! Your contributions will cover tuition, books, and living expenses, enabling him to focus on his studies. Every donation brings him one step closer to a bright future. Thank you for your support!',
                                fontSize: 16,
                                weight: FontWeight.w400,
                                color: AppColors.secondaryText,
                              ),
                              const VerticalSpacing(60),
                              const Divider(
                                color: AppColors.grey,
                              ),
                              const VerticalSpacing(20),
                              const CommonText(
                                text: 'Beneficiary Account Details',
                                fontSize: 20,
                                weight: FontWeight.w700,
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'Bank',
                                      fontSize: 16,
                                      weight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => const Expanded(
                                    child: CommonText(
                                      text: 'City Bank',
                                      fontSize: 16,
                                      weight: FontWeight.w400,
                                      color: AppColors.secondaryText,
                                    ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(20),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Expanded(
                                    child: index == 3
                                        ? const Spacer()
                                        : const CommonText(
                                            text: 'Bank',
                                            fontSize: 16,
                                            weight: FontWeight.w700,
                                          ),
                                  ),
                                ),
                              ),
                              const VerticalSpacing(10),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Expanded(
                                    child: index == 3
                                        ? const Spacer()
                                        : const CommonText(
                                            text: 'City Bank',
                                            fontSize: 16,
                                            weight: FontWeight.w400,
                                            color: AppColors.secondaryText,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const HorizontalSpacing(30),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonText(
                          text: 'Beneficiaries',
                          fontSize: 20,
                          weight: FontWeight.w600,
                        ),
                        const VerticalSpacing(20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardGrey,
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileTile(),
                              VerticalSpacing(18),
                              CommonTile(
                                title: 'Age',
                                subTitle: '16 years',
                              ),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Phone', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Received Contributions',
                                  subTitle: '\$ 150.00'),
                              VerticalSpacing(20),
                              CommonText(
                                text: 'Bank Details',
                                fontSize: 20,
                                weight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Bank', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Account Type',
                                  subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Account Owner Name',
                                  subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'City ', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'State', subTitle: '+1 012-456-789'),
                              VerticalSpacing(10),
                              CommonTile(
                                  title: 'Zip', subTitle: '+1 012-456-789'),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.cardGrey,
                            ),
                            child: const ProfileTile()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            Assets.schoolImg,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        const HorizontalSpacing(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              text: 'Mathew Machelle',
              fontSize: 20,
              weight: FontWeight.w600,
              color: AppColors.primary,
            ),
            Row(
              children: [
                Image.asset(
                  Assets.relationIcon,
                  scale: 2,
                ),
                const HorizontalSpacing(5),
                const CommonText(
                  text: 'Nephew',
                  fontSize: 16,
                  weight: FontWeight.w500,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Assets.deleteIcon,
          onTap: () {},
          color: AppColors.red,
        ),
        const HorizontalSpacing(20),
        IconButton(
          icon: Assets.upChevronIcon,
          onTap: () {},
          color: AppColors.darkGrey,
        ),
      ],
    );
  }
}

class CommonTile extends StatelessWidget {
  const CommonTile({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText(
          text: title,
          fontSize: 16,
          weight: FontWeight.w700,
        ),
        const VerticalSpacing(5),
        CommonText(
          text: subTitle,
          fontSize: 16,
          weight: FontWeight.w400,
          color: AppColors.secondaryText,
        ),
      ],
    );
  }
}

class IconButton extends StatelessWidget {
  const IconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.color});

  final String icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        padding: const EdgeInsets.all(6.25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color.withOpacity(0.08),
        ),
        child: Image.asset(icon),
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
