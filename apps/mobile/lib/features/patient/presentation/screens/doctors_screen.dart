import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/minerva_logo.dart';
import '../widgets/doctor_card.dart';

class _Doctor {
  final String name;
  final String specialty;
  final double rating;
  final String reviews;
  final int hourlyRate;
  final int experienceYears;

  _Doctor(this.name, this.specialty, this.rating, this.reviews, this.hourlyRate, this.experienceYears);
}

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  final List<_Doctor> _allDoctors = [
    _Doctor('Dr. Anya', 'Gynecology', 4.9, '1.2K', 1200, 10),
    _Doctor('Dr. Sarah', 'Pediatrics', 4.7, '950', 1400, 5),
    _Doctor('Dr. Anna Chen', 'Endocrinology', 4.8, '1.5K', 1250, 15),
    _Doctor('Dr. Lisa Brown', 'Dermatology', 4.6, '800', 1000, 3),
    _Doctor('Dr. Sophia Lee', 'Nutrition', 4.9, '1.1K', 1100, 8),
    _Doctor('Dr. John Doe', 'Psychology', 4.7, '1.3K', 1500, 12),
  ];

  String _selectedCategory = 'Any';
  String _selectedExperience = 'Any';
  String _selectedRate = 'Any';
  String _searchQuery = '';

  List<String> get _categories => ['Any', 'Gynecology', 'Pediatrics', 'Endocrinology', 'Dermatology', 'Nutrition', 'Psychology'];
  List<String> get _experienceSorts => ['Any', 'High to Low', 'Low to High'];
  List<String> get _rateSorts => ['Any', 'High to Low', 'Low to High'];

  List<_Doctor> get _filteredDoctors {
    List<_Doctor> docs = List.from(_allDoctors);

    if (_searchQuery.isNotEmpty) {
      docs = docs.where((d) => 
        d.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        d.specialty.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }

    if (_selectedCategory != 'Any') {
      docs = docs.where((d) => d.specialty == _selectedCategory).toList();
    }

    if (_selectedExperience != 'Any') {
      if (_selectedExperience == 'High to Low') {
        docs.sort((a, b) => b.experienceYears.compareTo(a.experienceYears));
      } else {
        docs.sort((a, b) => a.experienceYears.compareTo(b.experienceYears));
      }
    }

    if (_selectedRate != 'Any') {
      if (_selectedRate == 'High to Low') {
        docs.sort((a, b) => b.hourlyRate.compareTo(a.hourlyRate));
      } else {
        docs.sort((a, b) => a.hourlyRate.compareTo(b.hourlyRate));
      }
    }

    return docs;
  }

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
                      child: TextField(
                        onChanged: (val) {
                          setState(() {
                            _searchQuery = val;
                          });
                        },
                        decoration: const InputDecoration(
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
                        Expanded(child: _buildFilterDropdown('Category', _selectedCategory, _categories, (val) => setState(() => _selectedCategory = val))),
                        const SizedBox(width: 8),
                        Expanded(child: _buildFilterDropdown('Experience', _selectedExperience, _experienceSorts, (val) => setState(() => _selectedExperience = val))),
                        const SizedBox(width: 8),
                        Expanded(child: _buildFilterDropdown('Rate', _selectedRate, _rateSorts, (val) => setState(() => _selectedRate = val))),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Grid
                  if (_filteredDoctors.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(
                        child: Text(
                          'No doctors found matching your criteria.',
                          style: TextStyle(color: AppTheme.textSecondary, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = _filteredDoctors[index];
                        return DoctorCard(
                          name: doctor.name,
                          specialty: doctor.specialty,
                          rating: doctor.rating,
                          reviews: doctor.reviews,
                          hourlyRate: '${doctor.hourlyRate}/- per hr',
                          onBook: () => context.push('/doctor-profile', extra: {
                            'name': doctor.name,
                            'specialty': doctor.specialty,
                            'experience': doctor.experienceYears,
                            'rating': doctor.rating,
                            'reviews': doctor.reviews,
                            'hourlyRate': doctor.hourlyRate.toDouble(),
                          }),
                        );
                      },
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

  Widget _buildFilterDropdown(String title, String currentValue, List<String> options, ValueChanged<String> onChanged) {
    return PopupMenuButton<String>(
      onSelected: onChanged,
      itemBuilder: (BuildContext context) {
        return options.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice,
              style: TextStyle(
                color: currentValue == choice ? AppTheme.primaryColor : AppTheme.textSecondary,
                fontWeight: currentValue == choice ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppTheme.textSecondary.withOpacity(0.6),
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currentValue,
                    style: TextStyle(
                      color: currentValue == 'Any' ? AppTheme.textSecondary.withOpacity(0.8) : AppTheme.primaryColor,
                      fontWeight: currentValue == 'Any' ? FontWeight.normal : FontWeight.bold,
                      fontSize: 12,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: AppTheme.textSecondary.withOpacity(0.6), size: 16),
          ],
        ),
      ),
    );
  }
}
