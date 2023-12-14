import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      child: ClipOval(
        child: Image.asset(
          _assetPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
