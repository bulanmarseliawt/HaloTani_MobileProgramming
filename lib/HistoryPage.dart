import 'package:flutter/material.dart';
import 'package:halotani/HomePage.dart';
import 'package:halotani/ProfilePage.dart'; 

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Konsultasi'),
      ),
      body: ListView(
        children: [
          HistoryItem(
            date: '31 Februari 2024',
            consultationWith: 'Pakar Tanaman Pangan',
            description: 'Menerima konsultasi tentang perawatan tanaman pangan yang basi',
          ),
          HistoryItem(
            date: '1 Maret 2024',
            consultationWith: 'Pakar Tanaman Pangan',
            description: 'Menerima konsultasi makanan dicuri orang',
          ),
          // Tambahkan item history lainnya di sini
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set index 2 sebagai yang sedang aktif (History)
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),           
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 2:
              // Tidak perlu melakukan navigasi karena sudah berada di halaman HistoryPage
              break;
          }
        },
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String date;
  final String consultationWith;
  final String description;

  const HistoryItem({
    Key? key,
    required this.date,
    required this.consultationWith,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFaadfc0), // Background color hijau
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        title: Text(
          date,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Konsultasi dengan: $consultationWith'),
            Text(description),
          ],
        ),
        onTap: () {
          // Tambahkan aksi yang ingin dilakukan saat item history diklik
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HistoryPage(),
  ));
}
