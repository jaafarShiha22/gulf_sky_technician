import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:gulf_sky_technician/config/routes/app_routes.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
import 'package:gulf_sky_technician/features/presentation/cubits/maintenance_orders/maintenance_orders_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/show_toast.dart';

class MaintenanceRequestsList extends StatefulWidget {
  final PagingController<int, OrderItemEntity> pagingController;
  const MaintenanceRequestsList({Key? key, required this.pagingController}) : super(key: key);

  @override
  State<MaintenanceRequestsList> createState() => _MaintenanceRequestsListState();
}

class _MaintenanceRequestsListState extends State<MaintenanceRequestsList> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaintenanceOrdersCubit, MaintenanceOrdersState>(
      bloc: MaintenanceOrdersCubit.get(context),
      listener: (context, state) {
          if (state is MaintenanceOrdersFailure) {
            EasyLoading.dismiss();
          ToastUtils.showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is MaintenanceOrdersLoading) {
          EasyLoading.show(
              status: AppLocalizations.of(context)!.loading,
              maskType: EasyLoadingMaskType.black
          );
        }
        else if (state is MaintenanceOrdersSuccess) {
          EasyLoading.dismiss();
          return PagedListView<int, OrderItemEntity>(
            pagingController: widget.pagingController,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, orderItem, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  hoverColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRoutes.maintenanceRequestView,
                      extra: orderItem,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppLocalizations.of(context)!.id}: ${orderItem.id}',
                              style: AppTextStyle.interRegularBlack,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${AppLocalizations.of(context)!.status}: ${orderItem.order.state}',
                                  style: AppTextStyle.interSmallBlack,
                                ),
                              ],
                            ),
                            Text(
                              '${AppLocalizations.of(context)!.visitDate}: ${DateFormat(
                                AppLocalizations.of(context)!.localeName == 'en' ? 'yyyy-MM-dd HH:MM' : 'HH:MM yyyy-MM-dd',
                              ).format(orderItem.order.visitDate)}',
                              style: AppTextStyle.interSmallBlack,
                              maxLines: 2,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              )
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
