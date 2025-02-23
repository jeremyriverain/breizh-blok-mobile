import 'package:breizh_blok_mobile/domain/models/line_boulder/line_boulder.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/line_boulder_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class BoulderDetailsLineBoulders extends StatelessWidget {
  const BoulderDetailsLineBoulders({
    required this.lineBoulders,
    super.key,
  });

  final List<LineBoulder> lineBoulders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: lineBoulders
          .asMap()
          .entries
          .map<Widget>(
            (entry) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: () => {_open(context, entry.key)},
                child: LineBoulderImage(
                  lineBoulder: entry.value,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  void _open(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute<_GalleryPhotoViewWrapper>(
        builder: (context) => _GalleryPhotoViewWrapper(
          galleryItems: lineBoulders,
          initialIndex: index,
        ),
      ),
    );
  }
}

class _GalleryPhotoViewWrapper extends StatefulWidget {
  _GalleryPhotoViewWrapper({
    required this.galleryItems,
    this.initialIndex = 0,
  }) : pageController = PageController(initialPage: initialIndex);

  final backgroundDecoration = const BoxDecoration(
    color: Colors.black,
  );
  final int initialIndex;
  final PageController pageController;
  final List<LineBoulder> galleryItems;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<_GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.sizeOf(context).height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                '${AppLocalizations.of(context).image} ${currentIndex + 1}/${widget.galleryItems.length}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 5,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 25,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  tooltip: AppLocalizations.of(context).closeTheGallery,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final item = widget.galleryItems[index];
    final width = item.rockImage.width?.toDouble() ?? 300;
    final height = item.rockImage.height?.toDouble() ?? 300;
    return PhotoViewGalleryPageOptions.customChild(
      child: SizedBox(
        width: width,
        height: height,
        child: LineBoulderImage(
          lineBoulder: item,
        ),
      ),
      childSize: Size(
        width,
        height,
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.rockImage.contentUrl),
    );
  }
}
