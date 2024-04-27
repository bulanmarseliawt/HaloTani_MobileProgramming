import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:halotani/ProfilePage.dart';
import 'package:halotani/SignupScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

// Widget untuk tampilan header
  Widget _header() {
    return Column(
      children: [
        Image.asset('assets/img/HaloTani.png', width: 200, height: 200,),
        Text("Masukkan kredensial Anda untuk masuk"),
      ],
    );
  }

// Widget untuk tampilan field input dan tombol masuk
  Widget _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Color.fromRGBO(170, 223, 192, 1).withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFaadfc0).withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.password),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _login(context);
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color.fromRGBO(170, 223, 192, 1),
          ),
          child: const Text(
            "Masuk",
            style: TextStyle(fontSize: 20, color: Color(0xFF447D5C)),
          ),
        )
      ],
    );
  }

  void _login(BuildContext context) async {
  final url = Uri.parse('https://halotani-2bf84-default-rtdb.asia-southeast1.firebasedatabase.app/users.json');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);

    // Periksa apakah ada data pengguna
    if (jsonData != null) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      // Iterasi melalui data pengguna untuk mencari kecocokan
      bool isUserFound = false;
      jsonData.forEach((key, value) {
        if (value['username'] == username && value['password'] == password) {
          isUserFound = true;
          return;
        }
      });

      // Jika pengguna ditemukan, arahkan ke halaman profil
      if (isUserFound) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Username atau password salah')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tidak ada pengguna terdaftar')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login gagal')),
    );
  }
}


  Widget _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Lupa kata sandi?",
        style: TextStyle(color: const Color(0xFF447D5C)),
      ),
    );
  }

  Widget _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Belum punya akun? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: const Text(
            "Daftar",
            style: TextStyle(color: Color.fromARGB(255, 45, 71, 56)),
          ),
        ),
      ],
    );
  }
}
