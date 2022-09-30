 
import 'package:fablab/controller/register/fillepicker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilepickerControllerImpl fillepickerControllerImpl =
       Get.put(FilepickerControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text(
                    'Upload a Discrption for your project' ),
              ],
            ),
          ),
         const  SizedBox(
            height: 10,
           
             
          ),
          InkWell(
            onTap: () => fillepickerControllerImpl.pickFile(),
               
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    style: BorderStyle.solid),
                borderRadius:
                    BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceAround,
                children: const [
                  Text('Upload File'),
                  Icon(Ionicons
                      .cloud_upload_outline)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/* ElevatedButton(
              onPressed: () async {
                PlatformFile pickedfile;

                FilePickerResult? result =
                    await FilePicker.platform
                        .pickFiles();

                if (result != null) {
                  var fileName =
                      result.files.single.name;
                  File file = File(
                      result.files.single.path!);
                  try {
                    Reference reference =
                        FirebaseStorage.instance
                            .ref()
                            .child(fileName);

                    reference.putFile(file);
                  } catch (e) {
                    print(e);
                  }
                } else {
                  // TODO: show "file not selected" snack bar
                }
              },
              child: const Text('Test')), */