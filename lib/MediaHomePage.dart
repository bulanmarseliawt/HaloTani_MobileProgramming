import 'package:flutter/material.dart';
import 'package:halotani/HistoryPage.dart';
import 'package:halotani/HomePage.dart';
import 'package:halotani/ProfilePage.dart';
import 'package:halotani/RoomChatPage.dart';

class MediaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200, 
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/mediatanamreal.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildSessionWithColor(
              title: 'Hidroponik',
              image: AssetImage('assets/img/mediahidroponik.png'),
              onTap: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => MediaHidroponikPage()),
                  MaterialPageRoute(builder: (context) => RoomChatPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildSessionWithColor(
              title: 'Tanah',
              image: AssetImage('assets/img/mediatanah.png'),
              onTap: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => MediaTanahPage()),
                  MaterialPageRoute(builder: (context) => RoomChatPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildSessionWithColor(
              title: 'Biopot',
              image: AssetImage('assets/img/mediabiopot.png'),
              onTap: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => MediaBiopotPage()),
                  MaterialPageRoute(builder: (context) => RoomChatPage()),
                );
              },
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
              break;
          }
        },
      ),
    );
  }
// Widget untuk membuat bagian sesi dengan warna latar belakang khusus
  Widget _buildSessionWithColor({
    required String title,
    required AssetImage image,
    required Function onTap,
  }) {
    return GestureDetector(
      onTap: () {
        // Panggil fungsi onTap ketika bagian ini ditekan
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Color(0xFFaadfc0).withOpacity(0.1), // Mengubah opacity menjadi 0.1
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color(0xFFaadfc0), width: 2.0),
        ),
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF447D5C)),
              ),
            ),
            SizedBox(width: 16.0),
            Image(
              image: image,
              width: 50,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

// class MediaHidroponikPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tanaman Pangan'),
//       ),
//       body: Center(
//         child: Text('Halaman Tanaman Pangan'),
//       ),
//     );
//   }
// }

// class MediaTanahPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Holtikultura'),
//       ),
//       body: Center(
//         child: Text('Halaman Holtikultura'),
//       ),
//     );
//   }
// }

// class MediaBiopotPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hama'),
//       ),
//       body: Center(
//         child: Text('Halaman Hama'),
//       ),
//     );
//   }
// }



void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MediaHomePage(),
    ),
  );
}
