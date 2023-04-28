import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (!clicked) {
                  clicked = true;
                  _controller.forward();
                } else {
                  clicked = false;
                  _controller.reverse();
                }
              },
              child: Lottie.network("https://assets3.lottiefiles.com/packages/lf20_fft5vg8j.json", controller: _controller, width: 150),
            ),
          ],
        ),
      ),
    );
  }
}
