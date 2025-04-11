import 'package:flutter/material.dart';
import 'home_page.dart';

class TripsPage extends StatelessWidget {
  final List<Map<String, dynamic>> trips = [
    {"title": "İstanbul Boğaz Turu", "date": "12 Mart 2024", "km": 25},
    {"title": "Kapadokya Balon Gezisi", "date": "20 Nisan 2024", "km": 80},
    {"title": "Antalya Tatili", "date": "5 Mayıs 2024", "km": 600},
    {"title": "Pamukkale Gezisi", "date": "18 Haziran 2024", "km": 400},
  ];

  @override
  Widget build(BuildContext context) {
    double totalKm = trips.fold(0, (sum, trip) => sum + trip["km"]);

    return Scaffold(
      appBar: AppBar(title: Text("Seyahatlerim")),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Toplam Yolculuk Mesafeniz: ${totalKm.toStringAsFixed(2)} km",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          Expanded(
            child: trips.isEmpty
                ? Center(child: Text("Henüz bir seyahat bulunmamaktadır."))
                : ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                var trip = trips[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.flight_takeoff, color: Colors.blue),
                    title: Text(trip["title"]!),
                    subtitle: Text("${trip["date"]!} - ${trip["km"]} km"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Updates",
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          }
        },
      ),
    );
  }
}
