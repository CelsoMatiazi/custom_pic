import 'package:flutter/material.dart';
import 'package:photo_filter/controller/png_controller.dart';
import 'package:provider/provider.dart';
import '../data_filters/data_stickers.dart';


class StickerOptions extends StatelessWidget {
  const StickerOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<StickerController>(context);
    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const Center(child: Icon(Icons.expand_more, color: Colors.white24,)),

          const Text("Emojis", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: emojis.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      controller.addPng(emojis[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: Image.asset(emojis[index].path),

                    ),
                  );
                }
            ),
          ),


          const Text("Styles", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: style.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      controller.addPng(style[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: Image.asset(style[index].path),

                    ),
                  );
                }
            ),
          ),

          const Text("Food", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: food.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      controller.addPng(food[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: Image.asset(food[index].path),

                    ),
                  );
                }
            ),
          ),


          const Text("Cool", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cool.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      controller.addPng(cool[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: Image.asset(cool[index].path),

                    ),
                  );
                }
            ),
          ),

          const Text("Party", style: TextStyle(color: Colors.white),),
          SizedBox(
            height: 130,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: party.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      controller.addPng(party[index]);
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: Image.asset(party[index].path),

                    ),
                  );
                }
            ),
          ),

          // const Text("Molduras", style: TextStyle(color: Colors.white),),
          // SizedBox(
          //   height: 130,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: decoration.length,
          //       itemBuilder: (context, index){
          //         return GestureDetector(
          //           onTap: (){
          //             controller.addPng(decoration[index]);
          //             Navigator.pop(context);
          //           },
          //           child: Container(
          //             padding: const EdgeInsets.all(8),
          //             width: 100,
          //             height: 100,
          //             child: Image.asset(decoration[index].path),
          //
          //           ),
          //         );
          //       }
          //   ),
          // ),
        ],
      ),
    );
  }
}
