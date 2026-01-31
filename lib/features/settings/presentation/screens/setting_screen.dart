import 'package:flutter/material.dart';
import 'package:mobile_crm/features/side_menu.dart/side_menu_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Toggles
  bool twoFactorAuth = true;
  bool sessionTimeout = false;
  bool emailNotifications = true;
  bool inAppNotifications = true;
  bool automaticUpdates = false;

  // Dropdown values
  String language = "English";
  String timeZone = "UTC +05:30";
  String dateFormat = "DD/MM/YYYY";
  String currency = "USD";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3D2A7A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchBar(),
            const SizedBox(height: 16),

            _sectionTitle("Account"),
            _infoTile("Username", "raghaveth"),
            _infoTile("Employee ID", "4244"),
            _infoTile("Role", "Admin"),
            _infoTile("Email", "raghav@gmail.com"),

            _sectionTitle("Security and Privacy"),
            _switchTile(
              "Two-Factor Authentication",
              twoFactorAuth,
              (val) => setState(() => twoFactorAuth = val),
            ),
            _switchTile(
              "Session Timeout",
              sessionTimeout,
              (val) => setState(() => sessionTimeout = val),
            ),
            _actionButton("Change Policy"),

            _sectionTitle("Notifications"),
            _switchTile(
              "Email Notification Preferences",
              emailNotifications,
              (val) => setState(() => emailNotifications = val),
            ),
            _switchTile(
              "In-App Notifications",
              inAppNotifications,
              (val) => setState(() => inAppNotifications = val),
            ),
            _switchTile(
              "Automatic Updates",
              automaticUpdates,
              (val) => setState(() => automaticUpdates = val),
            ),

            _sectionTitle("Language and Time"),
            _dropdownTile("Language", language, [
              "English",
              "Hindi",
              "Spanish",
            ], (val) => setState(() => language = val!)),
            _dropdownTile("Time Zone", timeZone, [
              "UTC +05:30",
              "UTC +01:00",
              "UTC -08:00",
            ], (val) => setState(() => timeZone = val!)),
            _dropdownTile("Date Format", dateFormat, [
              "DD/MM/YYYY",
              "MM/DD/YYYY",
            ], (val) => setState(() => dateFormat = val!)),
            _dropdownTile("Currency", currency, [
              "USD",
              "INR",
              "EUR",
            ], (val) => setState(() => currency = val!)),

            _sectionTitle("Permissions"),
            _actionButton("Roles & Permissions"),
            _actionButton("Approval Requests"),
            _actionButton("Request History"),

            _sectionTitle("Advanced Settings"),
            _actionButton("Developer Mode"),
            _actionButton("Performance Optimization"),
            _actionButton("Cache Management"),
            _actionButton("CRM Report"),
            _actionButton("Employee Report"),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ================== Widgets ==================

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Search",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF3D2A7A),
        ),
      ),
    );
  }

  Widget _infoTile(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: _boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _switchTile(String title, bool value, Function(bool) onChanged) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: _boxDecoration(),
      child: SwitchListTile(
        title: Text(title),
        value: value,
        activeColor: const Color(0xFF3D2A7A),
        onChanged: onChanged,
      ),
    );
  }

  Widget _dropdownTile(
    String title,
    String value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: _boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          DropdownButton<String>(
            value: value,
            underline: const SizedBox(),
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D2A7A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    );
  }
}
