import 'package:flutter/cupertino.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/desktop/user_parent_page.dart';

class ContributionPage extends StatelessWidget {
  const ContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            label: 'Contributions',
          ),
          const VerticalSpacing(30),
          const ContributionTableHeader(
            // value: false,
            titleList: [
              'Payment ID',
              'Gifting Title',
              'Parent Name',
              'Benefeciary Name',
              'Payment Gateway',
              'Date & Time',
              'Frequncy',
              'Amount',
              'Status',
            ],
          ),
          const VerticalSpacing(10),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              itemBuilder: (context, index) => ContributionsTableBody(
                onTap: () {},
              ),
              separatorBuilder: (context, index) => const VerticalSpacing(5),
            ),
          ),
        ],
      ),
    );
  }
}
