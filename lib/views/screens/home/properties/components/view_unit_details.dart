// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:konooze_system/model/home/properties/units.dart';

class ViewUnitDetails extends StatelessWidget {
  const ViewUnitDetails({
    super.key,
    required this.unit,
  });
  final PropertyUnit unit;
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: SizedBox(
        width: 400,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("تفاصيل الوحدة المؤجرة"),
            ],
          ),
        ),
      ),
    );
  }
}
