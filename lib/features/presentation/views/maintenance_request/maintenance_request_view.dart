import 'package:flutter/material.dart';
import 'package:gulf_sky_technician/features/domain/entities/order/order_item_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gulf_sky_technician/features/presentation/views/maintenance_request/widgets/order_item_card.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_colors.dart';

class MaintenanceRequestView extends StatefulWidget {
  final OrderItemEntity orderItemEntity;

  const MaintenanceRequestView({Key? key, required this.orderItemEntity}) : super(key: key);

  @override
  State<MaintenanceRequestView> createState() => _MaintenanceRequestViewState();
}

class _MaintenanceRequestViewState extends State<MaintenanceRequestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.orange,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.maintenanceRequest,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              OrderItemCard(
                title: AppLocalizations.of(context)!.id,
                value: '${widget.orderItemEntity.id}',
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.visitDate,
                value: DateFormat(
                  AppLocalizations.of(context)!.localeName == 'en' ? 'yyyy-MM-dd HH:MM' : 'HH:MM yyyy-MM-dd',
                ).format(widget.orderItemEntity.order.visitDate),
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.status,
                value: widget.orderItemEntity.order.state,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.description,
                value: widget.orderItemEntity.order.cause,
                isVertical: true,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.paymentStatus,
                value: widget.orderItemEntity.order.payStatus,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.client,
                value: widget.orderItemEntity.client?.name,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.buildingName,
                value: widget.orderItemEntity.rent?.building?.name,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.flatId,
                value: widget.orderItemEntity.rent?.building?.roomNumber?.toString(),
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.serviceType,
                value: widget.orderItemEntity.service?.name,
              ),
              OrderItemCard(
                title: AppLocalizations.of(context)!.serviceSection,
                value: widget.orderItemEntity.servicePart?.name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
