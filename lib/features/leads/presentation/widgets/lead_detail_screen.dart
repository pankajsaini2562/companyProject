import 'package:flutter/material.dart';

class LeadDetailsScreen extends StatelessWidget {
  const LeadDetailsScreen({super.key, required Map<String, dynamic> lead});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
          "Lead NO.X",
          style: TextStyle(
            color: Colors.white, // 👈 title white
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _textField("Amit Patel"),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(child: _textField("10:00 AM")),
                const SizedBox(width: 8),
                Expanded(child: _textField("Thursday")),
              ],
            ),
            const SizedBox(height: 8),

            _textField("Personal Loan", highlighted: true),
            const SizedBox(height: 8),

            _textField("Facebook"),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(child: _chipField("Initial Contact")),
                const SizedBox(width: 8),
                Expanded(child: _chipField("Score: 68")),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(child: _textField("36")),
                const SizedBox(width: 8),
                Expanded(child: _textField("Male")),
              ],
            ),
            const SizedBox(height: 8),

            _textField("amitpatel@gmail.com"),
            const SizedBox(height: 8),

            _textField("8045X XXXXX"),
            const SizedBox(height: 12),

            _infoBox(),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4B2C83),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text("Edit Documents"),
              ),
            ),

            const SizedBox(height: 12),
            const Text(
              "*A lead without update for more than 10 days will automatically be marked as cold lead.",
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(String text, {bool highlighted = false}) {
    return TextField(
      enabled: false,
      decoration: InputDecoration(
        hintText: text,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: highlighted
              ? const BorderSide(color: Colors.blue, width: 2)
              : BorderSide.none,
        ),
      ),
    );
  }

  Widget _chipField(String text) {
    return Container(
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text),
    );
  }

  Widget _infoBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        "The Client enquired about the details of personal loan.\n"
        "Contact via: Facebook DMs\n"
        "Conversation duration: 23 mins\n"
        "Interest: HIGH\n"
        "Amount needed: 7.5 Lacs\n"
        "Address: 103, Shakti Nagar, Meerut\n"
        "Bank: PNB\n"
        "Nearest Bank available: 4 km",
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
