import 'package:flutter/material.dart';
import 'package:halotani/HomePage.dart';
import 'package:halotani/HistoryPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        title: Text('Profile'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: const Image(image: AssetImage('assets/img/farmer.jpg')),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color.fromARGB(255, 4, 82, 44)),
                    child: const Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text('NamaPengguna', style: Theme.of(context).textTheme.headline6),
            Text('Petani Pemula', style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ( const Color.fromARGB(255, 4, 82, 44)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Pengaturan'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Detail Pemesanan'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text('Manajemen Akun'),
              onTap: () {},
            ),
            const Divider(),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Informasi'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: const Color.fromARGB(255, 4, 82, 44)),
              title: Text('Keluar', style: TextStyle(color: const Color.fromARGB(255, 4, 82, 44))),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Keluar'),
                      content: Text('Anda yakin ingin keluar'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Batal'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Perform logout action here
                            Navigator.of(context).pop();
                          },
                          child: Text('Keluar'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const <BottomNavigationBarItem>[
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
              // Tidak perlu melakukan navigasi karena sudah berada di halaman ProfilePage
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
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    ),
  );
}
