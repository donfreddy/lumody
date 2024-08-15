import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return MaterialPageRoute(
    builder: (context) => const Page2(),
    // Override transitions in MaterialPageRoute
    fullscreenDialog: false, // Set to true if you want modal-like transitions
    maintainState: true,
  );
}

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // If it's the initial route, don't animate
    if (isFirst) return child;

    const begin = Offset(1.0, 0.0); // Slide in from the right
    const end = Offset.zero;
    const curve = Curves.easeInOut;

    var slideTween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var fadeTween = Tween<double>(begin: 0.0, end: 1.0);

    return FadeTransition(
      opacity: animation.drive(fadeTween),
      child: SlideTransition(
        position: animation.drive(slideTween),
        child: child,
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}