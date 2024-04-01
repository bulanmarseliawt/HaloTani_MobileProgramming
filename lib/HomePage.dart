import 'package:flutter/material.dart';
import 'package:halotani/HistoryPage.dart';
import 'package:halotani/MediaHomePage.dart';
import 'package:halotani/ProfilePage.dart';
import 'package:halotani/PupukHomePage.dart';
import 'package:halotani/RoomChatPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PakarTanaman {
  final String foto;
  final String nama;
  final String jenis;
  final int harga;

  PakarTanaman({
    required this.foto,
    required this.nama,
    required this.jenis,
    required this.harga,
  });

  factory PakarTanaman.fromMap(Map<String, dynamic> json) {
    return PakarTanaman(
      foto: json['foto'],
      nama: json['nama'],
      jenis: json['jenis'],
      harga: json['harga'],
    );
  }
}

class HomePage extends StatelessWidget {
  final List<PakarTanaman> pakarList = [
    PakarTanaman(
      foto: 'assets/img/pakar1.png',
      nama: 'Ahmad, S.P.',
      jenis: 'Buah-buahan',
      harga: 0,
    ),
    PakarTanaman(
      foto: 'assets/img/pakar2.png',
      nama: 'Prof. Dr. Ir. Budioni, M.Sc. ',
      jenis: 'Sayuran',
      harga: 0,
    ),
    // Tambahkan data pakar tanaman lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Color(0xFF447D5C)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/petani.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  // Logika untuk mengubah teks pencarian
                },
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildSessionWithColor(
                  title: 'Tanaman Pangan',
                  image: AssetImage('assets/img/beras.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
                    );
                  },
                ),
                _buildSessionWithColor(
                  title: 'Holtikultura',
                  image: AssetImage('assets/img/holtikultura.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
                    );
                  },
                ),
                _buildSessionWithColor(
                  title: 'Hama',
                  image: AssetImage('assets/img/hama.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
                    );
                  },
                ),
                _buildSessionWithColor(
                  title: 'Pupuk',
                  image: AssetImage('assets/img/pupuk.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PupukHomePage()),
                    );
                  },
                ),
                _buildSessionWithColor(
                  title: 'Media',
                  image: AssetImage('assets/img/media.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MediaHomePage()),
                    );
                  },
                ),
                _buildSessionWithColor(
                  title: 'Agroklimatologi',
                  image: AssetImage('assets/img/agroklimatologi.png'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Chat Langsung dengan Pakar Tanaman Andalanmu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: pakarList.map((pakar) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(pakar.foto),
                        ),
                        SizedBox(height: 8),
                        Text(pakar.nama),
                        Text(pakar.jenis),
                        Text('Harga Chat: Gratis'),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RoomChatPage()),
                            );
                          },
                          child: Text('Chat'),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()),
              // );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showConsultationDialog(context);
        },
        child: Icon(Icons.chat),
      ),
    );
  }

  Widget _buildSessionWithColor({
    required String title,
    required AssetImage image,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFaadfc0).withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: Color(0xFF447D5C), width: 2.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Image(
                image: image,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 6.0),
            Expanded(
              flex: 1,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF447D5C)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showConsultationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konsultasi'),
          content: Text('Apakah Anda ingin konsultasi hari ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigasi ke RoomChatPage jika pengguna ingin konsultasi hari ini
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomChatPage()),
                );
              },
              child: Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigasi ke halaman pilihan tanggal dan jam jika pengguna ingin pilih tanggal dan jam konsultasi
                _selectDate(context);
              },
              child: Text('Pilih Tanggal dan Jam'),
            ),
          ],
        );
      },
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (pickedDate != null) {
      // Navigasi ke halaman pilihan jam setelah memilih tanggal
      _selectTime(context, pickedDate);
    }
    return pickedDate;
  }

  Future<void> _selectTime(BuildContext context, DateTime selectedDate) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      // Lakukan tindakan yang sesuai dengan tanggal dan waktu yang dipilih
      // Contoh: Simpan tanggal dan waktu yang dipilih ke dalam variabel atau kirim ke server
      // Di sini, Anda dapat menavigasi ke RoomChatPage dengan tanggal dan waktu yang dipilih
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RoomChatPage()),
      );
    }
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
