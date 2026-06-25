import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mari_nail_app/core/routes/routes.dart';
import 'package:mari_nail_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..forward();

    Future.delayed(const Duration(seconds: 3), () async {
      if (mounted) {
        final pref = await SharedPreferences.getInstance();
        final String? token = pref.getString('accessToken');
        final bool isloggedin = token != null && token.isNotEmpty;
        if (mounted) {
          if (isloggedin) {
            context.read<AuthProvider>().authenticated(true);
          }
          isloggedin
              ? Navigator.pushReplacementNamed(context, Routes.nav)
              : Navigator.pushReplacementNamed(
                  context,
                  Routes.signinCreateAccountPage,
                );
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final t = _controller.value;

          final riseProgress = Curves.easeInOut.transform(
            (t / 0.35).clamp(0.0, 1.0),
          );

          final expandProgress = Curves.easeInOut.transform(
            ((t - 0.35) / 0.65).clamp(0.0, 1.0),
          );

          final circleSize = size.width * 0.55;

          final liquidScale = Tween<double>(begin: 1.0, end: 20.0).evaluate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.35, 1.0, curve: Curves.easeOutBack),
            ),
          );

          final bgProgress = ((t - 0.75) / 0.25).clamp(0.0, 1.0);

          final logoScale =
              TweenSequence<double>([
                TweenSequenceItem(
                  tween: Tween(
                    begin: 0.8,
                    end: 1.15,
                  ).chain(CurveTween(curve: Curves.easeOut)),
                  weight: 50,
                ),
                TweenSequenceItem(
                  tween: Tween(
                    begin: 1.15,
                    end: 1.0,
                  ).chain(CurveTween(curve: Curves.easeInOut)),
                  weight: 50,
                ),
              ]).evaluate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(0.15, 0.45),
                ),
              );

          final logoOffset = Tween<double>(begin: 15, end: 0).evaluate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.15, 0.45, curve: Curves.easeOutBack),
            ),
          );

          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                color: Color.lerp(
                  Colors.white,
                  const Color(0xFFF5B6C1),
                  bgProgress,
                ),
              ),

              Positioned(
                bottom: lerpDouble(
                  -circleSize,
                  size.height / 2 - circleSize / 2,
                  riseProgress,
                )!,
                child: Transform.scale(
                  scale: liquidScale,
                  child: Container(
                    width: circleSize,
                    height: circleSize,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5B6C1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(0, logoOffset),
                child: Transform.scale(
                  scale: logoScale * (1 - expandProgress * 0.08),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/logos/splashScreen_logo.png'),

                      const SizedBox(height: 12),

                      AnimatedOpacity(
                        opacity: t > 0.4 ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: const Text(
                          'Mari',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
