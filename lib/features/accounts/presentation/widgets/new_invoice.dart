import 'package:flutter/material.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B1B6E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Invoice", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 380,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                const SizedBox(height: 16),
                _invoiceInfo(),
                const SizedBox(height: 16),
                _clientCompanyInfo(),
                const SizedBox(height: 16),
                _table(),
                const SizedBox(height: 16),
                _paymentInfo(),
                const SizedBox(height: 24),
                _signature(),
                const SizedBox(height: 24),
                _downloadButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "INVOICE",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          child: const Text(
            "App\nLogo",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _invoiceInfo() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Invoice Number"),
            Text("Date of Issue"),
            Text("Payment Terms"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(": #INV-001"),
            Text(": 12 Sep 2024"),
            Text(": Net 30"),
          ],
        ),
      ],
    );
  }

  Widget _clientCompanyInfo() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Client Name"),
            Text("Company Name"),
            Text("Email Address"),
            Text("Phone Number"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Company Name"),
            Text("Company Address"),
            Text("contact@email.com"),
            Text("654789"),
          ],
        ),
      ],
    );
  }

  Widget _table() {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
      },
      children: [
        _tableRow(["Description", "Taxed", "Amount"], isHeader: true),
        _tableRow(["Consultation Fee", "", ""]),
        _tableRow(["Commission", "", ""]),
        _tableRow(["Loan Amount", "", ""]),
        _tableRow(["Total Amount", "", ""]),
      ],
    );
  }

  TableRow _tableRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      children: cells.map((text) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _paymentInfo() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Methods: UPI, Bank Transfer, Credit/Debit Card"),
        SizedBox(height: 8),
        Text("Bank Details"),
        Text("Account Name"),
        Text("Bank Name"),
        Text("Account Number"),
        Text("IFSC Code"),
      ],
    );
  }

  Widget _signature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Authority Signature"),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey),
          ),
          child: const Text(
            "Digital\nSignature",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _downloadButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3B1B6E),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {},
        child: const Text("Download PDF"),
      ),
    );
  }
}
