import 'package:flutter/material.dart';
import 'package:halotani/LoginScreen.dart';
import 'package:halotani/SignupScreen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar logo di tengah
            Image.asset(
              'assets/img/HaloTani.png', 
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50), 

            // Tombol Masuk
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFaadfc0), // Background color
                fixedSize: Size(231, 35), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
              ),
              child: Text(
                'Masuk',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20), 

            // Tombol Buat Akun
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFe3ffef), // Background color
                fixedSize: Size(231, 35), // Button width and height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.5),
                ),
              ),
              child: Text(
                'Buat Akun',
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
