import 'package:flutter/material.dart';
import 'package:kuis/models/menu_item.dart';

class OrderPage extends StatefulWidget {
  final MenuItem menuItem;
  const OrderPage({super.key, required this.menuItem});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController _jumlahController = TextEditingController(
    text: '0',
  );
  int _jumlah = 0;
  int _totalHarga = 0;

  void _ubahJumlah(int x) {
    setState(() {
      _jumlah = (_jumlah + x);
      _jumlahController.text = _jumlah.toString();
    });
  }

  void _hitungTotal() {
    final input = int.tryParse(_jumlahController.text.trim());
    if (input == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Masukkan jumlah pesanan.'),
        ),
      );
      return;
    }

    if (input < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Masukkan jumlah pesanan yang valid.'),
        ),
      );
      return;
    }
    setState(() {
      _jumlah = input;
      _totalHarga = _jumlah * widget.menuItem.price;
    });
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

  @override // dispose untuk hapus controller saat page ditutup, biar ga memory leak
  void dispose() {
    _jumlahController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 251, 229),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 91, 6),
        foregroundColor: Colors.white,
        title: const Text(
          'Detail Order',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(
                widget.menuItem.imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.menuItem.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Harga:  ${_formatPrice(widget.menuItem.price)}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 91, 6),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 251, 229),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Tersedia',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 91, 6),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Masukkan jumlah',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _jumlahController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 232, 251, 229),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () => _ubahJumlah(-1),
                            icon: const Icon(
                              Icons.remove,
                              color: Color.fromARGB(114, 0, 0, 0),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _ubahJumlah(1),
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromARGB(114, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.left,
                  ),

                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _hitungTotal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 91, 6),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 120),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 91, 6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Harga:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatPrice(_totalHarga),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
