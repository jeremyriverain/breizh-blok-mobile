import 'package:breizh_blok_mobile/blocs/offline_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadAreaButton extends StatefulWidget {
  const DownloadAreaButton({
    required this.boulderAreaIri,
    super.key,
  });

  final String boulderAreaIri;

  @override
  State<DownloadAreaButton> createState() => _DownloadAreaButtonState();
}

class _DownloadAreaButtonState extends State<DownloadAreaButton> {
  bool download = false;

  void _onChanged() {
    setState(() {
      download = !download;
    });
    switch (download) {
      case false:
        context.read<OfflineBloc>().add(
              DeleteDownloadBoulderAreaEvent(
                boulderAreaIri: widget.boulderAreaIri,
              ),
            );
      case true:
        context.read<OfflineBloc>().add(
              DownloadBoulderAreaEvent(
                boulderAreaIri: widget.boulderAreaIri,
              ),
            );
    }
  }

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
              _onChanged();
            },
          ),
        ),
        GestureDetector(
          onTap: _onChanged,
          child: const Text('TÉLÉCHARGER'),
        ),
      ],
    );
  }
}
