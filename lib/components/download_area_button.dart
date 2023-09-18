import 'package:flutter/material.dart';

class DownloadAreaButton extends StatefulWidget {
  const DownloadAreaButton({
    super.key,
  });

  @override
  State<DownloadAreaButton> createState() => _DownloadAreaButtonState();
}

class _DownloadAreaButtonState extends State<DownloadAreaButton> {
  bool download = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          alignment: Alignment.centerRight,
          scale: .8,
          child: Switch(
            value: download,
            onChanged: (value) {
              setState(() {
                download = value;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              download = !download;
            });
          },
          child: const Text('TÉLÉCHARGER'),
        ),
      ],
    );
  }
}
