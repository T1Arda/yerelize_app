import 'package:flutter/material.dart';
import 'home_page.dart'; // HomePage import edildi

class PersonalizedJourneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Image.asset('assets/images/logo.png', height: 120),
          SizedBox(height: 20),
          Text(
            "Kişiselleştirilmiş Yolculuğunuz",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          SizedBox(height: 20),
          // Resmi daha büyük ve görünür hale getirdik
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4), // Daha az padding verdik
              child: Image.asset(
                'assets/images/trip.png',
                fit: BoxFit.cover, // Resmi ekranı kaplayacak şekilde büyüttük
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Yeni yolculuk başlandı!")),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text("Yolculuğa Başla", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context), // Ortak bar eklendi
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[100],
      onTap: (index) {
        if (index == 0) {
          // Explore tuşuna basınca HomePage'e git
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false, // Önceki tüm sayfaları kapatır
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
