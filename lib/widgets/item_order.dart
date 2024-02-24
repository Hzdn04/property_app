import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';

class ItemOrder extends StatelessWidget {
  const ItemOrder(
      {super.key,
      required this.code,
      required this.img,
      required this.name,
      required this.address,
      required this.date,
      required this.price,
      this.penalty = '',
      this.exp = ''});

  final String code;
  final String img;
  final String name;
  final String address;
  final String date;
  final String price;
  final String penalty;
  final String exp;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  code,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
                const Badge(
                  largeSize: 20,
                  backgroundColor: AppColor.primary,
                  label: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Komersil',
                        style: TextStyle(
                          letterSpacing: 1,
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    img,
                    width: 100,
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/house.png',
                              width: 14, height: 14, color: AppColor.secondary),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              name,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/location.png',
                              width: 14, height: 14, color: AppColor.secondary),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Text(
                              address,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/icons/calen.png',
                              width: 14, height: 14, color: AppColor.secondary),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            date,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Row(
                          children: [
                            const Text(
                              'Rp ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: AppColor.secondary),
                            ),
                            Text(
                              price,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.secondary),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: penalty == '' && exp == '' ? 0 : 10,
            ),
            penalty == '' && exp == ''
                ? const SizedBox()
                : Column(
                    children: [
                      const DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 10,
                        dashColor: Colors.black,
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/dolar.png',
                                width: 14,
                                height: 14,
                                color: AppColor.secondary,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Row(
                                children: [
                                  const Text('Denda Rp ',
                                      style: TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  Text(penalty,
                                      style: const TextStyle(
                                        color: AppColor.secondary,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      )),
                                ],
                              ),
                            ],
                          ),
                          Badge(
                            backgroundColor: AppColor.secondary,
                            largeSize: 20,
                            label: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.warning_rounded,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text('Terlambat $exp hari',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        letterSpacing: 0,
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          ]),
    );
  }
}
