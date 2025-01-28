import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:konooze_system/controllers/home/clients/clients_controller.dart';
import 'package:konooze_system/controllers/home/time.dart';
import 'package:konooze_system/core/classes/data_view_hander.dart';
import 'package:konooze_system/core/constants/padding.dart';
// import 'package:konooze_system/model/home/client_model.dart';
import 'package:konooze_system/views/components/client_landscape_card.dart';
import 'package:konooze_system/views/screens/home/clients/components/add_clients.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ClientsController());

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("العملاء"),
      ),
      body: GetBuilder<ClientsController>(builder: (controller) {
        // print("updated now ${controller.clients.length}");
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.theme.colorScheme.primary.withValues(alpha:0.2),
          ),
          child: DefaultPadding(
            vertical: 20,
            child: DataRequestHandler(
                statusRequest: controller.statusRequest,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const ClientHeader(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.clients.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 100,
                            maxCrossAxisExtent: 550,
                          ),
                          itemBuilder: (context, index) => ClientsLandscapeCard(
                            client: controller.clients[index],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
       
            Get.dialog(
              Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AddClientDialog()),
              ),
            );
          },
          label: const Text("اضافة عميل"),
          icon: const Icon(Icons.add)),
    );
  }
}

class ClientHeader extends GetView<ClientsController> {
  const ClientHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dateTimeController = Get.find<DateTimeController>();
    return Card(
      color: Colors.transparent,
      elevation: 6,
      clipBehavior: Clip.antiAlias,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.centerRight,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blueAccent,
            Colors.blue.shade900,
          ]),
        ),
        child: Wrap(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "مرحباً ${controller.konoozeServices.sharedPrefrences.getString("userName")}",
                          style: Get.textTheme.headlineMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "لقد قمت ب اضافة ${controller.clients.length} عملاء لهذا الشهر ",
                            style: Get.textTheme.titleSmall
                                ?.copyWith(color: Colors.white),
                            softWrap: true,
                          ),
                        ),
                        Wrap(
                          alignment: WrapAlignment.spaceEvenly,
                          children: [
                            // SizedBox(height: 80),
                            FittedBox(
                              child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.add,
                                    size: 40,
                                  ),
                                  onPressed: () {},
                                  label: const Text("اضف تقرير")),
                            )
                          ],
                        ),
                        Obx(() => Text(
                              " ${DateFormat('dd-MM-yyyy hh:mm a').format(dateTimeController.currentDate.value)}",
                              style: Get.textTheme.bodyLarge
                                  ?.copyWith(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                )),
            // const Divider(color: Colors.white),

            // Card(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(40)),
            //   clipBehavior: Clip.antiAlias,
            //   child: Container(
            //       width: 200, height: 180, child: Text("7")),
            // ),
          ],
        ),
      ),
    );
  }
}




/*
 Wrap(
        direction: Axis.horizontal,
        children: [
          ...List.generate(
            controller.clients.length,
            (index) => ListTile(
              title: Text(controller.clients[index].company),
            ),
          ),
        ],
      ),

 */