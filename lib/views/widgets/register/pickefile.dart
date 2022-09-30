//this is the file picker widget
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import '../../../controller/register/fillepicker_controller.dart';

class AppPickFile extends StatelessWidget {
  const AppPickFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilepickerControllerImpl
        fillepickerControllerImpl =
        Get.put(FilepickerControllerImpl());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 20, bottom: 10, left: 5),
          child: Row(
            children: const [
              Text(
                  'Upload a Discrption for your project'),
            ],
          ),
        ),
        GetBuilder<FilepickerControllerImpl>(
            init: fillepickerControllerImpl,
            builder: ((controller) {
              return InkWell(
                onTap: () =>
                    controller.pickFile(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  height: 60,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color:
                          const Color(0xFFF7FBFF),
                      border: Border.all(
                          width: .5,
                          color: Colors.grey,
                          style:
                              BorderStyle.solid),
                      borderRadius:
                          BorderRadius.circular(
                              10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5),
                          spreadRadius: .2,
                          blurRadius: 1,
                          offset: const Offset(0,
                              .5), // changes position of shadow
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      controller.isFilePicked
                          ? Text(
                              controller.fileName,
                              style:
                                  const TextStyle(
                                color: Colors
                                    .blueGrey,
                                fontSize: 15,
                              ),
                            )
                          : const Text(
                              'Upload File',
                              style: TextStyle(
                                color: Colors
                                    .blueGrey,
                                fontSize: 15,
                              ),
                            ),
                      controller.isFilePicked
                          ? const Icon(
                              Ionicons.checkmark,
                              color: Colors.green,
                            )
                          : const Icon(Ionicons
                              .cloud_upload_outline)
                    ],
                  ),
                ),
              );
            })),
      ],
    );
  }
}
