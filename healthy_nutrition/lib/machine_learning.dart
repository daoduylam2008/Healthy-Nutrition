import 'package:pytorch_lite/pytorch_lite.dart';
import 'package:camera/camera.dart';

Future<ModelObjectDetection> loadModel() async {
  ModelObjectDetection model = await PytorchLite.loadObjectDetectionModel(
    "assets/model.pt",
    7,
    640,
    640,
    labelPath: "assets/classes.txt",
  );
  return model;
}

Future<List<ResultObjectDetection>> predict(CameraImage cameraImage) async {
  ModelObjectDetection model = await loadModel();

  List<ResultObjectDetection> results = await model
      .getCameraImagePredictionList(cameraImage);
  return results;
}
