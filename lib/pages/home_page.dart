import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';
import 'package:property_app/widgets/item_menu.dart';
import 'package:property_app/widgets/item_order.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:easy_stepper/easy_stepper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final itemController = PageController();

  int currentStep = 0;

  int myOrder = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 25,
        ),
        header(context),
        const SizedBox(
          height: 25,
        ),
        banner(),
        const SizedBox(
          height: 25,
        ),
        if (myOrder == 0) ...[
          notOrder(),
        ] else ...[
          order(),
          const SizedBox(
            height: 30,
          ),
          menu(),
        ],
        const SizedBox(
          height: 60,
        ),
      ],
    );
  }

  Widget notOrder() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesanan Terbaru',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Daftar pesanan terbaru anda',
                    style: TextStyle(
                        color: AppColor.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        Center(
            child: Column(
          children: [
            Image.asset(
              'assets/images/notorder.png',
              width: 320,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Pesanan Kosong',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondary),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              'Ayo tambahkan pesanan baru',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: AppColor.grey),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 211,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    myOrder = 1;
                  });
                },
                style: TextButton.styleFrom(
                    backgroundColor: AppColor.secondary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(39))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/srch.png',
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Eksplor Properti',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Temukan\nHunian Impian',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'Agen Properti Terbaik',
                style: TextStyle(
                    color: AppColor.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Spacer(),
          Badge(
              largeSize: 19,
              alignment: const Alignment(1.3, -1.1),
              backgroundColor: AppColor.red,
              label: const Padding(
                padding: EdgeInsets.all(2),
                child: Text('3'),
              ),
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: Image.asset(
                    'assets/icons/bell.png',
                    fit: BoxFit.cover,
                    width: 18,
                    height: 21,
                  )))
        ],
      ),
    );
  }

  Widget banner() {
    List<Map> imgList = [
      {'asset': 'assets/images/banner.png', 'link': '/'},
      {'asset': 'assets/images/banner.png', 'link': '/'},
      {'asset': 'assets/images/banner.png', 'link': '/'},
      {'asset': 'assets/images/banner.png', 'link': '/'},
    ];

    return SizedBox(
      height: 125,
      width: 250,
      child: ListView(
        padding: const EdgeInsets.only(left: 25),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: imgList.map((item) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => item['link'],
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    item['asset'],
                    fit: BoxFit.fitWidth,
                  )),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget order() {
    String exp = '8';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pesanan Terbaru',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Daftar pesanan terbaru anda',
                    style: TextStyle(
                        color: AppColor.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Image.asset(
                'assets/icons/out.png',
                width: 15,
                height: 8,
                color: AppColor.secondary,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              width: double.infinity,
              height: 70,
              child: EasyStepper(
                activeStep: currentStep,
                lineStyle: const LineStyle(
                    lineLength: 68,
                    lineType: LineType.normal,
                    lineThickness: 1.5,
                    lineSpace: 0,
                    lineWidth: 10,
                    unreachedLineType: LineType.dashed,
                    activeLineColor: Colors.grey,
                    defaultLineColor: Colors.grey,
                    finishedLineColor: AppColor.secondary),
                activeStepBorderColor: Colors.grey,
                stepShape: StepShape.circle,
                borderThickness: 1,
                activeStepBorderType: BorderType.normal,
                padding: const EdgeInsets.only(
                  right: 40,
                  left: 15,
                  bottom: 12,
                  top: 18,
                ),
                stepRadius: 8,
                showStepBorder: false,
                finishedStepTextColor: AppColor.secondary,
                finishedStepBackgroundColor: Colors.white,
                activeStepIconColor: AppColor.secondary,
                activeStepBackgroundColor: Colors.white,
                activeStepTextColor: AppColor.secondary,
                unreachedStepIconColor: Colors.grey,
                unreachedStepTextColor: Colors.grey,
                unreachedStepBackgroundColor: Colors.white,
                showLoadingAnimation: false,
                steps: [
                  EasyStep(
                      customStep: Image.asset(
                        currentStep == 0
                            ? 'assets/icons/time.png'
                            : currentStep >= 0
                                ? 'assets/icons/check.png'
                                : 'assets/icons/circle.png',
                        color: currentStep == 0 || currentStep >= 0
                            ? AppColor.secondary
                            : Colors.grey,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Pemesanan',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 10,
                              color: currentStep == 0 || currentStep >= 0
                                  ? AppColor.secondary
                                  : Colors.grey),
                        ),
                      )),
                  EasyStep(
                      customStep: Image.asset(
                        currentStep == 1
                            ? 'assets/icons/time.png'
                            : currentStep >= 1
                                ? 'assets/icons/check.png'
                                : 'assets/icons/circle.png',
                        color: currentStep == 1 || currentStep >= 1
                            ? AppColor.secondary
                            : Colors.grey,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Administrasi',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 10,
                              color: currentStep == 1 || currentStep >= 1
                                  ? AppColor.secondary
                                  : Colors.grey),
                        ),
                      )),
                  EasyStep(
                      customStep: Image.asset(
                        currentStep == 2
                            ? 'assets/icons/time.png'
                            : currentStep >= 2
                                ? 'assets/icons/check.png'
                                : 'assets/icons/circle.png',
                        color: currentStep == 2 || currentStep >= 2
                            ? AppColor.secondary
                            : Colors.grey,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Pembangunan',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 10,
                              color: currentStep == 2 || currentStep >= 2
                                  ? AppColor.secondary
                                  : Colors.grey),
                        ),
                      )),
                  EasyStep(
                      customStep: Image.asset(
                        currentStep == 3
                            ? 'assets/icons/time.png'
                            : currentStep >= 3
                                ? 'assets/icons/check.png'
                                : 'assets/icons/circle.png',
                        color: currentStep == 3 || currentStep >= 3
                            ? AppColor.secondary
                            : Colors.grey,
                      ),
                      customTitle: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          'Serah Terima',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 10,
                              color: currentStep == 3 || currentStep >= 3
                                  ? AppColor.secondary
                                  : Colors.grey),
                        ),
                      )),
                  EasyStep(
                      customStep: Image.asset(
                        'assets/icons/circle.png',
                        color: Colors.transparent,
                      ),
                      customTitle: const Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          'Serah',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 10, color: Colors.transparent),
                        ),
                      )),
                ],
                onStepReached: (index) => setState(() => currentStep = index),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AspectRatio(
            aspectRatio: 1.7,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: itemController,
              physics: const BouncingScrollPhysics(),
              children: [
                ItemOrder(
                  code: '#6578897JHJJ7',
                  img: 'assets/images/kav2.png',
                  name: 'Candra Bhirawa',
                  address: 'Lotus, Kavling A1, Blok B No. 4',
                  date: '25/11/2022, 09:00',
                  price: '850.000.000',
                  exp: exp,
                  penalty: '11.400.000',
                ),
                const ItemOrder(
                    code: '#6578897JHJJ7',
                    img: 'assets/images/kav1.jpeg',
                    name: 'Candra Bhirawa',
                    address: 'Lotus, Kavling A1, Blok B No. 4',
                    date: '25/11/2022, 09:00',
                    price: '850.000.000'),
                ItemOrder(
                  code: '#6578897JHJJ7',
                  img: 'assets/images/kav1.jpeg',
                  name: 'Candra Bhirawa',
                  address: 'Lotus, Kavling A1, Blok B No. 4',
                  date: '25/11/2022, 09:00',
                  price: '850.000.000',
                  exp: exp,
                  penalty: '3.400.000',
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: itemController,
            count: 3,
            effect: WormEffect(
                dotColor: Colors.grey[300]!,
                activeDotColor: AppColor.secondary,
                dotHeight: 4,
                dotWidth: 15),
          ),
        ],
      ),
    );
  }

  Widget menu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.secondary),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Daftar menu transaksi',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: AppColor.grey),
                  ),
                ],
              ),
              Image.asset(
                'assets/icons/category.png',
                height: 24,
                width: 24,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 175,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: ItemMenu(
                    title: 'Pemesanan',
                    img: 'assets/images/home.png',
                    percen: '100',
                    progress: 100,
                    finish: 10,
                    imgPositionR: 1,
                    imgPositionB: 0,
                    imgWidht: 90,
                    imgHeight: 95,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ItemMenu(
                    title: 'Administrasi',
                    img: 'assets/images/admin.png',
                    percen: '40',
                    progress: 40,
                    finish: 0,
                    imgPositionR: -10,
                    imgPositionB: 0,
                    imgWidht: 90,
                    imgHeight: 120,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            width: double.infinity,
            height: 175,
            child: Row(
              children: [
                Expanded(
                  child: ItemMenu(
                    title: 'Pembangunan',
                    img: 'assets/images/building.png',
                    percen: '30',
                    progress: 30,
                    finish: 0,
                    imgPositionR: -50,
                    imgPositionB: 0,
                    imgWidht: 125,
                    imgHeight: 120,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ItemMenu(
                    title: 'Akad & Serah Terima',
                    img: 'assets/images/accepted.png',
                    percen: '10',
                    progress: 10,
                    finish: 0,
                    imgPositionR: -15,
                    imgPositionB: -30,
                    imgWidht: 100,
                    imgHeight: 130,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
