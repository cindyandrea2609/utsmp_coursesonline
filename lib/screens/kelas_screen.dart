import 'package:flutter/material.dart';
import 'package:uts_onlinecourses/widgets/bottom_nav_bar.dart';
import 'package:uts_onlinecourses/widgets/course_card.dart';
import 'package:uts_onlinecourses/utils/theme_color.dart';
import 'login_screen.dart'; // Import buat balik ke login

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("MY CLASSES", style: TextStyle(fontSize: 14, letterSpacing: 2, fontWeight: FontWeight.bold)),
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
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 10,
        itemBuilder: (context, index) => CourseCard(
          title: "Ongoing Class ${index + 1}",
          subtitle: "Progress 40% • 5/12 Lessons",
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(activeIndex: 1),
    );
  }
}