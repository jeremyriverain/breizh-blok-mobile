import 'package:flutter/material.dart';

class BbShareButton extends StatelessWidget {
  const BbShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.share,
      ),
      onPressed: () {
        // do something
      },
    );
  }
}
