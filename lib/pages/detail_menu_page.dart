import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';
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
    this.ikon = Icons.restaurant_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'Detail Menu',
          fontSize: 26,
          fontWeight: FontWeight.w800,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(ikon, size: 40, color: AppColors.orange),
            const SizedBox(height: 12),
            AppText(
              nama,
              fontSize: 44,
              fontWeight: FontWeight.w800,
              color: AppColors.ink,
            ),
            const Spacer(),
            Transform.rotate(
              angle: -0.04,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lime,
                  border: Border.all(color: AppColors.ink, width: 2),
                ),
                child: AppText(
                  formatRupiah(harga),
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                child: const AppText('kembali', fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}