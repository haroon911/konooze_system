import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konooze_system/core/classes/status_request.dart';
import 'package:konooze_system/core/constants/app_routes_names.dart';
import 'package:konooze_system/core/functions/data_handler_controller.dart';
import 'package:konooze_system/core/services/services.dart';
import 'package:konooze_system/core/util/utils.dart';
import 'package:konooze_system/data/dynamic/clients/add_client_data.dart';
import 'package:konooze_system/data/dynamic/clients/edit_client_data.dart';
import 'package:konooze_system/data/dynamic/clients/view_clients.dart';
import 'package:konooze_system/model/home/client_model.dart';
import 'package:konooze_system/views/screens/home/clients/components/edit_clients.dart';

class ClientsController extends GetxController {
  TextEditingController clientId = TextEditingController();
  TextEditingController imageName = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController clientName = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  KonoozeServices konoozeServices = Get.find();
  late StatusRequest statusRequest;
  ClientsData clientsData = ClientsData(Get.find());
  AddClientData addClientData = AddClientData(Get.find());
  EditClientData editClientData = EditClientData(Get.find());
  List<Client> clients = [];
  File? file;
  bool isShared = true;
  String shared = "yes";
  changeSharing(bool status) {
    if (status) {
      isShared = true;
      shared = "yes";
    } else {
      isShared = false;
      shared = "no";
    }
    update();
  }

  // client data table
  final List<String> _columnsText = [
    "الاسم",
    "الشركة",
    "البراند",
    "النشاط",
    "جوال",
    "الايميل",
    "تفاصيل"
  ];
  late List<DataColumn> dataColumn;

  List<DataRow> getRows() => clients.map(
        (Client client) {
          final cells = [
            client.clientName,
            client.company,
            client.brand,
            client.type,
            client.mobile,
            client.email,
            client.details
          ];
          return DataRow(
              cells: Utils.modelBuilder(
            cells,
            (index, cell) => DataCell(Text(cell)),
          ));
        },
      ).toList();
  //edit client
  editClientCard({required Client client}) {
    // print("edit pressed 2");
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
            child: EditClientDialog()),
      ),
    ).then(
      (value) {
        disposeAddClient();
      },
    );
    disposeAddClient();
    clientId.text = client.id.toString();
    company.text = client.company;
    brand.text = client.brand;
    type.text = client.type;
    clientName.text = client.clientName;
    details.text = client.details;
    mobile.text = client.mobile;
    email.text = client.email;
    imageName.text = client.imageUrl;
  }

  submitEdit() async {
    var response = await editClientData.editData(
        clientName: clientName.text,
        imageName: imageName.text,
        id: clientId.text,
        brand: brand.text,
        company: company.text,
        details: details.text,
        email: email.text,
        mobile: mobile.text,
        type: type.text,
        file: file);
    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        Get.back();
        Get.snackbar('كنوز المتميزة', 'تم تعديل العميل بنجاح',
            margin: const EdgeInsets.all(20));
        await getData();
      }
    }
  }

// end of edit client
  void disposeAddClient() {
    imageName.clear();
    clientId.clear();
    company.clear();
    brand.clear();
    type.clear();
    mobile.clear();
    clientName.clear();
    details.clear();
    email.clear();
    file = null;
    selectedImagePath = ''.obs;
    update();
  }

  getData() async {
    clients = [];
    statusRequest = StatusRequest.loading;
    var response = await clientsData.getAllData();
    statusRequest = dataHandler(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        response["data"].forEach((value) {
          clients.add(Client.fromJson(value));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  addClients() async {
    // statusRequest = StatusRequest.loading;
    var response = await addClientData.addData(
        brand: brand.text,
        clientName: clientName.text,
        company: company.text,
        details: details.text,
        email: email.text,
        mobile: mobile.text,
        type: type.text,
        file: file);
    if (statusRequest == StatusRequest.success) {
      if (response['status']) {
        Get.back();
        Get.snackbar('كنوز المتميزة', 'تم اضافة العميل بنجاح',
            margin: const EdgeInsets.all(20));
        await getData();
      }
    }
  }

  @override
  void onInit() {
    getData();
    dataColumn = _columnsText
        .map(
          (String column) => DataColumn(
            label: Text(
              column,
              overflow: TextOverflow.fade,
              softWrap: true,
            ),
          ),
        )
        .toList();
    super.onInit();
  }

  void onAddClientPressed() {
    Get.toNamed(AppRoutes.addClients);
  }

  //image handeling
  final ImagePicker _picker = ImagePicker();
  var selectedImagePath = ''.obs;
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImagePath.value = image.path;
      file = File(selectedImagePath.value);
    }
  }
}
