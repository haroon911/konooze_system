import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/model/home/properties/properties.dart';
import 'package:konooze_system/views/components/auth/shared/blur_effect.dart';

class ProjectLandscapeCard extends StatelessWidget {
  const ProjectLandscapeCard({super.key, required this.property});
    final Property property;


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "${ApiLinks.propertyImageLink}/${property.images.first}"),
                fit: BoxFit.cover,
                opacity: 0.2,
                
                // colorFilter: ColorFilter.mode(
                //     Get.theme.colorScheme.primary.withValues(alpha: 0.1),
                //     BlendMode.srcOver),
              ),
            ),

            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => Get.toNamed(AppRoutes.propertyDetails,
                  arguments: {"property": property}),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    const BlureFilter(sigmaX: 100, sigmaY: 100  , height: 1 ,width: 1,),
                  Hero(
                    tag:
                        "image${property.id}no${property.images.indexOf(property.images.first)}",
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18
                          )),
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      child: CachedNetworkImage(
                          filterQuality: FilterQuality.medium,
                          imageUrl:
                              "${ApiLinks.propertyImageLink}/${property.images.first}"),
                    ),
                  ),
                     Container(
                    padding:  const EdgeInsets.only(top: 5 , left: 10 , right: 10 ,bottom: 5),
                    child: Text(
                      property.name,
                      style: Get.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20 , left: 10 , right: 10),
                    child: Text(
                      property.details,
                      style: Get.textTheme.labelSmall!.copyWith(fontWeight: FontWeight.w500 ,letterSpacing: 0 , color: Get.theme.colorScheme.primary ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),],);
  }
}



/*
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
*/


/*

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/model/home/properties/properties.dart';
import 'package:konooze_system/views/components/custome_ship.dart';
import 'dart:ui';
import 'package:palette_generator/palette_generator.dart';

class ProjectLandscapeCard extends StatelessWidget {
  const ProjectLandscapeCard({super.key, required this.property});
  final Property property;

  Future<Color> _getDominantColor(String imageUrl) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(imageUrl),
    );
    return paletteGenerator.dominantColor?.color ?? Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color>(
      future: _getDominantColor("${ApiLinks.propertyImageLink}/${property.images.first}"),
      builder: (context, snapshot) {
        final cardColor = snapshot.data ?? Get.theme.colorScheme.primaryFixed.withOpacity(0.1);
        return Stack(
          children: [
            Card(
              color: Colors.transparent,
              elevation: 0,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: cardColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1.5,
                      ),
                    ),
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
                ),
              ),
            ),
            CustomChip(label: property.status),
          ],
        );
      },
    );
  }
}


 */

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