import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';
import 'package:property_app/models/chart_data.dart';
import 'package:property_app/widgets/item_status.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ItemMenu extends StatefulWidget {
  const ItemMenu({
    super.key,
    required this.title,
    required this.img,
    required this.percen,
    required this.progress,
    required this.finish,
    required this.imgPositionR,
    required this.imgPositionB,
    required this.imgWidht,
    required this.imgHeight,
  });

  final String title;
  final String img;
  final String percen;
  final double progress;
  final int finish;
  final double imgPositionR;
  final double imgPositionB;
  final double imgWidht;
  final double imgHeight;

  @override
  State<ItemMenu> createState() => _ItemMenuState();
}

class _ItemMenuState extends State<ItemMenu> {
  final bool _isFocused = false;
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    backgroundColor() {
      if (!_isToggled) {
        return Colors.white;
      } else {
        return AppColor.secondary.withOpacity(0.97);
      }
    }

    Text title() {
      return Text(
        widget.title,
        style: _isToggled
            ? const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400)
            : const TextStyle(
                color: AppColor.secondary,
                fontSize: 14,
                fontWeight: FontWeight.w400),
      );
    }

    final ChartData chartData = ChartData(
        'progress1',
        widget.progress,
        widget.progress >= 100
            ? AppColor.red
            : _isToggled
                ? Colors.green[800]
                : AppColor.secondary);

    return GestureDetector(
      onTap: () {
        if (widget.title.toLowerCase() == 'pemesanan') {
          _showModalBottomSheetOrder();
        } else if (widget.title.toLowerCase() == 'administrasi') {
          _showModalBottomSheetAdmin();
        } else if (widget.title.toLowerCase() == 'pembangunan') {
          _showModalBottomSheetBuild();
        } else if (widget.title.toLowerCase() == 'akad & serah terima') {
          _showModalBottomSheetAccept();
        } else {
          _showModalBottomSheet();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(13),
        ),
        width: 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Stack(
            children: [
              Positioned(
                left: _isToggled ? 50 : -40,
                bottom: _isToggled ? -65 : -190,
                child: Container(
                  width: _isToggled ? 300 : 290,
                  height: _isToggled ? 300 : 290,
                  decoration: BoxDecoration(
                    color: _isToggled ? AppColor.secondary : AppColor.grey2,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tahap',
                        style: TextStyle(
                            color:
                                _isToggled ? Colors.white : AppColor.secondary,
                            fontSize: 12),
                      ),
                      title(),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 19,
                left: 16,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5,
                          spreadRadius: 0,
                          offset: const Offset(0, 3)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: -6,
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SfCircularChart(
                        series: <CircularSeries>[
                          RadialBarSeries<ChartData, String>(
                            dataSource: [chartData],
                            xValueMapper: (ChartData data, _) => data.progress,
                            yValueMapper: (ChartData data, _) => data.value,
                            // Corner style of radial bar segment
                            cornerStyle: widget.progress >= 100
                                ? CornerStyle.bothFlat
                                : CornerStyle.bothCurve,
                            maximumValue: 100,
                            pointColorMapper: (ChartData data, _) => data.color,
                            gap: '5',
                          ),
                        ],
                      ),
                      Positioned.fill(
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Material(
                              color: _isToggled
                                  ? AppColor.secondary
                                  : Colors.white,
                              child: Container(
                                alignment: Alignment.center,
                                width: 30,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      widget.percen,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: _isToggled
                                            ? Colors.white
                                            : AppColor.secondary,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 2),
                                      child: Text(
                                        '%',
                                        style: TextStyle(
                                          fontSize: 5,
                                          fontWeight: FontWeight.bold,
                                          color: _isToggled
                                              ? Colors.white
                                              : AppColor.secondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: widget.imgPositionR,
                bottom: widget.imgPositionB,
                child: Container(
                  width: widget.imgWidht,
                  height: widget.imgHeight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.img), fit: BoxFit.cover)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheetAccept() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        double modalHeight = MediaQuery.of(context).size.height * 0.7;
        return SizedBox(
          height: modalHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)),
                height: 4,
                width: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tahap akad & Serah Terima',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Daftar menu tahap akad & serah terima',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 1.5,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemStatus(
                            img: 'assets/icons/akad.png',
                            status: 'Tahap',
                            info: 'Akad',
                            label: '!'),
                        ItemStatus(
                            img: 'assets/icons/key.png',
                            status: 'Tahap',
                            info: 'Serah Terima\nbangunan'),
                        ItemStatus(
                            img: 'assets/icons/judge.png',
                            status: 'Tahap',
                            info: 'Serah Terima\nLegalitas'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ItemStatus(
                          img: 'assets/icons/danger.png',
                          status: 'Daftar',
                          info: 'Komplain',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    ).then((value) {
      setState(() {
        _isToggled = false;
      });
    });

    setState(() {
      _isToggled = true;
    });
  }

  void _showModalBottomSheetBuild() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        double modalHeight = MediaQuery.of(context).size.height * 0.7;
        return SizedBox(
          height: modalHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)),
                height: 4,
                width: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tahap Pembangunan',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Daftar menu tahap pembangunan rumah',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 1.5,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemStatusProg(
                          percen: '80',
                          status: 'Tahap',
                          info: 'Persiapan',
                          progress: 80,
                        ),
                        ItemStatusProg(
                          percen: '30',
                          status: 'Tahap',
                          info: 'pondasi & Struktur',
                          progress: 30,
                        ),
                        ItemStatusProg(
                          percen: '20',
                          status: 'Tahap',
                          info: 'rumah unfinished',
                          progress: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemStatusProg(
                          percen: '60',
                          status: 'Tahap',
                          info: 'finishing & interior',
                          progress: 60,
                        ),
                        ItemStatusProg(
                          percen: '0',
                          status: 'Tahap',
                          info: 'pembersihan',
                          progress: 0,
                        ),
                        SizedBox(
                          width: 80,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    ).then((value) {
      setState(() {
        _isToggled = false;
      });
    });

    setState(() {
      _isToggled = true;
    });
  }

  void _showModalBottomSheetAdmin() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        double modalHeight = MediaQuery.of(context).size.height * 0.7;
        return SizedBox(
          height: modalHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)),
                height: 4,
                width: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tahap Administrasi',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Daftar menu tahap administrasi',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 1.5,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemStatus(
                            img: 'assets/icons/sps.png',
                            status: 'Tahap',
                            info: 'SPS',
                            label: '!'),
                        ItemStatus(
                            img: 'assets/icons/spr.png',
                            status: 'Tahap',
                            info: 'SPR'),
                        ItemStatus(
                            img: 'assets/icons/ppjb.png',
                            status: 'Tahap',
                            info: 'PPJB'),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemStatus(
                          img: 'assets/icons/doc.png',
                          status: 'Daftar',
                          info: 'Dokumen',
                        ),
                        ItemStatus(
                            img: 'assets/icons/sp3.png',
                            status: 'Tahap',
                            info: 'SP3K'),
                        ItemStatus(
                            img: 'assets/icons/history.png',
                            status: 'Bayar',
                            info: 'Angsuran',
                            label: '!'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    ).then((value) {
      setState(() {
        _isToggled = false;
      });
    });

    setState(() {
      _isToggled = true;
    });
  }

  void _showModalBottomSheetOrder() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (context) {
        double modalHeight = MediaQuery.of(context).size.height * 0.5;
        return SizedBox(
          height: modalHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5)),
                height: 4,
                width: 60,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Tahap Pemesanan',
                style: TextStyle(
                    color: AppColor.secondary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Daftar menu tahap pemesanan',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.grey,
                height: 1.5,
                width: double.infinity,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemStatus(
                        img: 'assets/icons/booking.png',
                        status: 'Booking',
                        info: 'Fee',
                        label: '4'),
                    ItemStatus(
                        img: 'assets/icons/order.png',
                        status: 'Pesanan',
                        info: 'Belum Bayar'),
                    ItemStatus(
                        img: 'assets/icons/history.png',
                        status: 'Riwayat',
                        info: 'Pemesanan'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      isScrollControlled: true,
    ).then((value) {
      setState(() {
        _isToggled = false;
      });
    });

    setState(() {
      _isToggled = true;
    });
  }

  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        double modalHeight = MediaQuery.of(context).size.height * 0.5;
        double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

        return SizedBox(
          height: _isFocused ? modalHeight + keyboardHeight : modalHeight,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          ),
        );
      },
      isScrollControlled: true,
    ).then((value) {
      setState(() {
        _isToggled = false;
      });
    });

    setState(() {
      _isToggled = true;
    });
  }
}
