import 'package:flutter/material.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/app/util/common_vertical_divider_widget.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/drawables.dart';
import 'package:grow_up_admin_panel/data/dto/gift_payout_model.dart';
import 'package:grow_up_admin_panel/domain/entities/contribution_model.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/domain/entities/parent_model.dart';
import 'package:grow_up_admin_panel/domain/entities/payout_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/payment_details_dialog_box.dart';

class ParentTableBody extends StatelessWidget {
  const ParentTableBody({super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final ParentModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                  // GetBuilder<UserParentController>(builder: (controller) {
                  // return
                  SizedBox(
                    height: 35,
                    width: 35,
                    child: Checkbox(
                      value: model.isSelected ?? false,
                      activeColor: AppColors.primary,
                      splashRadius: 10,
                      onChanged: (p0) {
                        // model.isSelected = p0;
                        // controller.update();
                      },
                      side: const BorderSide(color: AppColors.grey, width: 1),
                    ),
                  ),
                  // ;
                  // }),
                  const HorizontalSpacing(30),
                  CommonText(
                    text: model.id?.toString() ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.name ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.email ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.phone ?? '',
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
    );
  }
}

class GiftingsTableBody extends StatelessWidget {
  const GiftingsTableBody(
      {super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final GiftingModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
                      side: const BorderSide(color: AppColors.grey, width: 1),
                    ),
                  ),
                  const HorizontalSpacing(30),
                  CommonText(
                    text: model.id?.toString() ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.title ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.user?.name ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.beneficiary?.name ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.createdAt ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: CommonText(
                  textAlign: TextAlign.right,
                  text: '\$ ${model.contributionTotal ?? ''}',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: StatusCardWidget(
                  title: model.status?.name ?? '',
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
    );
  }
}

class ContributionsTableBody extends StatelessWidget {
  const ContributionsTableBody(
      {super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final ContributionModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.gift?.title ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.contributor ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.beneficiary ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: CommonText(
                  text: model.createdAt ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: CommonText(
                  text: model.frequency?.name ?? '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    CommonText(
                      text: '\$${model.amount}',
                      fontSize: 12,
                      weight: FontWeight.w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            child: PaymentDetailsDialogBox(
                              model: model,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Image.asset(Assets.shareIcon, scale: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusCardWidget extends StatelessWidget {
  const StatusCardWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: title != 'Expired'
            ? AppColors.primary.withOpacity(0.4)
            : AppColors.grey,
      ),
      child: CommonText(
        textAlign: TextAlign.center,
        text: title,
        color: title != 'Expired'?  AppColors.primary : AppColors.primaryText,
        fontSize: 12,
        weight: FontWeight.w400,
      ),
    );
  }
}

class PayoutTableBody extends StatelessWidget {
  const PayoutTableBody({super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final PayoutModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    side: const BorderSide(color: AppColors.grey, width: 1),
                  ),
                ),
                const HorizontalSpacing(30),
                CommonText(
                  text: model.id?.toString() ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CommonText(
                text: model.gift?.title ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CommonText(
                text: model.postedBy ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CommonText(
                text: model.beneficiary ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: CommonText(
                text: model.createdAt ?? '',
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: Row(
                children: [
                  CommonText(
                    textAlign: TextAlign.right,
                    text: '\$${model.amount}',
                    fontSize: 12,
                    weight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: onTap,
                    child: SizedBox(
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image.asset(Assets.shareIcon, scale: 2),
                      ),
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

class UserParentLiveGfitingPayoutTableBody extends StatelessWidget {
  const UserParentLiveGfitingPayoutTableBody(
      {super.key, required this.onTap, required this.model});

  final VoidCallback onTap;
  final List<PayoutModel> model;

  @override
  Widget build(BuildContext context) {
    return
      ListView.separated(itemBuilder: (context,index)=>InkWell(
        onTap: onTap,
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
                child: CommonText(
                  text: model[index].transactionId ?? '',
                  fontSize: 12,
                  weight: FontWeight.w500,
                ),
              ),
              const CommonVerticalDivider(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: AppColors.grey,
                thickness: 2,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: CommonText(
                    text: model[index].createdAt ?? '',
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: CommonText(
                    text: model[index].amount ?? '',
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
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: CommonText(
                    text: model[index].status?.name ?? '',
                    fontSize: 12,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ), separatorBuilder: (context, index)=>const VerticalSpacing(10), itemCount: model.length);
  }
}
