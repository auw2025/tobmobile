import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart' hide LinearGradient;

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 236,
        child: Stack(
          children: [
            // Base container with Prussian blue
            Container(
              height: 64,
              width: 236,
              decoration: BoxDecoration(
                color: const Color(0xFF003153),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            // ShaderMask to tint the Rive asset completely in Prussian blue.
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFF003153)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnAnimationController],
              ),
            ),
            // Centered badge for text and icon on top.
            Positioned.fill(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF003153),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.arrow_right,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Start the course",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: const [
                                Shadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 4,
                                  color: Colors.black45,
                                ),
                                Shadow(
                                  offset: Offset(-1, -1),
                                  blurRadius: 4,
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                      )
                    ],
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