import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/utils/app_text_style.dart';

class EvacuationRequestsList extends StatelessWidget {
  const EvacuationRequestsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.evEvacuationRequests, style: AppTextStyle.interSmallBlack),
      ],
    );
  }
}
