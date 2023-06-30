import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/app_controller.dart';

class FiltersWidget extends StatelessWidget {
  const FiltersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: context.read<AppController>().filters.length,
          itemBuilder: (context, index){
            return Consumer<AppController>(
                builder: (context, controller, _) {
                    return Column(
                      children: [
                        Text(controller.filters[index].name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: (){
                            if(controller.imageController.photo != null){
                              controller.setFilter(controller.filters[index].filter);
                              controller.resetFiltersSettings();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 100,
                            width: 100,
                            color: Colors.white24,
                            child: controller.imageController.photo == null
                                ? Container(color: Colors.grey[800],)
                                : ColorFiltered(colorFilter: ColorFilter.matrix(context.read<AppController>().filters[index].filter),
                                    child: Image.file(File(controller.imageController.photo!.path), fit: BoxFit.cover,),
                            ),
                          ),
                        ),
                      ],
                    );
                }
            );
          }
      ),
    );
  }
}