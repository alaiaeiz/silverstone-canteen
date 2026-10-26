import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';
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
    {'nama': 'Nasi Goreng Bakso', 'harga': 15000, 'ikon': Icons.rice_bowl_outlined},
    {'nama': 'Es Teh Manis', 'harga': 5000, 'ikon': Icons.local_cafe_outlined},
    {'nama': 'Ayam Geprek Sambal Bawang', 'harga': 18000, 'ikon': Icons.ramen_dining_outlined},
    {'nama': 'Kopi Susu Gula Aren', 'harga': 20000, 'ikon': Icons.coffee_outlined},
    {'nama': 'Mie Ayam Pangsit', 'harga': 13000, 'ikon': Icons.ramen_dining_outlined},
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
          fontSize: 26,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: AppText(
              "This Week's Menu",
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menus.length,
              itemBuilder: (context, index) {
                final menu = _menus[index];
                final IconData ikon =
                    menu['ikon'] ?? Icons.restaurant_outlined;

                return Card(
                  elevation: 0,
                  color: AppColors.paper,
                  surfaceTintColor: Colors.transparent,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.ink, width: 2),
                  ),
                  margin: EdgeInsets.fromLTRB(
                    index.isOdd ? 28 : 16,
                    6,
                    16,
                    6,
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    leading: Icon(ikon, size: 36),
                    title: AppText(
                      menu['nama'],
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.ink,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: AppText(
                      formatRupiah(menu['harga']),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.orange,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Get.to(
                        () => DetailMenuPage(
                          nama: menu['nama'],
                          harga: menu['harga'],
                          ikon: ikon,
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
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}