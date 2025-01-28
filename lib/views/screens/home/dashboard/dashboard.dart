import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/dashboard/dashboard_controller.dart';
import 'package:konooze_system/controllers/home/time.dart';
import 'package:konooze_system/core/constants/padding.dart';
import 'package:konooze_system/views/components/auth/shared/blur_effect.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    Get.put(DateTimeController());

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Get.theme.colorScheme.primary.withValues(alpha: 0.2),
      ),
      child: DefaultPadding(
        vertical: 20,
        child: GetBuilder<DashboardController>(builder: (dashboardController) {
          return ListView(
            children: const [
              DashHeader(),
            ],
          );
        }),
      ),
    );
  }
}

class DashHeader extends GetView<DashboardController> {
  const DashHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(DateTimeController());
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(21),
      child: Stack(
        fit: StackFit.loose,
        children: [
          Positioned(
              left: 100,
              top: -200,
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Get.theme.colorScheme.primary,
                      Colors.deepPurple
                    ]),
                    shape: BoxShape.circle),
              )),
          Positioned(
              right: 100,
              top: 20,
              child: Container(
                height: 600,
                width: 600,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Get.theme.colorScheme.primary,
                      Get.theme.colorScheme.tertiary
                    ]),
                    shape: BoxShape.circle),
              )),
          const BlureFilter(sigmaX: 50, sigmaY: 50),
          Container(
            decoration: BoxDecoration(
                color: Get.theme.canvasColor.withValues(alpha:0.5),
                borderRadius: BorderRadius.circular(20)),
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500, mainAxisExtent: 250),
              children: [
                Card(
                  shadowColor: Colors.transparent,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Get.theme.cardColor.withValues(alpha:0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      alignment: WrapAlignment.spaceAround,
                      direction: Axis.vertical,
                      children: [
                        Icon(
                          Icons.person,
                          size: 80,
                          color: Get.theme.colorScheme.primary,
                        ),
                        Text(
                            " ${controller.konoozeServices.sharedPrefrences.getString("userName")}",
                            style: Get.textTheme.headlineSmall),
                        ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text("اضافة مدخلات")),
                      ],
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Get.theme.cardColor.withValues(alpha:0.5),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Positioned(
                        child: Text(
                            "مرحباً ${controller.konoozeServices.sharedPrefrences.getString("userName")}",
                            style: Get.textTheme.headlineSmall),
                      )
                    ],
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Get.theme.cardColor.withValues(alpha:0.5),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Positioned(
                        child: Text(
                            "مرحباً ${controller.konoozeServices.sharedPrefrences.getString("userName")}",
                            style: Get.textTheme.headlineSmall),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
