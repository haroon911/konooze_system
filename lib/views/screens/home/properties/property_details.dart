import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/property_details_controller.dart';
import 'package:konooze_system/controllers/home/units_controller.dart';
import 'package:konooze_system/core/classes/data_view_hander.dart';
import 'package:konooze_system/core/constants/api_links.dart';
import 'package:konooze_system/core/constants/responsive.dart';
import 'package:konooze_system/views/components/card_button.dart';
import 'package:konooze_system/views/components/custome_ship.dart';
import 'package:konooze_system/views/screens/home/properties/property_units.dart';

class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyDetailsController propertyDetailsController =
        Get.put(PropertyDetailsController());
    Get.put(UnitsController());

    return Scaffold(
      appBar: AppBar(
        title: Text(propertyDetailsController.property.name),
      ),
      body: GetBuilder<PropertyDetailsController>(builder: (controller) {
        return DataRequestHandler(
          statusRequest: controller.statusRequest,
          child: Center(
            heightFactor: 1,
            child: SingleChildScrollView(
              child: SizedBox(
                width: Responsive.maxWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: const EdgeInsets.symmetric(vertical: 10),
                    //   child: AppBar(
                    //     elevation: 1,
                    //     title: Text(controller.property.name),
                    //   ),
                    // ),
                    const PropertyImagesSlider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: 5,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0)
                                    .copyWith(right: 0),
                                child: Text(controller.property.name,
                                    style: Get.textTheme.headlineMedium!),
                              ),
                              CustomChip(
                                label: controller.property.status,
                              ),
                              CustomChip(
                                label: controller.property.typeAr,
                                icon: Icons.category_rounded,
                              ),
                            ],
                          ),
                          Text(
                            controller.property.details,
                            style: Get.textTheme.labelLarge,
                            softWrap: true,
                          ),
                          const Divider(height: 60),
                          const UnitsInfo()
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: PropertyUnits(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class UnitsInfo extends StatelessWidget {
  const UnitsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitsController>(builder: (controller) {
      return Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          // ...List.generate(
          //   controller.units.length,
          //   (index) => CardButton(
          //     title: controller.units[index].name,
          //     content: controller.units[index].status,
          //     icon: Icons.store_rounded,
          //     backgroundColor: controller.units[index].status == "leased" ||
          //             controller.units[index].status == "sold"
          //         ? Colors.green.shade300
          //         : Colors.red.shade300,
          //   ),
          // ),
          CardButton(
              title: "${controller.units.fold(
                0,
                (previousValue, element) =>
                    element.status == "leased" || element.status == "sold"
                        ? ++previousValue
                        : previousValue,
              )}",
              content: "المؤجرة",
              icon: Icons.store_rounded,
              backgroundColor: Colors.green.shade300),
          CardButton(
            title: "${controller.units.fold(
              0,
              (previousValue, element) => element.status == "available"
                  ? ++previousValue
                  : previousValue,
            )}",
            content: "الغير مؤجرة",
            icon: Icons.store_rounded,
            backgroundColor: Colors.red.shade300,
          ),
        ],
      );
    });
  }
}

class PropertyImagesSlider extends GetView<PropertyDetailsController> {
  const PropertyImagesSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller.imageController,
          itemCount: controller.property.images.length,
          itemBuilder: (context, index, realIndex) => Hero(
            tag: "image${controller.property.id}no$index",
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:
                    "${ApiLinks.propertyImageLink}/${controller.property.images[index]}",
              ),
            ),
          ),
          options: CarouselOptions(
            animateToClosest: true,

            aspectRatio: 1.6,
            // viewportFraction: 1.1,
            clipBehavior: Clip.antiAlias,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 1.1,
            viewportFraction: 1,
            // onPageChanged: (index, reason) {
            //   controller.onImageControllerChanged(index);
            // },
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
          ),
        ),
      ],
    );
  }
}

/* 

// ---------------- Thmubnails

class ThumbnailImageSilder extends StatelessWidget {
  const ThumbnailImageSilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width / 1.5,
      child: CarouselSlider.builder(
        carouselController: controller.thumbnailImageController,
        itemCount: controller.product.images.length,
        itemBuilder: (context, index, realIndex) => GestureDetector(
          onTap: () {
            controller.onImageControllerChanged(index);
          },
          child: Opacity(
            opacity: controller.currentPage == index ? 0.95 : 0.6,
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "${ApiLinks.productImages}/${controller.product.images[index]}",
                height: 50,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          // aspectRatio: 0.5,
          viewportFraction: 0.3,
          initialPage: 0,
          reverse: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {
            controller.onthumbnailImageControllerChanged(index);
          },
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
      ),
    );
  }
}

*/
