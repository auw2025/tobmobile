// btm_nav_item.dart

import 'package:flutter/material.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

import '../../../model/menu.dart';
import 'animated_bar.dart';

class BtmNavItem extends StatelessWidget {
  const BtmNavItem({
    super.key,
    required this.navBar,
    required this.press,
    // Although the new widget doesn't require 'riveOnInit', we
    // still include the parameter to satisfy the widget signature.
    // You can remove it later from the widget definition if no longer needed.
    required this.riveOnInit,
    required this.selectedNav,
  });

  final Menu navBar;
  final VoidCallback press;
  final ValueChanged<dynamic> riveOnInit;
  final Menu selectedNav;

  @override
  Widget build(BuildContext context) {
    final bool isActive = selectedNav == navBar;
    return GestureDetector(
      behavior: HitTestBehavior.opaque, // Ensures entire area is tappable.
      onTap: press,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBar(isActive: isActive),
          SizedBox(
            height: 36,
            width: 36,
            child: Opacity(
              opacity: isActive ? 1 : 0.5,
              child: IgnorePointer(
                // This prevents the inner Rive widget from intercepting taps.
                child: RiveAnimatedIcon(
                  riveIcon: navBar.riveIcon,
                  width: 36,
                  height: 36,
                  strokeWidth: 2,
                  color: isActive ? Colors.blue : Colors.grey,
                  loopAnimation: false,
                  // Removed the inner onTap callback to avoid conflicts.
                  onHover: (hovering) {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}