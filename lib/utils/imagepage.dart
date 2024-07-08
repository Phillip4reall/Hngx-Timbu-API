import 'package:flutter/material.dart';
import 'package:timbu_api/utils/indidcator.dart';

// displays all photos belonging to a product in a carousel manner,
// using the swipe gesture
class Photo extends StatefulWidget {
  const Photo({super.key, required this.photos});
  final List<String> photos;

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  final _controller = PageController();
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: widget.photos.length,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          itemBuilder: (_, index) {
            final photo = widget.photos[index];
            return Image.network(photo);
          },
        ),
        Positioned(
          bottom: 10.0,
          child: Row(
            children: [
              for (var i = 0; i < widget.photos.length; i++) ...[
                Indicator(isCurrent: _currentIndex == i),
                const SizedBox(width: 4.0),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
