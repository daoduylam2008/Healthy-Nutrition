from random import randint
import util
import cv2

def box_detection(text):
    text = text.replace("\n", "").split()
    
    x = float(text[1])* 640
    y = float(text[2]) * 640
    w = float(text[3]) * 640
    h = float(text[4]) * 640

    point_1 = (int(x - w / 2), int(y - h / 2))
    point_2 = (int(x + w / 2), int(y + h / 2))

    return point_1, point_2


if __name__ == "__main__":
    classes = [
        "french fries",
        "hamburger",
        "hotdog",
        "muffin",
        "pizza",
    ]

    files = util.load_files_from_dir("datasets/train/images", ".jpg")
    file = files[randint(0, len(files) - 1)]

    img = cv2.imread(file)

    box_file = "datasets/train/labels/" + file.split("/")[-1].replace(".jpg", ".txt")

    with open(box_file, 'r') as file:
        boxes = file.readlines()
    while True:
        
        cv2.imshow("", img)

        for box in boxes:
            point_1, point_2 = box_detection(box)

            cv2.rectangle(img, point_1, point_2, (255, 0, 0))

        key = cv2.waitKey(5)

        if key == ord('q'):
            quit()
        elif key == ord('r'):
            file = files[randint(0, len(files) - 1)]

            img = cv2.imread(file)

            box_file = "datasets/train/labels/" + file.split("/")[-1].replace(".jpg", ".txt")

            with open(box_file, 'r') as file:
                boxes = file.readlines()
