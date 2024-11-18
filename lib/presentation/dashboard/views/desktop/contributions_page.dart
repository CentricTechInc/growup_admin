import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grow_up_admin_panel/app/util/common_pager_widget.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/controllers/side_bar_controller.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';

class ContributionPage extends StatelessWidget {
  const ContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideBarController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              label: 'Contributions',
              showSearch: true,
              searchController: controller.contributionsSearchController,
              searchCancelOnTap: () async {
                controller.contributionsSearchController.clear();

                await controller.getContributionTable();
                controller.update();
              },
              searchOnChanged: (val) {
                controller.debouncer.run(() async {
                  await controller.getContributionTable();
                  controller.update();
                });
              },
            ),
            const VerticalSpacing(30),
            const ContributionTableHeader(
              // value: false,
              titleList: [
                'Payment ID',
                'Gifting Title',
                'Contributor',
                'Benefeciary Name',
                'Payment Gateway',
                'Date & Time',
                'Frequency',
                'Amount',
                'Status',
              ],
            ),
            const VerticalSpacing(10),
            Expanded(
              child: ListView.separated(
                itemCount: controller.contributionModelList.length,
                itemBuilder: (context, index) => ContributionsTableBody(
                  model: controller.contributionModelList[index],
                  onTap: () {},
                ),
                separatorBuilder: (context, index) => const VerticalSpacing(5),
              ),
            ),
            CommonPagerWidget(
              currentPage: controller.contributonModulePageNo,
              totalPage: ((controller.elementCount == 0
                          ? 1
                          : controller.elementCount) /
                      10)
                  .ceil(),
              onPageChanged: (page) async {
                controller.contributonModulePageNo = page;
                await controller.getContributionTable();
                controller.update();
              },
            ),
          ],
        ),
      );
    });
  }
}
