import 'dart:io';

// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konooze_system/controllers/home/clients/clients_controller.dart';
import 'package:konooze_system/core/util/utils.dart';
import 'package:konooze_system/views/components/input_filed.dart';

class AddClientDialog extends StatelessWidget {
  AddClientDialog({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils();
    return GetBuilder<ClientsController>(builder: (controller) {
      return SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "أضافة عميل",
                        style: Get.textTheme.titleMedium,
                      ),
                      const VerticalDivider(width: 100),
                      SizedBox(
                        width: 100,
                        child: CheckboxListTile(
                          value: controller.isShared,
                          onChanged: (value) =>
                              controller.changeSharing(value!),
                          title: const Text("مشاركة"),
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                  CustomInputField(
                    validator: (value) => utils.textInputValidator(value!),
                    labelText: "اسم الشركة",
                    hintText: "شركة",
                    controller: controller.company,
                  ),
                  CustomInputField(
                      validator: (value) => utils.textInputValidator(value!),
                      controller: controller.brand,
                      labelText: "اسم البراند",
                      hintText: "براند"),
                  CustomInputField(
                    labelText: "نوع النشاط",
                    validator: (value) => utils.textInputValidator(value!),
                    hintText: "النشاط",
                    controller: controller.type,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: SizedBox(
                      width: 400,
                      child: Text(
                        "معلومات التواصل",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  CustomInputField(
                      controller: controller.clientName,
                      validator: (value) => utils.textInputValidator(value!),
                      keyboardType: TextInputType.name,
                      labelText: "اسم العميل",
                      hintText: "الاسم"),
                  CustomInputField(
                      controller: controller.mobile,
                      validator: (value) => utils.phoneInputValidator(value!),
                      keyboardType: TextInputType.phone,
                      labelText: "رقم الجوال",
                      hintText: "05#######"),
                  CustomInputField(
                      controller: controller.email,
                      validator: (value) => utils.emailInputValidator(value!),
                      keyboardType: TextInputType.emailAddress,
                      labelText: "الأيميل",
                      hintText: "email@example.com"),
                  CustomInputField(
                    controller: controller.details,
                    validator: (value) => utils.textInputValidator(value!),
                    keyboardType: TextInputType.multiline,
                    labelText: "تفاصيل",
                    hintText: "تفاصيل اضافية عن العميل",
                    // maxlines: 2,
                  ),
                  Obx(() => controller.selectedImagePath.value == ''
                      ? const Text(
                          'لم يتم اختيار صورة',
                        )
                      : SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.file(
                              fit: BoxFit.cover,
                              File(controller.selectedImagePath.value)))),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.pickImage();
                    },
                    child: const Text('قم بتحميل الصورة'),
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Get.back();
                            controller.disposeAddClient();
                          },
                          label: const Text("الغاء"),
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Get.theme.colorScheme.errorContainer)),
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            if (formKey.currentState != null &&
                                formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              controller.addClients();
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Get.theme.colorScheme.primaryFixed)),
                          label: const Text("تأكيد"),
                          icon: const Icon(Icons.check_rounded),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
