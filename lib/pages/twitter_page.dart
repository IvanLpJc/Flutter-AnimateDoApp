import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({Key? key}) : super(key: key);

  @override
  State<TwitterPage> createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  late bool animate;

  @override
  void initState() {
    animate = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1DA1F2),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          animate = !animate;
        }),
        backgroundColor: Colors.pink,
        child: const FaIcon(FontAwesomeIcons.play),
      ),
      body: Center(
        child: ZoomOut(
          animate: animate,
          duration: const Duration(seconds: 1),
          from: 30,
          child: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}
