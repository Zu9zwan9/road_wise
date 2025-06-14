import 'package:flutter/material.dart';

class ProvinceSelectionScreen extends StatefulWidget {
  const ProvinceSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ProvinceSelectionScreen> createState() =>
      _ProvinceSelectionScreenState();
}

class _ProvinceSelectionScreenState extends State<ProvinceSelectionScreen> {
  String? selectedProvince;
  final List<String> provinces = [
    'Alberta',
    'British Columbia',
    'Manitoba',
    'New Brunswick',
    'Newfoundland and Labrador',
    'Northwest Territories',
    'Nova Scotia',
    'Nunavut',
    'Ontario',
    'Prince Edward Island',
    'Quebec',
    'Saskatchewan',
    'Yukon',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Your Province')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Please select your province',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'We\'ll customize your learning experience based on your province\'s specific road rules and signs.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: provinces.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final province = provinces[index];
                  return ListTile(
                    title: Text(province),
                    trailing: selectedProvince == province
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                    onTap: () {
                      setState(() {
                        selectedProvince = province;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedProvince != null
                    ? () {
                        // Save province selection and navigate to dashboard
                        Navigator.of(
                          context,
                        ).pushReplacementNamed('/dashboard');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
