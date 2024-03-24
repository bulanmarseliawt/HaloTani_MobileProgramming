import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:halotani/splashscreen.dart';

final pages = [
  PageData(
    image: AssetImage('assets/img/suncloud.png'),
    title: "Selamat siang",
    bgColor: Color(0xFF447D5C),
    textColor: Colors.white,
  ),
  PageData(
    image: AssetImage('assets/img/smilling.png'),
    title: "Semoga harimu penuh berkah",
    bgColor: Color(0xFFaadfc0),
    textColor: Color(0xFF447D5C),
  ),
  PageData(
    image: AssetImage('assets/img/doctor.png'),
    title: "Konsultasikan tanamanmu sekarang!",
    bgColor: Color(0xffffffff),
    textColor: Color(0xFF447D5C),
  ),
];

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page, isLastPage: index == pages.length - 1),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final ImageProvider? image;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.image,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;
  final bool isLastPage;

  const _Page({Key? key, required this.page, required this.isLastPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: page.textColor),
          child: Image(
            image: page.image!,
            width: screenHeight * 0.1,
            height: screenHeight * 0.1,
            // color: page.bgColor,
          ),
        ),
        Text(
          page.title ?? "",
          style: TextStyle(
              color: page.textColor,
              fontSize: screenHeight * 0.035,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        if (isLastPage) ...[
          SizedBox(height: screenHeight * 0.05),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
            child: Text(
              'Mulai',
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF447D5C),
            ),
          ),
        ],
      ],
    );
  }
}
