import 'package:shop_app/auth/components/my_receipt.dart';
import 'package:shop_app/auth/pages/shop_page.dart';
import 'package:flutter/material.dart';

class DeliveryProgressPage extends StatelessWidget {
  final String cardHolderName;

  const DeliveryProgressPage({super.key, required this.cardHolderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Progress'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false, // Αφαιρεί το προεπιλεγμένο κουμπί πίσω
      ),
      body: Column(
        children: [
          const MyReceipt(),
          ElevatedButton(
            onPressed: () {
              // Μετάβαση στη σελίδα καταστήματος όταν πατηθεί το κουμπί
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopPage(),
                ),
              );
            },
            child: const Text('Επιστροφή στο Κατάστημα'),
          ),
        ],
      ),
    );
  }
}
