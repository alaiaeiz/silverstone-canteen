import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/format_rupiah.dart';
import '../widgets/app_text.dart';
import 'detail_menu_page.dart';
import 'tambah_menu_page.dart';

class DaftarMenuPage extends StatefulWidget {
  const DaftarMenuPage({super.key});

  @override
  State<DaftarMenuPage> createState() => _DaftarMenuPageState();
}

class _DaftarMenuPageState extends State<DaftarMenuPage> {
  final List<Map<String, dynamic>> _menus = [
    {'nama': 'Gulai Tikungan', 'harga': 10000, 'ikon': Icons.dinner_dining_outlined},
    {'nama': 'Bakmi Jaksel', 'harga': 22000, 'ikon': Icons.ramen_dining_outlined},
    {'nama': 'Bakso Sapi', 'harga': 12000, 'ikon': Icons.soup_kitchen_outlined},
    {'nama': 'Nasi Tamago', 'harga': 10000, 'ikon': Icons.rice_bowl_outlined},
    {'nama': 'Susu Murni Bahagia', 'harga': 20000, 'ikon': Icons.local_drink_outlined},
    {'nama': 'Cheesecuit', 'harga': 30000, 'ikon': Icons.cookie_outlined},
  ];

  Future<void> _bukaTambahMenu() async {
    final hasil = await Get.to(() => const TambahMenuPage());
    if (hasil is Map<String, dynamic>) {
      setState(() {
        _menus.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Silverstone Canteen',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppText(
              'Today\'s Available Menu',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menus.length,
              itemBuilder: (context, index) {
                final menu = _menus[index];
                final IconData ikon = menu['ikon'] ?? Icons.restaurant_menu;
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Icon(ikon),
                    title: AppText(
                      menu['nama'],
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    subtitle: AppText(
                      formatRupiah(menu['harga']),
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.to(
                        () => DetailMenuPage(
                          nama: menu['nama'],
                          harga: menu['harga'],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}