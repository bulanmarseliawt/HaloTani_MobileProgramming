import 'package:flutter/material.dart';
import 'package:halotani/HistoryPage.dart';
import 'package:halotani/MediaHomePage.dart';
import 'package:halotani/ProfilePage.dart';
import 'package:halotani/RoomChatPage.dart';

class HomePage extends StatelessWidget {
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
                  image: AssetImage('assets/img/petani.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
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
                      // MaterialPageRoute(builder: (context) => TanamanPanganPage()),
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
                      // MaterialPageRoute(builder: (context) => HoltikulturaPage()),
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
                      // MaterialPageRoute(builder: (context) => HamaPage()),
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
                      // MaterialPageRoute(builder: (context) => PupukPage()),
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
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
                      // MaterialPageRoute(builder: (context) => AgroklimatologiPage()),
                      MaterialPageRoute(builder: (context) => RoomChatPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          borderRadius: BorderRadius.circular(15.0),
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
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(height: 8.0),
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
}

// class TanamanPanganPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Tanaman Pangan',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Tanaman Pangan',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

// class HoltikulturaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Holtikultura',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Holtikultura',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

// class HamaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Hama',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Hama',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

// class PupukPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Pupuk',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Pupuk',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

// class MediaPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Media',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Media',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

// class AgroklimatologiPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Agroklimatologi',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           'Halaman Agroklimatologi',
//           style: TextStyle(color: Color(0xFF447D5C)),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
