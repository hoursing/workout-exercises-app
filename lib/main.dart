import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_daily/const.dart';
import 'package:workout_daily/widgets/categorycard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: vBacgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: vTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This gonna give us total height and with of our device
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 80,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              BottomnNavItem(), 
              BottomnNavItem()])),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the heigh of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("assets/imgs/undraw_pilates_gpdb.png")),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text("Hi guys",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w900)),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5)),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search",
                          icon: SvgPicture.asset("assets/icons/search.svg"),
                          border: InputBorder.none),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          ProductCatgory(
                            title: "Diet Recommendation",
                            svgSrc: "assets/icons/Hamburger.svg",
                            press: () {},
                          ),
                          ProductCatgory(
                            title: "Kegel execises",
                            svgSrc: "assets/icons/Excrecises.svg",
                            press: () {},
                          ),
                          ProductCatgory(
                            title: "Meditation",
                            svgSrc: "assets/icons/Meditation.svg",
                            press: () {},
                          ),
                          ProductCatgory(
                            title: "Yoga",
                            svgSrc: "assets/icons/yoga.svg",
                            press: () {},
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomnNavItem extends StatelessWidget {
  const BottomnNavItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SvgPicture.asset("assets/icons/calendar.svg"),
            Text("Today")
          ]),
    );
  }
}
