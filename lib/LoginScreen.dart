import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:halotani/ProfilePage.dart';
import 'package:halotani/SignupScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

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

  Widget _header() {
    return Column(
      children: [
        Image.asset('assets/img/HaloTani.png', width: 200, height: 200,),
        Text("Masukkan kredensial Anda untuk masuk"),
      ],
    );
  }

  Widget _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
              );
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

  // void _login(BuildContext context) async {
  //   // Ganti URL dengan endpoint login Anda
  //   final url = Uri.parse('https://jsonplaceholder.typicode.com/albumlogin/1');
  //   final response = await http.post(
  //     url,
  //     body: json.encode({
  //       'username': 'test',
  //       'password': 'test',
  //     }),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     // Jika login berhasil, navigasikan ke halaman profil
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfilePage()),
  //     );
  //   } else {
  //     // Jika login gagal, tampilkan pesan kesalahan
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login gagal')),
  //     );
  //   }
  // }

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
