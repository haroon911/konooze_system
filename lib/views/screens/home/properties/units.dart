import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:konooze_system/controllers/home/units_controller.dart';
import 'package:konooze_system/core/classes/data_view_hander.dart';
import 'package:konooze_system/model/home/properties/units.dart';

class PropertyUnits extends StatelessWidget {
  const PropertyUnits({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GetBuilder<UnitsController>(builder: (controller) {
        return DataRequestHandler(
          statusRequest: controller.statusRequest,
          child: MasonryGridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
            ),
            itemCount: controller.units.length,
            itemBuilder: (context, index) =>
                UnitCard(unit: controller.units[index]),
            physics: const NeverScrollableScrollPhysics(),
          ),
        );
      }),
    );
  }
}

class UnitCard extends GetView<UnitsController> {
  const UnitCard({
    super.key,
    required this.unit,
  });

  final PropertyUnit unit;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          color: unit.status == 'leased'
              ? Colors.green.shade300.withAlpha(20)
              : Colors.red.shade300.withAlpha(20),
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: InkWell(
            onTap: () {
              controller.onUnitTapped(unit);
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      IconText(
                        label: unit.name,
                        iconData: Icons.home_rounded,
                        style: Get.textTheme.labelLarge,
                      ),
                      Wrap(
                        children: [
                          if (unit.length != 0)
                            IconText(
                              label: unit.length.toString(),
                              iconData: Icons.straighten_rounded,
                              style: Get.textTheme.labelLarge,
                            ),
                          if (unit.length != 0)
                            IconText(
                              label: unit.length.toString(),
                              iconData: Icons.height_rounded,
                              style: Get.textTheme.labelLarge,
                            ),
                          IconText(
                            label: unit.size.toString(),
                            iconData: Icons.aspect_ratio_rounded,
                            style: Get.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      IconText(
                        label: unit.details,
                        iconData: Icons.info,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                  SizedBox(
                    // width: double.infinity,
                    child: FittedBox(
                        child: Container(
                      // margin: const EdgeInsets.symmetric(
                      //     horizontal: 0, vertical: 0),
                      // padding: const EdgeInsets.symmetric(
                      //     horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                          // color: Get.theme.colorScheme.onPrimaryFixedVariant,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(10))),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.keyboard_double_arrow_up_rounded,
                            color: Colors.green,
                            size: 30,
                          ),
                          Text(
                            NumberFormat.currency(
                                    symbol: "ر.س",
                                    decimalDigits: 0,
                                    locale: const Locale('ar', 'SA')
                                        .toLanguageTag())
                                .format(unit.highPrice)
                                .toString(),
                            style: Get.textTheme.titleMedium!.copyWith(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const Icon(
                            Icons.keyboard_double_arrow_down_rounded,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                          Text(
                            NumberFormat.currency(
                                    symbol: "ر.س",
                                    decimalDigits: 0,
                                    locale: const Locale('ar', 'SA')
                                        .toLanguageTag())
                                .format(unit.lowPrice)
                                .toString(),
                            style: Get.textTheme.titleLarge!.copyWith(
                                color: Colors.deepOrange,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 80,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(20)),
                gradient: LinearGradient(colors: [
                  Get.theme.colorScheme.tertiaryContainer,
                  Get.theme.colorScheme.primaryContainer
                ])),
            child: Text(unit.type.tr),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: unit.status == 'leased'
                      ? Colors.green.shade300
                      : Colors.red.shade300,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Text(
                unit.status == "leased" ? "تم التأجير" : "قيد التأجير",
                style: Get.textTheme.labelMedium!.copyWith(color: Colors.white),
              )),
        )
      ],
    );
  }
}

class IconText extends StatelessWidget {
  const IconText(
      {super.key,
      required this.label,
      this.iconData = Icons.crop,
      this.style,
      this.overflow,
      this.maxLines});

  final String label;
  final IconData iconData;
  final TextStyle? style;
  final TextOverflow? overflow;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 5,
        children: [
          Icon(iconData, color: Get.theme.colorScheme.primary),
          Text(
            label,
            style: style,
            softWrap: true,
            overflow: overflow,
            maxLines: maxLines,
          ),
        ],
      ),
    );
  }
}
