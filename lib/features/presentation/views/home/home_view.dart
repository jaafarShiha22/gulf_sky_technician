import 'package:flutter/material.dart';
import 'package:gulf_sky_technician/core/utils/app_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gulf_sky_technician/features/presentation/views/home/widgets/evacuation_requests_list.dart';
import 'package:gulf_sky_technician/features/presentation/views/home/widgets/maintenance_requests_list.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../domain/entities/order/order_item_entity.dart';

class HomeView extends StatefulWidget {
  final PagingController<int, OrderItemEntity> pagingController;
  const HomeView({Key? key, required this.pagingController}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: TabBar(
              tabs: [
                Text(
                  AppLocalizations.of(context)!.maintenanceRequests,
                  style: AppTextStyle.interSmallBlack,
                ),
                Text(
                  AppLocalizations.of(context)!.evEvacuationRequests,
                  style: AppTextStyle.interSmallBlack,
                ),
              ],
            ),
          ),
           Expanded(
            child: TabBarView(
              children: [
                MaintenanceRequestsList(pagingController: widget.pagingController),
                const EvacuationRequestsList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
