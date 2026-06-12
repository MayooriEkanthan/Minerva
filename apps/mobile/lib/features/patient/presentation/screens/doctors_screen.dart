import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../widgets/doctor_card.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
        title: const Row(
          children: [
            MinervaLogo(size: 32, showText: false),
            SizedBox(width: 8),
            Text(
              'Doctors',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Curvy pink background
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctors, specialties...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          
          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(child: _buildFilterDropdown('Category')),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterDropdown('Experience')),
                const SizedBox(width: 8),
                Expanded(child: _buildFilterDropdown('Rate')),
              ],
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Grid
          GridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              DoctorCard(
                name: 'Dr. Anya',
                specialty: 'Gynecology',
                rating: 4.9,
                reviews: '1.2K',
                hourlyRate: '\$80/hr',
                onBook: () => context.push('/doctor-profile'),
              ),
              DoctorCard(
                name: 'Dr. Sarah',
                specialty: 'Pediatrics',
                rating: 4.7,
                reviews: '950',
                hourlyRate: '\$75/hr',
                onBook: () {},
              ),
              DoctorCard(
                name: 'Dr. Anna Chen',
                specialty: 'Endocrinology',
                rating: 4.8,
                reviews: '1.5K',
                hourlyRate: '\$90/hr',
                onBook: () {},
              ),
              DoctorCard(
                name: 'Dr. Lisa Brown',
                specialty: 'Dermatology',
                rating: 4.6,
                reviews: '800',
                hourlyRate: '\$85/hr',
                onBook: () {},
              ),
              DoctorCard(
                name: 'Dr. Sophia Lee',
                specialty: 'Nutrition',
                rating: 4.9,
                reviews: '1.1K',
                hourlyRate: '\$70/hr',
                onBook: () {},
              ),
              DoctorCard(
                name: 'Dr. John Doe',
                specialty: 'Psychology',
                rating: 4.7,
                reviews: '1.3K',
                hourlyRate: '\$95/hr',
                onBook: () {},
              ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              hint,
              style: TextStyle(
                color: AppTheme.textSecondary.withOpacity(0.8),
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary.withOpacity(0.6), size: 16),
        ],
      ),
    );
  }
}
