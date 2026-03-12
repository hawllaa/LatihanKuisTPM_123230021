import 'package:cobakuis/pages/detail_order.dart';
import 'package:cobakuis/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> menuList = const [
    {
      "name": "Udang Goreng\nSaus Asam Mentega",
      "price": "Rp. 30.000",
      "image": "assets/udang.jpeg",
    },
    {
      "name": "Spaghetti Daging\nPedas Ala Lesserafim",
      "price": "Rp. 20.000",
      "image": "assets/spaghetti.jpeg",
    },
    {
      "name": "Ramyeon\nBaemon Gallae",
      "price": "Rp. 22.000",
      "image": "assets/ramyeon.jpeg",
    },
    {
      "name": "Nasi Goreng Telur\nSederhana Rumahan",
      "price": "Rp. 25.000",
      "image": "assets/nasgor.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                color: const Color(0xFFFFF9E3), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hai Kak!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2B468B), 
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                        (route) => false);
                      },
                      child: const Icon(
                        Icons.logout_rounded,
                        color: Color(0xFF2B468B),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 160,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/banner_pesan.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.72, 
                  ),
                  itemBuilder: (context, index) {
                    final item = menuList[index];
                    return _buildMenuCard(context, item);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF9E3),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              item['image']!,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),

          Expanded(
            child: Text(
              item['name']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF2B468B),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Text(
            item['price']!,
            style: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Color(0xFF5A81D8),
            ),
          ),
          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: item['name']!,
                      price: item['price']!,
                      image: item['image']!,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC6D3),
                elevation: 0,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "Pesan",
                style: TextStyle(
                  color: Color(0xFFE56E8D),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}