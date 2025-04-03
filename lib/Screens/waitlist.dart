import 'package:drobb/Screens/mainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drobb/Screens/pricePreference.dart';
import 'package:flutter/material.dart';

class WaitlistScreen extends StatefulWidget {
  final String selectedPreference;

  const WaitlistScreen({super.key, required this.selectedPreference});

  @override
  _WaitlistScreenState createState() => _WaitlistScreenState();
}

class _WaitlistScreenState extends State<WaitlistScreen> {
  bool isChecked = false;

  void _saveUserData() async {
    final String name = nameController.text.trim();
    final String phone = phoneController.text.trim();
    final String email = emailController.text.trim();

    if (name.isEmpty || email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Name and Email are required!')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('waitlist').doc(email).set({
        'name': name,
        'phone': phone.isEmpty ? "" : phone, // Handle optional phone
        'email': email,
        'preference': widget.selectedPreference, // Added selectedPreference
        'contact_me': isChecked, // Store checkbox value
        'timestamp': FieldValue.serverTimestamp(), // Store entry time
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data saved successfully!')),
      );

      // Navigate only after successful data save
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PricePreferencesScreen(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save data: $e')),
      );
    }
  }

  // ✅ Controllers to capture input
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Row(
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 2),
                      height: 5,
                      decoration: BoxDecoration(
                        color: index == 1 ? Colors.black : Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 50),
              const Text(
                "You're first in line!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Join our ${widget.selectedPreference} Waitlist",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Full Name*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email*",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text("Contact me when the app is ready"),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {
                    // ✅ Pass the collected data to ProfileScreen
                    _saveUserData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PricePreferencesScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
