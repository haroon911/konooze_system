import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:konooze_system/controllers/home/unit_sales_controller.dart';
import 'package:konooze_system/core/classes/data_view_hander.dart';
import 'package:konooze_system/model/home/properties/units.dart';
import 'package:konooze_system/views/components/icon_text.dart';

class ViewUnitDetails extends StatelessWidget {
  const ViewUnitDetails({
    super.key,
    required this.unit,
    required this.propertyId,
  });

  final PropertyUnit unit;
  final int propertyId;
  @override
  Widget build(BuildContext context) {
    UnitSalesController unitSalesController = Get.put(UnitSalesController());
    unitSalesController.initData(propertyId, unit.id);
    debugPrint(unitSalesController.statusRequest.toString());
    return SingleChildScrollView(
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            Column(
              children: [
                CustomIconText(label: unit.name, iconData: Icons.home),
                Wrap(
                  children: [
                    if (unit.length != 0)
                      CustomIconText(
                        label: unit.length.toString(),
                        iconData: Icons.straighten_rounded,
                        style: Get.textTheme.labelLarge,
                      ),
                    if (unit.length != 0)
                      CustomIconText(
                        label: unit.length.toString(),
                        iconData: Icons.height_rounded,
                        style: Get.textTheme.labelLarge,
                      ),
                    CustomIconText(
                      label: unit.size.toString(),
                      iconData: Icons.aspect_ratio_rounded,
                      style: Get.textTheme.labelLarge,
                    ),
                  ],
                ),
                Divider(),
                Text(
                  "تفاصيل عن الوحدة",
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  unit.details,
                  style: Get.textTheme.labelLarge,
                  softWrap: true,
                ),
                SalesInfoCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SalesInfoCard extends StatelessWidget {
  const SalesInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitSalesController>(builder: (controller) {
      return DataRequestHandler(
        statusRequest: controller.statusRequest,
        child: controller.unitSales.isEmpty
            ? SizedBox()
            : Column(
                children: [
                  Text("تم التأجير"),
                  Divider(),
                  Text(
                    "  المسوق العقاري ",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomIconText(
                    label: controller.unitSales[0].agentName,
                    iconData: Icons.person,
                    style: Get.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    children: [
                      Text("الشركة المستفيدة "),
                      Text(controller.unitSales[0].company)
                    ],
                  ),
                  CustomIconText(
                    label: DateFormat('dd/MM/yyyy')
                        .format(controller.unitSales[0].salesDate),
                    iconData: Icons.date_range_rounded,
                  ),
                ],
              ),
      );
    });
  }
}
