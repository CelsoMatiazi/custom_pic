import 'package:flutter/material.dart';
import 'package:photo_filter/controller/app_controller.dart';
import 'package:provider/provider.dart';
import 'components/bottom_buttons.dart';
import 'components/custom_bottom_sheet.dart';
import 'components/filters_widgets.dart';
import 'components/main_image.dart';

class Home extends StatelessWidget {
  Home({Key? key, required this.bottomSheet}) : super(key: key);

  final CustomBottomSheet bottomSheet;
  final GlobalKey screen = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset('assets/logo2.png', height: 35),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (){
                Provider.of<AppController>(context, listen: false).shareImage(screen);
              },
              icon: const Icon(Icons.share, color: Colors.white38)
          ),
          IconButton(
              onPressed: (){
                Provider.of<AppController>(context, listen: false).saveImageOnGallery(screen);
              },
              icon: const Icon(Icons.save_alt, color: Colors.white38)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          ImageMain(screen: screen,),
          const SizedBox(height: 20),
          const FiltersWidget(),
          BottomButtons(bottomSheet: bottomSheet)
        ],
      ),
    );
  }
}






