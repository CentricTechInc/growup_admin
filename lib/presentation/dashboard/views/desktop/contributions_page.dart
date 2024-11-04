import 'package:flutter/cupertino.dart';
import 'package:grow_up_admin_panel/app/util/common_spacing.dart';
import 'package:grow_up_admin_panel/app/util/common_text.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_body.dart';
import 'package:grow_up_admin_panel/presentation/dashboard/views/components/parent_table_header.dart';

class ContributionPage extends StatelessWidget {
  const ContributionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              CommonText(
                text: 'Contributions',
                fontSize: 24,
                weight: FontWeight.w700,
              ),
            ],
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

          ContributionsTableBody(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
