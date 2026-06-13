import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/primary_button.dart';

class PaymentCheckoutScreen extends StatefulWidget {
  final String doctorName;
  final double hourlyRate;

  const PaymentCheckoutScreen({
    super.key,
    this.doctorName = 'Dr. Anya Sharma',
    this.hourlyRate = 1500.0,
  });

  @override
  State<PaymentCheckoutScreen> createState() => _PaymentCheckoutScreenState();
}

class _PaymentCheckoutScreenState extends State<PaymentCheckoutScreen> {
  String _selectedMethod = 'card'; // 'apple', 'google', 'card'
  double _selectedDuration = 0.5; // Default to 30 mins

  @override
  Widget build(BuildContext context) {
    final double doctorFee = widget.hourlyRate * _selectedDuration;
    const double minervaFee = 200.0;
    final double totalAmount = doctorFee + minervaFee;

    String durationText = '';
    if (_selectedDuration == 0.5) durationText = '30 Min Voice Consultation';
    else if (_selectedDuration == 1.0) durationText = '1 Hour Voice Consultation';
    else if (_selectedDuration == 2.0) durationText = '2 Hours Voice Consultation';

    return Scaffold(
      backgroundColor: AppTheme.surfaceColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.textPrimary),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Payment Summary',
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppTheme.surfaceColor,
                    child: Icon(Icons.person, size: 30, color: AppTheme.textSecondary.withOpacity(0.8)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.doctorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          durationText,
                          style: TextStyle(
                            color: AppTheme.textSecondary.withOpacity(0.8),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Duration Selection
            const Text(
              'Select Consultation Duration',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDurationOption(0.5, '30 Min')),
                const SizedBox(width: 12),
                Expanded(child: _buildDurationOption(1.0, '1 Hour')),
                const SizedBox(width: 12),
                Expanded(child: _buildDurationOption(2.0, '2 Hours')),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '* Minimum charge is 30 minutes. You can end the call earlier, but the base fee applies.',
              style: TextStyle(color: Color(0xFF424242), fontSize: 12),
            ),
            const SizedBox(height: 32),

            // Cost Breakdown
            const Text(
              'Payment Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildCostRow('Doctor Consultation Fee', 'LKR $doctorFee'),
                  const SizedBox(height: 12),
                  _buildCostRow('Minerva Platform Charge', 'LKR $minervaFee', isFee: true),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Divider(color: AppTheme.surfaceColor, thickness: 2),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Payment',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      Text(
                        'LKR $totalAmount',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Payment Methods
            const Text(
              'Select Payment Method',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            _buildPaymentMethodOption(
              'card',
              'Credit / Debit Card',
              Icons.credit_card,
            ),
            const SizedBox(height: 12),
            _buildPaymentMethodOption(
              'google',
              'Google Pay',
              Icons.g_mobiledata, // Placeholder icon
            ),
            const SizedBox(height: 12),
            _buildPaymentMethodOption(
              'apple',
              'Apple Pay',
              Icons.apple,
            ),
            const SizedBox(height: 40),

            // Pay Button
            PrimaryButton(
              text: 'Proceed to Pay LKR $totalAmount',
              onPressed: () {
                if (_selectedMethod == 'card') {
                  context.push('/payment-card');
                } else if (_selectedMethod == 'google') {
                  context.push('/payment-gpay');
                } else if (_selectedMethod == 'apple') {
                  context.push('/payment-apple');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationOption(double duration, String label) {
    final isSelected = _selectedDuration == duration;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDuration = duration;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.primaryColor,
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCostRow(String label, String amount, {bool isFee = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isFee ? AppTheme.textSecondary : AppTheme.textSecondary.withOpacity(0.8),
            fontWeight: isFee ? FontWeight.w500 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontWeight: isFee ? FontWeight.w500 : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodOption(String id, String name, IconData icon) {
    final isSelected = _selectedMethod == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary.withOpacity(0.8)),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppTheme.primaryColor),
          ],
        ),
      ),
    );
  }
}
