import 'package:flutter/material.dart';
import '../utils/theme_color.dart';

class CustomBottomNav extends StatelessWidget {
  final int activeIndex;

  const CustomBottomNav({super.key, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNavItem(context, Icons.grid_view_rounded, "Home", "/dashboard", activeIndex == 0),
          const SizedBox(width: 40),
          _buildNavItem(context, Icons.play_lesson_outlined, "Kelas", "/kelas", activeIndex == 1),
          const SizedBox(width: 40),
          _buildNavItem(context, Icons.person_outline_rounded, "Profile", "/profile", activeIndex == 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, String route, bool isActive) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.white : Colors.white30, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.white30,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}