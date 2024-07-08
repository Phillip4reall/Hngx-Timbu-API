import 'package:flutter/material.dart';
import 'package:timbu_api/utils/imagepage.dart';

import '../model/productsmodel.dart';

// displays the Product being passed
// displays all photos of a product, it's name, availability,
// description and price.
class PageDetails extends StatefulWidget {
  const PageDetails({super.key, required this.product});
  final Product product;

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            surfaceTintColor: Colors.grey,
            foregroundColor: Colors.grey,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Photo(photos: widget.product.photos),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  padding: const EdgeInsets.all(20.0),
                  width: double.infinity,
                  //color: Colors.grey.shade500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10.0),
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0XFFf5f4ee),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: widget.product.isAvailable
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: Text(
                          widget.product.isAvailable
                              ? 'Available'
                              : 'Unavailable',
                          style: const TextStyle(
                            color: Color(0XFFf5f4ee),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0XFFf5f4ee),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        widget.product.currentPrice,
                        style: const TextStyle(
                          fontSize: 27.0,
                          fontWeight: FontWeight.w400,
                          color: Color(0XFFf5f4ee),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
