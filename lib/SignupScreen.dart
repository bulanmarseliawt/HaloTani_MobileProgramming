import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:halotani/LoginScreen.dart';
import 'package:halotani/ProfilePage.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key});

  // Future<void> _registerUser(BuildContext context) async {
  //   var url = Uri.parse('https://jsonplaceholder.typicode.com/albumsignup/1'); // Ganti dengan URL endpoint untuk pendaftaran

  //   // Data yang akan dikirim sebagai body request (dalam bentuk JSON)
  //   var data = {
  //     'username': 'username',
  //     'email': 'email@example.com',
  //     'password': 'password',
  //     // tambahkan data lainnya sesuai kebutuhan, seperti nama, tanggal lahir, dsb.
  //   };

  //   // Kirim POST request
  //   var response = await http.post(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(data),
  //   );

  //   // Respon dari server
  //   if (response.statusCode == 200) {
  //     // Jika pendaftaran berhasil, arahkan pengguna ke halaman profil
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => ProfilePage()),
  //     );
  //   } else {
  //     // Jika pendaftaran gagal, tampilkan pesan kesalahan
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Pendaftaran gagal!'),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Image.asset('assets/img/HaloTani.png', width: 200, height: 200,),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Buat akun Anda",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFaadfc0).withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFaadfc0).withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFaadfc0).withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Konfirmasi Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Color(0xFFaadfc0).withOpacity(0.1),
                        filled: true,
                        prefixIcon: Icon(Icons.password),
                      ),
                      obscureText: true,
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 3, left: 3),
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfilePage()),
                        );
                      },
                    child: Text(
                      "Daftar",
                      style: TextStyle(fontSize: 20, color: Color(0xFF447D5C)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color(0xFFaadfc0),
                    ),
                  ),
                ),
                Center(child: Text("Atau")),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0xFFaadfc0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/loginsignup.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 18),
                        Text(
                          "Daftar dengan Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF447D5C),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        "Masuk",
                        style: TextStyle(color: Color(0xFF447D5C)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
