import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:squadio/core/app.localization.dart';
import 'package:squadio/core/snack_bar.dart';
import 'package:squadio/core/theme/app_colors.dart';

class ImageViewInspector extends StatefulWidget {
  final List<String> files;
  final int initialIndex;

  const ImageViewInspector({Key? key, required this.files, this.initialIndex=0}) : super(key: key);
  @override
  _ImageViewInspectorState createState() => _ImageViewInspectorState();
}

class _ImageViewInspectorState extends State<ImageViewInspector> {
  late PageController _controller;
  late int _currentPage;
  @override
  void initState() {
    _currentPage=widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PhotoViewGallery.builder(
                  scrollPhysics: ClampingScrollPhysics(),
                  onPageChanged: (page)=>setState(() {_currentPage=page;}),
                  backgroundDecoration: BoxDecoration(color: Colors.white),
                  pageController: _controller,
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: CachedNetworkImageProvider(widget.files[index]),
                      initialScale: PhotoViewComputedScale.contained,
                      minScale: 0.4,
                      maxScale: 1.0,
                      heroAttributes: PhotoViewHeroAttributes(tag: widget.files[index]),
                    );
                  },
                  itemCount: widget.files.length,
                  loadingBuilder: (context, event) => Center(
                    child: LoadingFlipping.square(
                      borderColor: AppColors.primaryColorDark,
                      backgroundColor: Colors.white,
                      size: 80.0,
                      itemBuilder:(context,index)=> SvgPicture.asset("assets/icons/global.svg",color: Colors.black),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
                      onPressed: () {
                        _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                      },
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(FontAwesomeIcons.download),
                        SizedBox(width:5),
                        Text(
                          AppLocalizations.of(context)!.translate("download"),
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios,color: Colors.black),
                      onPressed: () {
                        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  downloadImage() async {
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(widget.files[_currentPage]);
      if (imageId == null) {
        return;
      }
      showScaffoldSnackBar(context: context, message: "Image downloaded successfully");

    } on PlatformException catch (error) {
      print(error);
    }
  }


}
