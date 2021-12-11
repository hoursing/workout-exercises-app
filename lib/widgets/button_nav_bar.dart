import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_daily/const.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              BottomNavItem(
                  title: "Today",
                  svgSrc: "assets/icons/calendar.svg",
                  isActive: false),
              BottomNavItem(
                  title: "All exercises",
                  svgSrc: "assets/icons/gym.svg",
                  isActive: true),
              BottomNavItem(
                  title: "Settings",
                  svgSrc: "assets/icons/Settings.svg",
                  isActive: false)
            ]));
  }
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function()? press;
  final bool isActive;

  const BottomNavItem(
      {Key? key,
      required this.svgSrc,
      required this.title,
      required this.isActive,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset(svgSrc,
                color: isActive ? vActiveIconColor : vTextColor),
            Text(
              title,
              style: TextStyle(color: isActive ? vActiveIconColor : vTextColor),
            )
          ]),
    );
  }
}
