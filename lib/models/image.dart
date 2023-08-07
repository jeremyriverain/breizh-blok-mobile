class Image {
  final String? filterUrl;
  final String contentUrl;
  final int? width;
  final int? height;

  Image({required this.contentUrl, this.filterUrl, this.width, this.height});

  factory Image.fromJson(Map<String, dynamic> json) {
    var hasDimensions =
        json['imageDimensions'] is List && json['imageDimensions'].length == 2;

    return Image(
      contentUrl: json['contentUrl'],
      filterUrl: json['filterUrl'],
      width: hasDimensions ? int.parse(json['imageDimensions'][0]) : null,
      height: hasDimensions ? int.parse(json['imageDimensions'][1]) : null,
    );
  }
}
