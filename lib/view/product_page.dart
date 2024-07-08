import 'package:flutter/material.dart';
import '../model/errortext.dart';
import '../services/services.dart';
import 'product_details.dart';
import 'productcard.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  static const authservice = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Busty Store',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FutureBuilder(
          future: authservice.fetchProducts(),
          builder: (_, snapshot) {
            return switch (snapshot.connectionState) {
              ConnectionState.waiting =>
                const Center(child: CircularProgressIndicator.adaptive()),
              ConnectionState.done when snapshot.hasError => Expanded(
                  child: Center(child: ErrorText(error: snapshot.error!)),
                ),
              ConnectionState.done when snapshot.hasData => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Products',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFF17140e)),
                    ),
                    const SizedBox(height: 23.0),
                    Expanded(
                      child: GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          mainAxisSpacing: 28.0,
                          crossAxisSpacing: 20.0,
                        ),
                        itemBuilder: (_, index) {
                          final product = snapshot.data![index];
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PageDetails(product: product)));
                              },
                              child: ProductCard(product: product));
                        },
                      ),
                    ),
                  ],
                ),
              _ => const SizedBox(),
            };
          },
        ),
      ),
    );
  }
}
