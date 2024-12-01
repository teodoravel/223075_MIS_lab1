import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner
      title: 'Clothing Shop',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ClothingListScreen(), // Initial screen
    );
  }
}

class ClothingItem {
  final String name;
  final String image;
  final String description;
  final double price;

  ClothingItem({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

// List of clothing items
final List<ClothingItem> clothingItems = [
  ClothingItem(
    name: 'T-Shirt',
    image: 'assets/images/tshirt.png',
    description: 'A comfortable cotton T-shirt.',
    price: 15.99,
  ),
  ClothingItem(
    name: 'Jeans',
    image: 'assets/images/jeans.png',
    description: 'Stylish blue denim jeans.',
    price: 45.99,
  ),
  ClothingItem(
    name: 'Jacket',
    image: 'assets/images/jacket.png',
    description: 'A warm winter jacket.',
    price: 79.99,
  ),
];

class ClothingListScreen extends StatelessWidget {
  const ClothingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('223075'),
      ),
      body: ListView.builder(
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          final item = clothingItems[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(item.image, width: 50, height: 50),
              title: Text(item.name),
              subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClothingDetailScreen(item: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ClothingDetailScreen extends StatelessWidget {
  final ClothingItem item;

  const ClothingDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(item.image, width: 150, height: 150),
            ),
            const SizedBox(height: 20),
            Text(
              item.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(item.description),
            const SizedBox(height: 20),
            Text(
              'Price: \$${item.price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
