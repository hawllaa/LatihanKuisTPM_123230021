import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String price;
  final String image;

  const DetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _jumlahController = TextEditingController();
  int _totalHarga = 0;

  void _hitungTotal() {
    int hargaSatuan = int.parse(widget.price.replaceAll(RegExp(r'[^0-9]'), ''));
    int jumlah = int.tryParse(_jumlahController.text) ?? 0;

    setState(() {
      _totalHarga = hargaSatuan * jumlah;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                color: const Color(0xFFFEF5D7),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF2D4990)),
                      onPressed: () => Navigator.pop(context), 
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Detail Pesanan",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D4990),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), 
                  ],
                ),
              ),

              Image.asset(
                widget.image,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),

              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D4990),
                ),
              ),
              const SizedBox(height: 5),

              Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7BAAF1), 
                ),
              ),
              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF5D7), 
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _jumlahController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Masukkan Jumlah Pesanan", 
                        labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                        floatingLabelStyle: const TextStyle(color: Color.fromARGB(255, 249, 131, 168), fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                    ),
                  ),
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _hitungTotal, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFC0CB),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  "Tambahkan",
                  style: TextStyle(
                    color: Color.fromARGB(255, 236, 71, 126),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "Total Harga Rp. $_totalHarga",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}