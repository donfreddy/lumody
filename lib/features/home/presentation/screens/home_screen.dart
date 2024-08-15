import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lumody/features/home/presentation/widgets/animated_floating_button.dart';
import 'package:lumody/features/home/presentation/widgets/background_overlay.dart';
import 'package:lumody/features/home/presentation/widgets/triangle.dart';
import 'package:lumody/shared/presentation/widgets/app_bar.dart';
import 'package:supercharged/supercharged.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late ScrollController scrollController;
  bool scrollVisible = true;

  /// To check if the menu is open
  bool _isOpen = false;

  /// Animation controller that animates the menu item
  late AnimationController _iconAnimationCtrl;

  /// Animation that animates the menu item
  late Animation<double> _iconAnimationTween;

  @override
  void initState() {
    super.initState();
    _iconAnimationCtrl =
        AnimationController(vsync: this, duration: 500.milliseconds);
    _iconAnimationTween = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_iconAnimationCtrl);
    // _iconAnimationTween = 0.0.tweenTo(1.0).animate(_iconAnimationCtrl);

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      scrollVisible = value;
    });
  }

  @override
  void dispose() {
    _iconAnimationCtrl.dispose();
    super.dispose();
  }

  void _performAnimation() {
    if (!mounted) return;
    if (_isOpen) {
      _iconAnimationCtrl.forward();
    } else {
      _iconAnimationCtrl.reverse();
    }
  }

  /// Closes the menu if open and vice versa
  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
    });
    if (_isOpen) {
      _iconAnimationCtrl.forward();
    } else {
      _iconAnimationCtrl.reverse();
    }
  }

  /// If the menu is open and the device's back button is pressed then menu gets closed instead of going back.
  Future<bool> _preventPopIfOpen(bool) async {
    if (_isOpen) {
      _toggleMenu();
      return false;
    }
    return true;
  }

  Widget _renderOverlay() {
    return Positioned(
      right: -16.0,
      bottom: -16.0,
      top: _isOpen ? 0.0 : null,
      left: _isOpen ? 0.0 : null,
      child: GestureDetector(
        onTap: _toggleMenu,
        child: BackgroundOverlay(animation: _iconAnimationTween),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _preventPopIfOpen,
      child: Scaffold(
        appBar: mainAppBar(context, 'Home'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: 100,
                itemBuilder: (ctx, i) => ListTile(title: Text('Item $i')),
              ),
            ],
          ),
        ),
        floatingActionButton: Stack(
          //alignment: Alignment.bottomRight,
          //fit: StackFit.loose,
          children: [_renderOverlay(), _renderButton()],
        ),
      ),
    );
  }

  Widget _renderButton() {
    final theme = Theme.of(context);
    return Positioned(
      child: Container(
        margin: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: kToolbarHeight + 40),
            Visibility(
              visible: _isOpen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 125,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                splashColor:
                                    theme.colorScheme.primary.withOpacity(.1),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(Icons.sunny,
                                            color: theme.colorScheme.primary),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Today',
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(
                                            color: theme.colorScheme.primary,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  height: 0,
                                  child: Divider(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor:
                                    theme.colorScheme.primary.withOpacity(.1),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                ),
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: SizedBox(
                                    child: Row(
                                      children: [
                                        Icon(Icons.calendar_month_rounded,
                                            color: theme.colorScheme.primary),
                                        const SizedBox(width: 4),
                                        Text(
                                          'Select Date',
                                          style: theme.textTheme.labelLarge!
                                              .copyWith(
                                                  color: theme
                                                      .colorScheme.primary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: CustomPaint(
                      painter: Triangle(Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: 8.0,
                ),
                child: AnimatedFloatingButton(
                  visible: scrollVisible,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.grey[50]!,
                  elevation: 6.0,
                  onLongPress: _toggleMenu,
                  callback: _toggleMenu,
                  //shape: widget.fabMenuBorder,
                  tooltip: '',
                  heroTag: '',
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: _iconAnimationCtrl,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
