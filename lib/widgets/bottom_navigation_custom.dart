import 'dart:math';

import 'package:flutter/material.dart';
import 'package:property_app/config/app_theme.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconList;
  final List<String> iconFillList;
  final Color backgroundColor;
  final Color selectedColor;
  final Color unselectedColor;
  final double radius;
  final double sizeIcon;

  const CustomBottomNavBar({
    super.key,
    this.defaultSelectedIndex = 0,
    required this.onChange,
    required this.iconList,
    required this.iconFillList,
    this.backgroundColor = Colors.white,
    this.selectedColor = AppColor.secondary,
    this.unselectedColor = Colors.grey,
    this.radius = 0.0,
    this.sizeIcon = 24,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;
  List<String> _iconList = [];
  List<String> _iconFillList = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _iconFillList = widget.iconFillList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> navBarItemList = [];

    for (var i = 0; i < _iconList.length && i < _iconFillList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], _iconFillList[i], i));
    }

    return Container(
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.radius),
              topRight: Radius.circular(widget.radius))),
      child: Row(
        children: navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(String icon, String iconFill, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        _selectedIndex = index;
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / _iconList.length,
              padding: const EdgeInsets.only(bottom: 8, top: 16),
              child: Image.asset(
                _selectedIndex == index ? iconFill : icon,
                height: widget.sizeIcon,
                width: widget.sizeIcon,
                color: _selectedIndex == index
                    ? widget.selectedColor
                    : widget.unselectedColor,
              ),
            ),
            // Visibility(
            //   visible: widget.showLabel,
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 4),
            //     child: Text(
            //       text,
            //       style: TextStyle(
            //           height: 0,
            //           fontSize: 10,
            //           color: _selectedIndex == index
            //               ? widget.selectedColor
            //               : widget.unselectedColor),
            //     ),
            //   ),
            // ),
            _selectedIndex == index
                ? selectedIndicator()
                : unselectedIndicator(),
          ],
        ),
      ),
    );
  }

  Widget selectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 61,
            child: CustomPaint(
              painter: CirclePainter(color: widget.selectedColor),
            ),
          ),

          // Container(
          //   width: 50,
          //   height: 10,
          //   margin: const EdgeInsets.only(top: 4),
          //   decoration: BoxDecoration(
          //     color: widget.selectedColor,
          //     borderRadius: const BorderRadius.only(
          //       topLeft: Radius.circular(40),
          //       topRight: Radius.circular(40),
          //     ),
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
            height: 4,
            width: 4,
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
        ],
      ),
    );
  }

  Widget unselectedIndicator() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 40,
      height: 0,
      margin: const EdgeInsets.only(top: 7),
      color: Colors.transparent,
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Menggambar lingkaran pada 1/10 bagian dari radius lingkaran
    final radius = size.width / 2;
    final centerX = size.width / 2;
    final centerY = size.height + 25;

    const startAngle = pi; // Mulai dari atas
    const sweepAngle = pi; // Melingkari setengah lingkaran

    final path = Path();
    path.moveTo(centerX, centerY);
    path.arcTo(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      true,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
