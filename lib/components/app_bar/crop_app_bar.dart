import 'package:flutter/material.dart';

class CropAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CropAppBar({
    Key? key,
    required this.title,
    required this.backgroundImage,
  }) : super(key: key);

  final String title;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);
}
