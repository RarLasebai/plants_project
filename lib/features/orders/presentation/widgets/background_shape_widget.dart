import 'package:flutter/material.dart';
import 'package:plants_project/core/utils/widgets/txt_style.dart';
import 'package:plants_project/features/orders/presentation/widgets/bill_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/item_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/make_order_widget.dart';
import 'package:plants_project/features/orders/presentation/widgets/buy_now_widget.dart';

class BackGroundShapeWidget extends StatelessWidget {
  final bool isMakeOrder, isBuyNow;
  const BackGroundShapeWidget(
      {super.key, this.isMakeOrder = false, this.isBuyNow = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(24.r),
              // bottomRight: Radius.circular(24.r)),
              // border: Border.all(color: Colors.black),
              // image: DecorationImage(
              //   image: AssetImage("assets/images/shape1.png"),
              //   fit: BoxFit.fill,
              // )),
              gradient: LinearGradient(
                  end: Alignment.topCenter,
                  begin: Alignment.bottomCenter,
                  colors: [
                Color(0xffA5CBFF),
                Color(0xffDCEBFE),
                Colors.white,
              ])),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 70.0, left: 24, right: 24, bottom: 43),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const ItemWidget();
                      }),
                  //total
                  isMakeOrder
                      ? const MakeOrderWidget()
                      : isBuyNow
                          ? const BuyNowWidget()
                          : const BillWidget()
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          right: 175,
          left: 175,
          child: Divider(
            color: Colors.black,
            thickness: 4,
          ),
        ),
        const Positioned(
            left: 25,
            top: 31,
            child: TxtStyle("Order Details", 24, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
