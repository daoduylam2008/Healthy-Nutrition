from ultralytics import YOLO
import cv2

img = cv2.imread("test_2.jpg")
model = YOLO("models/Mar 29, 25 - best (YOLOv11).pt")

threshold = 0.7

classes = {
    "class_0": "french fries",
    "class_1": "hamburger",
    "class_2": "hotdog",
    "class_3": "muffin",
    "class_4":"pizza",
}

results = model(img)[0]

while True:
    for result in results.boxes.data.tolist():
        x1, y1, x2, y2, score, class_id = result
        if score > threshold:
            text = (classes[results.names[int(class_id)].lower()])
            cv2.rectangle(img, (int(x1), int(y1)) , (int(x2), int(y2)), (0, 255, 0))
            cv2.putText(img, text, (int(x1), int(y1 - 10)),
                        cv2.FONT_HERSHEY_SIMPLEX, 1.3, (0, 255, 0), 3, cv2.LINE_AA)

    cv2.imshow("My app", img)
    key = cv2.waitKey(1)
    if key == ord('q'):
        quit()
