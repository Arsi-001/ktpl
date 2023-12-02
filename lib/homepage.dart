import 'package:flutter/material.dart';
import 'package:ktpl/Constants.dart';
import 'package:ktpl/livestream.dart';
import 'package:remixicon/remixicon.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadHtmlString(
        '<html><body> <iframe title="Iframe Example" src="https://cricclubs.com/KarachiTapeballPremierLeague/fixtures.do?clubId=29814&amp;embedView=true" width="100%" height="1000"></iframe></body></html>');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(120), child: Header()),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              color: ThemeWhite,
              border: Border.all(color: ThemeGrey, width: 2)),
          child: LiveStreamVideo(),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Main Header Container
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(color: Colors.white),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "KTPL SEASON 3",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Tabitem_unselected(
                selectedstatus: true,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
              Tabitem_unselected(
                selectedstatus: false,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class Tabitem_unselected extends StatelessWidget {
  Tabitem_unselected({
    super.key,
    required this.selectedstatus,
  });

  final selectedstatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        // button Container
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: selectedstatus ? ThemeRed : ThemeGrey,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            Icon(Remix.home_2_line,
                size: 16, color: selectedstatus ? Colors.white : Colors.black),
            SizedBox(
              width: 4,
            ),
            Text(
              "Home",
              style: TextStyle(
                  fontSize: 12,
                  color: selectedstatus ? Colors.white : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class back_button_filled extends StatelessWidget {
  const back_button_filled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: ThemeRed),
        child: Center(
          child: Icon(
            Remix.arrow_left_line,
            color: Colors.white,
          ),
        ));
  }
}
