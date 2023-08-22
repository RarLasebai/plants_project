import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/g1.png"),
        const Padding(
          padding: EdgeInsets.only(top: 25, bottom: 8, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Delivery Amount", 16, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 18, fontWeight: FontWeight.bold)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Total Amount", 18, fontWeight: FontWeight.bold),
                  TxtStyle("20.20", 20, fontWeight: FontWeight.bold)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Location", 16, fontWeight: FontWeight.bold),
                  TxtStyle("location", 16, fontWeight: FontWeight.bold)
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TxtStyle("Phone", 16, fontWeight: FontWeight.bold),
                  TxtStyle("20202020", 16, fontWeight: FontWeight.bold)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
