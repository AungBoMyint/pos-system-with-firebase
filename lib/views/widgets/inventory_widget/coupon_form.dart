import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:pos_system/controller/sales_controller.dart';

class CouponFormWidget extends StatelessWidget {
  const CouponFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SalesController _saleController = Get.find();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      child: Column(
        children: [
          TextFormField(
            controller: _saleController.discountContentController,
            maxLines: 1,
            decoration: const InputDecoration(hintText: "Coupon Content"),
          ),
          TextFormField(
            controller: _saleController.couponCodeController,
            maxLines: 1,
            decoration: const InputDecoration(hintText: "Code"),
          ),
          TextFormField(
            controller: _saleController.percentageController,
            maxLines: 1,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Discount percentage"),
          ),
          //StartDate and EndDate
          Row(
            children: [
              //StartDate
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: -12.0,
                      blurRadius: 12.0,
                    ),
                  ],
                ),
                child: Text(
                    "${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}"),
              ),
              const SizedBox(width: 15),
              //EndDate
              Obx(
                () => InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                      //print('change $date');
                    }, onConfirm: (date) {
                      _saleController.changeExpireDate(date);
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: -12.0,
                          blurRadius: 12.0,
                        ),
                      ],
                    ),
                    child: Text(
                        "${_saleController.expireDate.value!.year}/${_saleController.expireDate.value!.month}/${_saleController.expireDate.value!.day}"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
