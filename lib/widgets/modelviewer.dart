/*
**********Project Name: qr_ar_task
**********File Name: model_viewer
**********Created At: 17-Mar-24 3:37 PM
**********Author: Abdelrhman Hussein
**********Description: This widget to view 3D model and show it in Augmented Reality.
*/

import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class FurnitureModelViewer extends StatelessWidget {
  const FurnitureModelViewer({super.key, required this.modelPathForAndroid, required this.modelPathForIos});
  final String modelPathForAndroid, modelPathForIos;
  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      backgroundColor: Colors.black45,
      // Path of the Source 3D file and it should be in extension (glb), it can taken from network or assets files.
      src: modelPathForAndroid,
      //the next line to create the model to ios.
      iosSrc: modelPathForIos,
      // the next attribute to view the model in AR.
      ar: true,
      // Make the model rotating in show mode.
      autoRotate: true,
      // the next line to stop zooming during the view model mode not the AR.
      disableZoom: true,
    );
  }
}
