
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';   // SystemChrome.setSystemUIOverlayStyle()

// 위젯
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// state
class _HomeScreenState extends State<HomeScreen> {

  Timer? timer;
  PageController controller = PageController(
    initialPage: 0
  );

  @override
  void initState() {
    super.initState();    // 맨 앞에

    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      int currentPage = controller.page!.toInt();   // page는 double값 (transition될 때 0.1, 0.5 등 소수점이 붙는다)
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }

      // 에니메이션 효과
      controller.animateToPage(nextPage, duration: Duration(milliseconds: 400), curve: Curves.linear);
    });

  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1,2,3,4,5].map((e) => Image.asset("assets/img/image_$e.jpeg", fit: BoxFit.cover)).toList(),
      )
    );
  }


  @override
  void dispose() {
    controller.dispose();
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();    //  맨 뒤에
  }
}
