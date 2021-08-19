import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController controller;

  Future<void> initializedCamera() async {
    var cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    await controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<File> takePictures() async {
    Directory root = await getTemporaryDirectory();
    String directoryPath = '${root.path}/Guided_Camera';
    await Directory(directoryPath).create(recursive: true);
    String filePath = '$directoryPath/${DateTime.now()}.jpg';

    try {
      await controller.takePicture();
    } catch (e) {
      return null;
    }

    return File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: initializedCamera(),
        builder: (_, snapshot) => (snapshot.connectionState ==
                ConnectionState.done)
            ? Stack(children: <Widget>[
                Column(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width /
                            controller.value.aspectRatio,
                        child: CameraPreview(controller)),
                    Container(
                        width: 70,
                        height: 70,
                        margin: EdgeInsets.only(top: 50),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (!controller.value.isTakingPicture) {
                              File result = await takePictures();
                              print('berhasil Foto');
                              Navigator.pop(context, result);
                            }
                            if (controller.value.isTakingPicture) {
                              print(' Foto');
                            }
                          },
                          child: Text(''),
                          style:
                              ElevatedButton.styleFrom(shape: CircleBorder()),
                        )),
                  ],
                ),
              ])
            : Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
