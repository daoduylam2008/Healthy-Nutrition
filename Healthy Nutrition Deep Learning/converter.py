from ultralytics import YOLO

model = YOLO("models/Mar 29, 25 - best (YOLOv11).pt")

print(model.export(format="tflite", simplify=True))