import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:konooze_system/controllers/home/time.dart';
import 'package:konooze_system/core/constants/padding.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    DateTimeController dateTimeController = Get.put(DateTimeController());

    bool pinned = true;
    // bool snap = true;
    // bool floating = true;
    return DefaultPadding(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: pinned,
            // snap: snap,
            // floating: floating,
            expandedHeight: 350.0,

            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              collapseMode: CollapseMode.pin,
              title: Wrap(
                alignment: WrapAlignment.center,
                direction: Axis.vertical,
                children: [
                  const Text(' الرئيسية'),
                  Obx(() => Text(
                      " ${DateFormat.yMEd().format(dateTimeController.currentDate.value)}",
                      style: Get.textTheme.labelMedium)),
                ],
              ),
              background: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary,
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(40))),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Positioned(
                          child: Card(
                        elevation: 4,
                        color: Get.theme.colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: const SizedBox(
                          height: 200,
                          width: 300,
                        ),
                      ))
                    ],
                  )),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: Center(
                child: Text('KONOOZE REAL ESTATE MARKETING AGENCY'),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child:
                        Text('$index', textScaler: const TextScaler.linear(5)),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
