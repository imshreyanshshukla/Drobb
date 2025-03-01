import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Core Contour Bodysuit Blush',
      'brand': 'Hello Molly',
      'price': 35,
      'arrival': 'Estimated arrival Jan 27 - Jan 31'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Malvina Linen Dress',
      'brand': 'Reformation',
      'price': 248,
      'arrival': 'Estimated arrival Jan 27 - Feb 03'
    },
    {
      'image': 'https://via.placeholder.com/150',
      'title': 'Corset top',
      'brand': 'Bershka',
      'price': 36,
      'arrival': 'Estimated arrival Jan 27 - Jan 31'
    },
  ];

  @override
  Widget build(BuildContext context) {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item['price']);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('My Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        leading: TextButton(
          onPressed: () {},
          child: const Text('Clear', style: TextStyle(color: Colors.blue)),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('FAQs', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Subtotal:', style: TextStyle(fontSize: 16)),
                Text('\$${subtotal.toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item['image'],
                              width: 80,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item['title'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(height: 4),
                                Text(item['brand'],
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 8),
                                DropdownButton<String>(
                                  hint: const Text('Size:'),
                                  items: ['XS', 'S', 'M', 'L', 'XL']
                                      .map((size) => DropdownMenuItem(
                                          value: size, child: Text(size)))
                                      .toList(),
                                  onChanged: (value) {},
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {}),
                                    const Text('1',
                                        style: TextStyle(fontSize: 16)),
                                    IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {}),
                                    const Spacer(),
                                    IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {}),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.local_shipping_outlined,
                                        size: 16, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(item['arrival'],
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('\$${item['price']}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.grey[200],
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Find the best deal',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
