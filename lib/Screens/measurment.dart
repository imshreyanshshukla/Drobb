import 'package:drobb/Screens/mainScreen.dart';
import 'package:flutter/material.dart';

class MeasurementsScreen extends StatefulWidget {
  @override
  _MeasurementsScreenState createState() => _MeasurementsScreenState();
}

class _MeasurementsScreenState extends State<MeasurementsScreen> {
  int hip = 41;
  int waist = 32;
  int bust = 39;
  String fitPreference = "True to Size";

  void updateMeasurement(String type, int change) {
    setState(() {
      if (type == "Hip") hip += change;
      if (type == "Waist") waist += change;
      if (type == "Bust") bust += change;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            Row(
              children: List.generate(8, (index) {
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    height: 5,
                    decoration: BoxDecoration(
                      color: index == 6 ? Colors.black : Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Measurements",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Rounded to the nearest inch",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            Column(
              children: ["Hip", "Waist", "Bust"].map((type) {
                int value = (type == "Hip")
                    ? hip
                    : (type == "Waist")
                        ? waist
                        : bust;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              onPressed: () => updateMeasurement(type, -1),
                              icon: Icon(Icons.remove, color: Colors.black),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "$value",
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey[300],
                            child: IconButton(
                              onPressed: () => updateMeasurement(type, 1),
                              icon: Icon(Icons.add, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Text(
              "My preferred fit is...",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["Tight", "True to Size", "Oversized"].map((fit) {
                return Expanded(
                  // Ensures equal button width without overflow
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          fitPreference = fit;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            fitPreference == fit ? Colors.black : Colors.white,
                        foregroundColor:
                            fitPreference == fit ? Colors.white : Colors.black,
                        side: BorderSide(color: Colors.black),
                        padding: EdgeInsets.symmetric(
                            vertical: 12), // Keeps button height consistent
                      ),
                      child: Text(
                        fit,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14), // Uniform font size
                        overflow:
                            TextOverflow.ellipsis, // Prevents multi-line text
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {},
                ),
                Text("Only show items available in my size"),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SwipeableProductScreen()));
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text("Continue", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
