import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_daily/const.dart';
import 'package:workout_daily/widgets/button_nav_bar.dart';
import 'package:workout_daily/widgets/search_bar.dart';

class CouseDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: vBlueLightColor,
              image: DecorationImage(
                  image: AssetImage("assets/imgs/meditation_bg.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "3-10 Min Course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                      width: size.width * .6, // it just take 60% of total width
                      child: Text(
                          "Practice every day to improve your health. We believe you will have a better life")),
                  SizedBox(
                      width: size.width * .5, // it just take 50% of total width
                      child: SearchBar()),
                  Wrap(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      SessionCard(
                        seasionNum: 1,
                        isDone: true,
                      ),
                      SessionCard(seasionNum: 2),
                      SessionCard(seasionNum: 3),
                      SessionCard(seasionNum: 4),
                      SessionCard(seasionNum: 5),
                      SessionCard(seasionNum: 6),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              color: vShadowColor)
                        ]),
                    child: Row(
                      children: <Widget>[
                        SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"),
                        SizedBox(width: 20),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Basic 2",
                                style: Theme.of(context).textTheme.subtitle1),
                            Text("Start your deepen you practice")
                          ],
                        )),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child:SvgPicture.asset("assets/icons/Lock.svg")
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int? seasionNum;
  final bool isDone;

  const SessionCard({
    Key? key,
    this.seasionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: EdgeInsets.all(14),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: vShadowColor,
                )
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? vBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: vBlueColor)),
                      child: Icon(Icons.play_arrow,
                          color: isDone ? Colors.white : vBlueColor),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Session $seasionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
