import 'package:flutter/material.dart';
import 'carbon_footprint.dart';
import 'personalized_journey.dart';
import 'opportunity.dart';
import 'trips_page.dart'; // Seyahatlerim sayfasını ekledik

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            Image.asset('assets/images/logo.png', height: 120), // Logo
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Bir arama terimi girin",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.add),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.blue[100],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
                children: [
                  _buildMenuButton(context, "Fırsatlar", OpportunityPage()),
                  _buildMenuButton(context, "Kişiselleştirilmiş Yolculuklar", PersonalizedJourneyPage()),
                  _buildMenuButton(context, "Seyahatlerim", TripsPage()), // Seyahatlerim butonu eklendi
                  _buildMenuButton(context, "CO2 Ayak İzi", CarbonFootprintPage()),
                  _buildMenuButton(context, "Yapay zeka ile sohbet et", null),
                  _buildMenuButton(context, "Bize Ulaşın", null),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget? page) {
    return ElevatedButton(
      onPressed: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child: Text(title, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[100],
      currentIndex: 0,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
          );
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Saved"),
        BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
      ],
    );
  }
}
