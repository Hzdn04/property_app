import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';
import 'package:property_app/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ItemStatus extends StatelessWidget {
  const ItemStatus(
      {super.key,
      this.label = '',
      required this.img,
      required this.status,
      required this.info});

  final String label;
  final String img;
  final String status;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(right: 30, top: 25, left: 10, bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(13),
              bottomLeft: Radius.circular(13),
              topLeft: Radius.circular(13),
              topRight: Radius.circular(70))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Badge(
            largeSize: 19,
            alignment: const Alignment(1.3, -1.1),
            backgroundColor: label == '' ? Colors.transparent : AppColor.red,
            label: Padding(
              padding: const EdgeInsets.all(3),
              child: Text(label),
            ),
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: label == ''
                    ? AppColor.secondary.withOpacity(0.7)
                    : AppColor.secondary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Image.asset(
                img,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                status,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: label == ''
                        ? AppColor.secondary.withOpacity(0.7)
                        : AppColor.secondary),
              ),
              Text(
                info,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: label == ''
                        ? AppColor.secondary.withOpacity(0.7)
                        : AppColor.secondary),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ItemStatusProg extends StatelessWidget {
  const ItemStatusProg({
    super.key,
    this.label = '',
    required this.percen,
    required this.status,
    required this.info,
    required this.progress,
  });

  final String label;
  final double progress;
  final String percen;
  final String status;
  final String info;

  @override
  Widget build(BuildContext context) {
    final ChartData chartData = ChartData('progress1', progress, AppColor.red);

    return Container(
      height: 128,
      width: 95,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(13),
              bottomLeft: Radius.circular(13),
              topLeft: Radius.circular(13),
              topRight: Radius.circular(70))),
      child: Stack(
        children: [
          Positioned(
            right: 18,
            top: -10,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                children: [
                  SfCircularChart(series: <CircularSeries>[
                    RadialBarSeries<ChartData, String>(
                      dataSource: [chartData],
                      xValueMapper: (ChartData data, _) => data.progress,
                      yValueMapper: (ChartData data, _) => data.value,
                      trackColor: Colors.white,
                      cornerStyle: progress >= 100
                          ? CornerStyle.bothFlat
                          : CornerStyle.bothCurve,
                      maximumValue: 100,
                      pointColorMapper: (ChartData data, _) => data.color,
                      gap: '4',
                    ),
                  ]),
                  Positioned.fill(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Material(
                          color: AppColor.secondary,
                          child: Container(
                            alignment: Alignment.center,
                            width: 32,
                            height: 32,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  percen,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    '%',
                                    style: TextStyle(
                                      fontSize: 5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: label == ''
                          ? AppColor.secondary.withOpacity(0.7)
                          : AppColor.secondary),
                ),
                Text(
                  info,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: label == ''
                          ? AppColor.secondary.withOpacity(0.7)
                          : AppColor.secondary),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
