import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebVeiwPage extends StatefulWidget {
  const WebVeiwPage({super.key, required this.url});
  final String url;
  @override
  State<WebVeiwPage> createState() => _WebVeiwPageState();
}

class _WebVeiwPageState extends State<WebVeiwPage> {
  @override
  void initState() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    super.initState();
  }

  late WebViewController controller;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
          child: Stack(
              children: [
                WebViewWidget(
                  controller: controller,
                ),
                Positioned(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
        );
  }
}
