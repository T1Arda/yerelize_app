import 'package:flutter/material.dart';
import 'home_page.dart';

class CarbonFootprintPage extends StatefulWidget {
  @override
  _CarbonFootprintPageState createState() => _CarbonFootprintPageState();
}

class _CarbonFootprintPageState extends State<CarbonFootprintPage> {
  final TextEditingController _kmController = TextEditingController();
  double _co2Result = 0.0;

  void _calculateCO2() {
    double km = double.tryParse(_kmController.text) ?? 0;
    setState(() {
      _co2Result = km * 0.12; // Örnek hesaplama: km başına 0.12 kg CO₂
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Klavyenin içeriği sıkıştırmasını önler
      body: SingleChildScrollView( // İçeriğin kaydırılmasını sağlar
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset('assets/images/logo.png', height: 120), // Logo
              SizedBox(height: 20),
              Text(
                "Km bazlı CO₂ Ayak İzi Hesaplayıcınız",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/co2_calculator.png', height: 200), // CO2 hesaplayıcı görseli
              SizedBox(height: 20),
              TextField(
                controller: _kmController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Kaç km yolculuk yaptınız?",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateCO2,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("CO₂ Hesapla", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              Text(
                "Tahmini CO₂ Ayak İzi: ${_co2Result.toStringAsFixed(2)} kg",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[100],
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
