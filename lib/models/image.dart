class Image {
  Image({required this.contentUrl, this.filterUrl, this.width, this.height});

  factory Image.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'contentUrl': final String contentUrl,
          'filterUrl': final String filterUrl,
        }) {
      int? width;
      int? height;
      if (json
          case {
            'imageDimensions': [final String widthStr, final String heightStr]
          }) {
        width = int.parse(widthStr);
        height = int.parse(heightStr);
      }
      return Image(
        contentUrl: contentUrl,
        filterUrl: filterUrl,
        width: width,
        height: height,
      );
    }

    return Image(contentUrl: '', filterUrl: '');
  }

  final String? filterUrl;
  final String contentUrl;
  final int? width;
  final int? height;
}
