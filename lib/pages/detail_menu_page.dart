import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/format_rupiah.dart';
import '../widgets/app_text.dart';

class DetailMenuPage extends StatelessWidget {
  final String nama;
  final int harga;
  final IconData ikon;

  const DetailMenuPage({
    super.key,
    required this.nama,
    required this.harga,
    this.ikon = Icons.restaurant, // cadangan kalau ikon tidak dikirim
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Detail Menu',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(ikon, size: 80),
            const SizedBox(height: 16),
            AppText(nama, fontSize: 22, fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
            AppText(formatRupiah(harga), fontSize: 18),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}