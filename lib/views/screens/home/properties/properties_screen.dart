import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/properties_controller.dart';
import 'package:konooze_system/core/classes/data_view_hander.dart';
import 'package:konooze_system/core/constants/padding.dart';
import 'package:konooze_system/views/components/project_landscape_card.dart';

class PropertiesScreen extends StatelessWidget {
  const PropertiesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());
    return GetBuilder<PropertiesController>(builder: (propertiesController) {
      return DefaultPadding(
        child: DataRequestHandler(
          statusRequest: propertiesController.statusRequest,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("المشاريع"),
            ),
            body: MasonryGridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  const SliverSimpleGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
              ),
              itemCount: propertiesController.proprties.length,
              itemBuilder: (BuildContext context, int index) {
                return ProjectLandscapeCard(
                  property: propertiesController.proprties[index],
                );
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("اضف مشروع"),
              icon: const Icon(Icons.add),
            ),
          ),
        ),
      );
    });
  }
}
