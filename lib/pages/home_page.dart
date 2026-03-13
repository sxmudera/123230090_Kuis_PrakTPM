import 'package:flutter/material.dart';
import 'package:kuis/data/listmenu.dart';
import 'package:kuis/models/menu_item.dart';
import 'package:kuis/pages/about_page.dart';
import 'package:kuis/pages/login_page.dart';
import 'package:kuis/pages/order_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void _goToOrder(BuildContext context, Map<String, dynamic> menu) {
    final item = MenuItem(
      name: menu['name'],
      price: menu['price'],
      imageUrl: menu['imageUrl'],
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => OrderPage(menuItem: item)),
    );
  }

  String _formatPrice(int price) {
    String result = price.toString();
    String formatted = '';
    int count = 0;
    for (int i = result.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) formatted = '.$formatted';
      formatted = result[i] + formatted;
      count++;
    }
    return 'Rp $formatted';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 91, 6),
        title: Text('Home Page', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Text(
              'Selamat datang, $username! ',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 0, 91, 6),
            ),
            child: Text('Klik untuk ke halaman About!'),
          ),

          const SizedBox(height: 15),

          Center(
            child: const Text(
              'Daftar Menu',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          const SizedBox(height: 12),

          GridView.builder(
            itemCount: menuList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 40,
              childAspectRatio: 1.7,
            ),
            itemBuilder: (context, index) {
              final menu = menuList[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(141, 0, 0, 0),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        menu['imageUrl'],
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu['name'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _formatPrice(menu['price']),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 91, 6),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: double.infinity,
                            height: 39,
                            child: ElevatedButton(
                              onPressed: () => _goToOrder(context, menu),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 0, 91, 6),
                                foregroundColor: Colors.white,
                              ),
                              child: const Text(
                                'Pesan',
                                style: TextStyle(fontSize: 13),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
