import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/common/resources/colors.dart';
import 'package:grow_up_admin_panel/common/resources/page_path.dart';
import 'package:grow_up_admin_panel/domain/entities/gifting_model.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/gifting_details_expansion_collapsed.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/no_data_found_widget.dart';

class UserParentLiveGiftingWidget extends StatelessWidget {
  const UserParentLiveGiftingWidget(
      {super.key, required this.giftingModel, required this.isLive});

  final List<GiftingModel> giftingModel;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(
      builder: (controller) {
        return ListView.separated(
          itemCount: giftingModel.isEmpty ? 1 : giftingModel.length,
          itemBuilder: (context, listIndex) {
            return giftingModel.isEmpty
                ? const NoDataFound(title: 'No gifts found!')
                : InkWell(
                    onTap: () async {
                      await controller
                          .getGiftDetails(giftingModel[listIndex].id ?? -1);
                      context.push(PagePath.giftDetails);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.cardGrey,
                      ),
                      child: GiftingListCard(
                        giftingModel: giftingModel[listIndex],
                        onDelete: () async {
                          await controller
                              .deleteGift(giftingModel[listIndex].id ?? 0);
                          await controller.getParentDetail(
                              controller.parentDetailData.id ?? 0);
                          await controller.getGiftDetail(
                              controller.parentDetailData.id.toString() ?? '',
                              isLive ? 'Active' : 'Expired');
                          controller.update();
                        },
                      ),
                    ),
                  );
          },
          separatorBuilder: (context, index) => const VerticalSpacing(10),
        );
      },
    );
  }
}
