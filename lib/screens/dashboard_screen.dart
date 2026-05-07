import 'package:flutter/material.dart';
import 'package:uts_onlinecourses/widgets/bottom_nav_bar.dart';
import 'package:uts_onlinecourses/widgets/course_card.dart';
import 'package:uts_onlinecourses/utils/theme_color.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil data nama dari arguments login
    final String userName = ModalRoute.of(context)!.settings.arguments as String? ?? "Andrea";

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "PIXEL ACADEMY", 
          style: TextStyle(color: Colors.white, fontSize: 14, letterSpacing: 3, fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Hey,", style: TextStyle(color: AppColors.secondaryText, fontSize: 16)),
                  Text(
                    "$userName nok!",
                    style: const TextStyle(color: AppColors.primaryText, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 2. Card Progress
            _buildHeroCard(),

            // --- BAGIAN CAROUSEL CATEGORY YANG KHE MINTA ---
            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("COURSES CATEGORY", style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),

            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<String> categories = ["UI/UX", "Illustration", "Branding", "3D Modeling", "Animation"];
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: AppColors.cardFill,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ),
            // ----------------------------------------------

            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("OTHER COURSES", style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),

            // 4. ListView Utama (Minimal 10 Item Sesuai Syarat Dosen)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 10, 
              itemBuilder: (context, index) {
                return CourseCard(
                  title: "Design Course ${index + 1}",
                  subtitle: "Advanced Level • 12 Lessons",
                );
              },
            ),
            const SizedBox(height: 100), 
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(activeIndex: 0),
    );
  }

  // Widget Helper biar build method gak kepanjangan
  Widget _buildHeroCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: AppColors.cardFill,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("UI/UX Design for Pro", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const LinearProgressIndicator(
                value: 0.75, 
                backgroundColor: Colors.white10,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 8,
              ),
              const SizedBox(height: 10),
              const Text("75% Completed", style: TextStyle(color: AppColors.secondaryText, fontSize: 12)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("LANJUTKAN", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}