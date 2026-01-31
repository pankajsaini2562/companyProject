import 'package:flutter/material.dart';

class NewLeadPage extends StatelessWidget {
  const NewLeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3C1E6E),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // 👈 back button white
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Leads",
          style: TextStyle(
            color: Colors.white, // 👈 title white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _inputField('Client’s Name'),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _inputField('2:00 PM')),
                const SizedBox(width: 12),
                Expanded(child: _inputField('Friday')),
              ],
            ),
            const SizedBox(height: 12),

            _inputField('Service Required'),
            const SizedBox(height: 12),

            _inputField('Source'),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _inputField('Stage')),
                const SizedBox(width: 12),
                Expanded(child: _inputField('Score')),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(child: _inputField('Age')),
                const SizedBox(width: 12),
                Expanded(child: _inputField('Gender')),
              ],
            ),
            const SizedBox(height: 12),

            _inputField('Email'),
            const SizedBox(height: 12),

            _inputField('Phone Number'),
            const SizedBox(height: 12),

            _inputField('Details...', maxLines: 4),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3D1B6E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text('Upload Documents'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
