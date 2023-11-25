import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:gulf_sky_technician/features/presentation/cubits/maintenance_orders/maintenance_orders_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/enums/bar_tab.dart';
import '../../../domain/entities/order/order_item_entity.dart';
import '../home/home_view.dart';
import '../notifications/notifications_view.dart';
import '../settings/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  ValueNotifier<BarTab> currentTab = ValueNotifier(BarTab.home);
  final PagingController<int, OrderItemEntity> _pagingController = PagingController(firstPageKey: 0);


  @override
  void initState() {
    BlocProvider.of<MaintenanceOrdersCubit>(context).getMaintenanceOrders(
      page: 0,
      pagingController: _pagingController,
    );
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<MaintenanceOrdersCubit>(context).getMaintenanceOrders(
        page: pageKey,
        pagingController: _pagingController,
      );
    });
    super.initState();
  }

  void changeCurrentTab(int index) {
    switch (index) {
      case 0:
        currentTab.value = BarTab.notifications;
        break;
      case 1:
        currentTab.value = BarTab.home;
        break;
      case 2:
        currentTab.value = BarTab.settings;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<BarTab>(
          valueListenable: currentTab,
          builder: (context, val, child) {
            return () {
              switch (currentTab.value) {
                case BarTab.home:
                  return  HomeView(pagingController: _pagingController,);
                case BarTab.notifications:
                  return const NotificationsView();
                case BarTab.settings:
                  return const SettingsView();
              }
            }();
          },
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        initialActiveIndex: 1,
        activeColor: AppColors.orange,
        backgroundColor: AppColors.white,
        height: 55,
        color: AppColors.black.withOpacity(.8),
        items: [
          TabItem(icon: Icons.notifications_none, title: AppLocalizations.of(context)!.notifications),
          TabItem(icon: Icons.home, title: AppLocalizations.of(context)!.home),
          TabItem(icon: Icons.settings, title: AppLocalizations.of(context)!.settings),
        ],
        onTap: changeCurrentTab,
      ),
    );
  }
}
