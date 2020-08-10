import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageNetwork extends StatefulWidget {
  String url;
  double height, width;

  ImageNetwork(this.url, this.height, this.width);

  @override
  _ImageNetworkState createState() => _ImageNetworkState();
}

class _ImageNetworkState extends State<ImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return _buildView();
  }

  Widget _buildView() {
    return Image.network(widget.url,
        fit: BoxFit.fitWidth,
        width: widget.width,
        height: widget.height, loadingBuilder: (BuildContext context,
            Widget child, ImageChunkEvent loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes
              : null,
        ),
      );
    });
  }
}
