import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/model/home/properties/properties.dart';
import 'package:konooze_system/views/components/custome_ship.dart';

class ProjectLandscapeCard extends StatelessWidget {
  const ProjectLandscapeCard({super.key, required this.property});
  final Property property;
  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context)
    //     .textTheme
    //     .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Stack(
      children: [
        Card(
          color: Get.theme.colorScheme.primaryFixed.withAlpha(100),
          elevation: 0,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => Get.toNamed(AppRoutes.propertyDetails,
                arguments: {"property": property}),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag:
                      "image${property.id}no${property.images.indexOf(property.images.first)}",
                  child: Card(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    elevation: 0,
                    clipBehavior: Clip.antiAlias,
                    child: CachedNetworkImage(
                        filterQuality: FilterQuality.medium,
                        imageUrl:
                            "${ApiLinks.propertyImageLink}/${property.images.first}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2, bottom: 10, right: 10),
                  child: Text(
                    property.name,
                    style: Get.textTheme.labelLarge,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomChip(label: property.status),
      ],
    );
  }
}


// printing(params) {
//   debugPrint("$params");
//   return Container();
// }
/*

 Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.name,
                      style: Get.textTheme.labelLarge,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    const Divider(color: Colors.transparent),
                    Wrap(
                      spacing: 5,
                      children: [
                        CustomChip(
                            label: property.status,
                            icon: Icons.add_home_rounded),
                        CustomChip(
                            label: property.createdDate.year.toString(),
                            icon: Icons.data_saver_on_rounded),
                      ],
                    ),
                    Text(
                      property.details,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
              )
            ],
          ),

 */