import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/app_text_style.dart';

class OrderItemCard extends StatelessWidget {
  final String title;
  final String? value;
  final bool isVertical;

  const OrderItemCard({
    Key? key,
    required this.title,
    this.value,
    this.isVertical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: isVertical ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.interRegularBoldBlack,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    value??AppLocalizations.of(context)!.unknown,
                    style: AppTextStyle.interRegularBlack,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ) : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.interRegularBoldBlack,
                ),
                Expanded(
                  child: Text(
                    value??AppLocalizations.of(context)!.unknown,
                    style: AppTextStyle.interRegularBlack,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 4,
            endIndent: 4,
          ),
        ],
      ),
    );
  }
}
