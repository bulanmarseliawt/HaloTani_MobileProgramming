import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart'; // Import ikon dari Line Awesome
import 'package:get/get.dart'; // Import GetX untuk manajemen state

// Konstanta yang digunakan dalam aplikasi
const tProfile = 'Edit Profile';
const tProfileImage = 'assets/img/profile.jpg';
const tPrimaryColor = Color.fromRGBO(170, 223, 192, 1);
const tDefaultSize = 16.0;
const tEditProfile = 'Edit Profile';
const tFullName = 'Full Name';
const tEmail = 'Email';
const tPhoneNo = 'Phone No';
const tPassword = 'Password';
const tFormHeight = 20.0;
const tJoined = 'Joined ';
const tJoinedAt = 'March 2024';
const tDelete = 'Delete';

// Controller untuk manajemen profil (gunakan GetX)
class ProfileController extends GetxController {}

// Widget untuk layar pembaruan profil
class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController()); // Menggunakan controller untuk manajemen state
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)), // Tombol kembali
        title: Text(tProfile, style: Theme.of(context).textTheme.headline4), // Judul aplikasi
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // -- GAMBAR dengan ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tProfileImage))), // Gambar profil
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100), color: tPrimaryColor),
                      child: const Icon(LineAwesomeIcons.camera, color: Colors.black, size: 20), // Tombol kamera untuk mengubah profil
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Kolom Isian Form
              Form(
                child: Column(
                  children: [
                    // Kolom isian nama lengkap
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tFullName), prefixIcon: Icon(LineAwesomeIcons.user)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    // Kolom isian email
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tEmail), prefixIcon: Icon(LineAwesomeIcons.envelope_1)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    // Kolom isian nomor telepon
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tPhoneNo), prefixIcon: Icon(LineAwesomeIcons.phone)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    // Kolom isian password
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text(tPassword),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon:
                        IconButton(icon: const Icon(LineAwesomeIcons.eye_slash), onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: tFormHeight),

                    // -- Tombol untuk Mengirimkan Form
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const UpdateProfileScreen()), // Navigasi ke layar pembaruan profil
                        style: ElevatedButton.styleFrom(
                            backgroundColor: tPrimaryColor,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text(tEditProfile, style: TextStyle(color: Colors.white)), // Teks tombol untuk mengedit profil
                      ),
                    ),
                    const SizedBox(height: tFormHeight),

                    // -- Tanggal Pembuatan Profil dan Tombol Hapus
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: tJoined,
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                  text: tJoinedAt,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)) // Tanggal bergabung dengan aplikasi
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 4, 82, 44).withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: const Color.fromARGB(255, 4, 82, 44),
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(tDelete), // Teks tombol untuk menghapus profil
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
