import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/clients/clients_controller.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/functions/shared_functions.dart';
import 'package:konooze_system/model/home/client_model.dart';

class ClientsLandscapeCard extends GetView<ClientsController> {
  const ClientsLandscapeCard({super.key, required this.client});
  final Client client;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context)
    //     .textTheme
    //     .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Card(
      elevation: 6,
      clipBehavior: Clip.antiAlias,
  
      child: Stack(
        
        alignment: Alignment.centerRight,
        children: [
          // const BlureFilter(sigmaX: 20, sigmaY: 20),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomRight: Radius.circular(20)),
                  color: Get.theme.primaryColor.withValues(alpha:0.05)),
              padding: const EdgeInsets.all(5.0).copyWith(right: 20),
              child: Text(
                client.agentName.split(" ").first,
                style: Get.theme.textTheme.labelMedium,
              ),
            ),
          ),
          InkWell(onTap: () {}),
          Positioned(
              right: 0,
              child: Row(
                children: [
                  ClipRRect(
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${ApiLinks.clientImageLink}/${client.imageUrl}",
                           placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      filterQuality: FilterQuality.medium,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    // spacing: 5,
                    direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(client.company,
                            style: Get.theme.textTheme.labelLarge),
                      ),
                      const Divider(height: 5),
                      InkWell(
                        onTap: () => copyFiled(
                            title: "تم نسخ ايميل ${client.clientName}",
                            message: client.email),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.email_rounded,
                                color: Get.theme.colorScheme.primary,
                                size: 15.0,
                              ),
                            ),
                            Text(
                              client.email,
                              style: Get.theme.textTheme.bodySmall!.copyWith(
                                color: Get.theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 5),
                      InkWell(
                        onTap: () => copyFiled(
                            title: "تم نسخ رقم جوال ${client.clientName}",
                            message: client.mobile),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                Icons.phone,
                                color: Get.theme.colorScheme.primary,
                                size: 15.0,
                              ),
                            ),
                            Text(client.mobile,
                                style: Get.theme.textTheme.bodySmall!.copyWith(
                                    color: Get.theme.colorScheme.primary)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )),
          // InkWell(onTap: () {}),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: IconButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              icon: Icon(
                Icons.contactless_rounded,
                color: client.shared == "yes"
                    ? const Color.fromARGB(255, 76, 175, 125)
                    : Colors.grey,
              ),
              iconSize: 20.0,
              color: Get.theme.colorScheme.primary,
              onPressed: () {},
            ),
          ),
          Positioned(
            left: 0.0,
            child: PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.add_task_rounded),
                      VerticalDivider(),
                      Text("تقرير"),
                    ],
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.edit),
                      VerticalDivider(),
                      Text("تعديل"),
                    ],
                  ),
                  onTap: () {
                    controller.editClientCard(client: client);
                  },
                ),
                PopupMenuItem(
                  child: const Row(
                    children: [
                      Icon(Icons.cancel_rounded),
                      VerticalDivider(),
                      Text("الغاء"),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
              icon: const Icon(Icons.menu_open_rounded),
              // iconSize: 20.0,
              iconColor: Get.theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
