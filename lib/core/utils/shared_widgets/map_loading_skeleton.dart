import 'package:flutter/material.dart';

class MapLoadingSkeleton extends StatefulWidget {
  final String? loadingText;
  final IconData? icon;

  const MapLoadingSkeleton({
    super.key,
    this.loadingText,
    this.icon,
  });

  @override
  State<MapLoadingSkeleton> createState() => _MapLoadingSkeletonState();
}

class _MapLoadingSkeletonState extends State<MapLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.4, end: 0.85).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) => Container(
        color: Colors.grey.shade200.withOpacity(_anim.value),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon ?? Icons.map_outlined,
                size: 48,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 12),
              Text(
                widget.loadingText ?? 'جارٍ تحميل الخريطة...',
                style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
