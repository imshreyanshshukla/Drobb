import 'package:drobb/Screens/notificationPermission.dart';
import 'package:flutter/material.dart';

class PricePreferencesScreen extends StatefulWidget {
  const PricePreferencesScreen({super.key});

  @override
  _PricePreferencesScreenState createState() => _PricePreferencesScreenState();
}

class _PricePreferencesScreenState extends State<PricePreferencesScreen> {
  List<String> selectedPrices = []; // Track selected price ranges

  final List<String> priceRanges = [
    "0-500",
    "500-1000",
    "1000-2000",
    "2000-3000",
    "3000-5000",
    "5000+"
  ];

  void toggleSelection(String price) {
    setState(() {
      if (selectedPrices.contains(price)) {
        selectedPrices.remove(price); // Deselect if already selected
      } else {
        selectedPrices.add(price); // Select if not selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Row(
              children: List.generate(8, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    height: 5,
                    decoration: BoxDecoration(
                      color: index == 3 ? Colors.black : Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Price Preferences",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "This helps curate your feed but doesn't set strict limits",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Price range buttons with dynamic selection
            ...priceRanges.map((price) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          toggleSelection(price), // Toggle on click
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: selectedPrices.contains(price)
                              ? Colors.black
                              : Colors.grey, // Border color based on selection
                        ),
                        backgroundColor: selectedPrices.contains(price)
                            ? Colors.black
                            : Colors
                                .white, // Background color based on selection
                      ),
                      child: Text(
                        price,
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedPrices.contains(price)
                              ? Colors.white
                              : Colors.black, // Text color based on selection
                        ),
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedPrices.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Please select at least one price range.'),
                      ),
                    );
                    return;
                  }
                  // Pass selected prices to next screen or use as per logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(
                          // You can pass selectedPrices here if needed
                          ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
