import 'package:animated_splash_screen/second_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.network('https://assets3.lottiefiles.com/packages/lf20_AMBEWz.json', controller: _controller, onLoaded: (compos) {
            _controller
              ..duration = compos.duration
              ..forward().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              });

            // abrir outra pagina quando a animação for concluida
          }),
          const Center(
            child: Text('Teste'),
          ),
        ],
      ),
    );
  }
}
