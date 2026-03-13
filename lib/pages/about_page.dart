import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 91, 6),
        foregroundColor: Colors.white,
        title: const Text(
          'About Page',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            ClipRRect(
              child: Image.asset('assets/img/customerService.png', height: 160),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                'Ini adalah halaman About',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 0, 91, 6),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text('Pertanyaan Umum (FAQ)'),
            Text(
              'Temukan jawaban atas berbagai pertanyaan yang sering ditanyakan oleh pengguna mengenai penggunaan aplikasi ini. Dari proses pendaftaran, cara membeli barang, hingga pengaturan akun, semua jawaban ada di sini untuk mempermudah pengalaman Anda.',
            ),

            const SizedBox(height: 20),

            Text('Panduan Penggunaan'),
            Text(
              'Pelajari langkah demi langkah cara menggunakan fitur-fitur aplikasi kami. Panduan ini akan membantu Anda memahami bagaimana memaksimalkan penggunaan aplikasi, mulai dari mencari produk hingga menyelesaikan transaksi dengan mudah.',
            ),

            const SizedBox(height: 20),

            Text('Kontak Dukungan'),
            Text(
              'Jika Anda membutuhkan bantuan lebih lanjut, tim dukungan kami siap membantu. Anda dapat menghubungi kami melalui email, telepon, atau live chat. Kami berkomitmen untuk memberikan solusi terbaik bagi setiap masalah atau pertanyaan yang Anda miliki.',
            ),
          ],
        ),
      ),
    );
  }
}
