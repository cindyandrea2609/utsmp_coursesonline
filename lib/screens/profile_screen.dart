import 'package:flutter/material.dart';
import 'package:uts_onlinecourses/widgets/bottom_nav_bar.dart';
import 'package:uts_onlinecourses/utils/theme_color.dart';
import 'login_screen.dart'; // Import buat balik ke login

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        title: const Text("PROFILE", style: TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold)),
        centerTitle: true,
        // FITUR LOGOUT
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Colors.white),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50, 
              backgroundColor: AppColors.cardFill, 
              child: Icon(Icons.person, size: 50, color: Colors.white)
            ),
            const SizedBox(height: 20),
            const Text("Andrea", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            const Text("andrea@instiki.ac.id", style: TextStyle(color: AppColors.secondaryText)),
            const SizedBox(height: 30),
            _buildMenu(Icons.settings, "Account Settings"),
            _buildMenu(Icons.notifications_none, "Notifications"),
            _buildMenu(Icons.help_outline, "Help Center"),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(activeIndex: 2),
    );
  }

  Widget _buildMenu(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.cardFill, 
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70, size: 20),
          const SizedBox(width: 15),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.chevron_right, color: Colors.white24, size: 18),
        ],
      ),
    );
  }
}