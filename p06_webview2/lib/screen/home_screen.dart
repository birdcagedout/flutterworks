import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

final homeURI = Uri.parse('https://blog.codefactory.ai');

class HomeScreen extends StatelessWidget {

  WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(homeURI);

  HomeScreen({Key? key})
      : super(key: key); // controller를 나중에 생성할 것이므로 final이 아니므로 const를 지

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code Factory 앱바'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: () {
            print('클릭');
            controller.loadRequest(homeURI);   // home버튼을 누르면 ==> controller를 써서 webview를 homeURL로 이동
          },
            icon: Icon(Icons.home)),
        ],
      ),
      // body:
      // WebView(
      //   onWebViewCreated: (controller) {
      //     this.controller = controller;
      //   },
      //   initialUrl: homeURL,
      //   javascriptMode: JavascriptMode
      //       .unrestricted, // 기본값은 disabled이므로 항상 unrestricted로 해줘야 함
      // ),
      body: WebViewWidget(
        controller: controller,
      ),

    );
  }
}
