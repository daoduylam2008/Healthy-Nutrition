import cv2
import util

if __name__ == "__main__":
    d = "Mar 29, 25"
    files = util.load_files_from_dir("base_image/" + d)

    for i in range(0, len(files) - 1):
        img = cv2.imread(files[i])
        print(files[i])
        try:
            img = cv2.resize(img, (640, 640))

            cv2.imwrite("base_datasets/" + d + f'/img-{i}.jpg', img)
        except:
            continue
