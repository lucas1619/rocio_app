import 'package:flutter/material.dart';

class OnlyBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnlyBackAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_sharp),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(' '),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}