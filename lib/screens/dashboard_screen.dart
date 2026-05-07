import 'package:flutter/material.dart';
import 'login_screen.dart'; // Wajib buat fungsi logout

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ngambil data nama Andrea dari state login
    final String userName = ModalRoute.of(context)!.settings.arguments as String? ?? "Andrea";

    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Deep Black Minimalist
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
              // Fungsi Logout balik ke login & hapus history
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
                  Text("Hello again,", style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                  Text(
                    "$userName !",
                    style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // 2. Card Dashboard Progress (Widget Advanced)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                color: const Color(0xFF1E1E1E),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Current Progress", style: TextStyle(color: Colors.white70, fontSize: 12)),
                      const SizedBox(height: 10),
                      const Text("UI/UX Design for Pro", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const LinearProgressIndicator(
                          value: 0.75, 
                          backgroundColor: Color(0xFF2C2C2C),
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 8,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text("75% Completed", style: TextStyle(color: Colors.white54, fontSize: 12)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("CONTINUE", style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("COURSES CATEGORY", style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),

            // 3. Carousel-Style (Horizontal ListView.builder)
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
                      color: const Color(0xFF1E1E1E),
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

            const SizedBox(height: 35),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text("OTHER COURSES", style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),

            // 4. Syarat Wajib Dosen: ListView.builder Minimal 10 Item
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 10, 
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xFF1E1E1E),
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.brush_outlined, color: Colors.white),
                    ),
                    title: Text("Design Course ${index + 1}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                    subtitle: const Text("Advanced Level • 24 Lessons", style: TextStyle(color: Colors.white38, fontSize: 11)),
                    trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 14),
                  ),
                );
              },
            ),
            const SizedBox(height: 100), 
          ],
        ),
      ),

      // 5. Navbar Bawah Pepet Style
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF121212),
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Bikin menu ke tengah
          children: [
            _buildNavItem(Icons.grid_view_rounded, "Home", "/dashboard", context, true),
            const SizedBox(width: 40), // Jarak antar menu
            _buildNavItem(Icons.play_lesson_outlined, "Courses", "/kelas", context, false),
            const SizedBox(width: 40),
            _buildNavItem(Icons.person_outline_rounded, "Profile", "/profile", context, false),
          ],
        ),
      ),
    );
  }

  // Helper Widget buat Navigasi
  Widget _buildNavItem(IconData icon, String label, String route, BuildContext context, bool isActive) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          Navigator.pushNamed(context, route);
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
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal
            )
          ),
        ],
      ),
    );
  }
}