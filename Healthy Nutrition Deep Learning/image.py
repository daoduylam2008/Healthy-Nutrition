import cv2
import util
import rotated_transformation


path_base_image = "my_datasets/train/Apple"
path_my_datasets = "datasets/train/"


def export_rotation(angle, file, name):
    path = path_my_datasets + name + ".txt"
    print(path)
    boxes = rotated_transformation.detected_boxes()
    name = file.split("/")[-1].replace(".jpg", "")
    try:
        box = boxes[name]
    except:
        box = ""
    
    for i in box:
        x, y, w, h = rotated_transformation.coordinates_with_angle(angle, (i.center_x * 640, i.center_y * 640), i.w, i.h)
        rotated_transformation.export(i.cl, path, path, x, y, w, h)


if __name__ == "__main__":
    all_images = util.load_files_from_dir(path_base_image, ".jpg")
    print(all_images[0])
    for i in range(0, len(all_images)):
        if ".DS_Store" in all_images[i]:
            continue
        print(all_images[i])
        # Original with resizable method
        img = cv2.imread(all_images[i])

        img = cv2.resize(img, (640, 640)) # Resize image with 640x640 to fit the model

        # Save the resized image 
        cv2.imwrite(path_my_datasets + f'images/image-{i}-000-00.jpg', img) 
        export_rotation(0, all_images[i], f'labels/image-{i}-000-00')
        # Change the brightness of the resized image
        cv2.imwrite(path_my_datasets + f'images/image-{i}-000-70.jpg', util.adjust_brightness(img))
        export_rotation(0, all_images[i], f'labels/image-{i}-000-70')

        # Rotate 90 degrees
        cv2.imwrite(path_my_datasets + f'images/image-{i}-090-00.jpg', cv2.rotate(img, cv2.ROTATE_90_COUNTERCLOCKWISE)) 
        export_rotation(90, all_images[i], f'labels/image-{i}-090-00')

        # Change the brightness of the resized image
        cv2.imwrite(path_my_datasets + f'images/image-{i}-090-70.jpg', util.adjust_brightness(cv2.rotate(img, cv2.ROTATE_90_COUNTERCLOCKWISE)))
        export_rotation(90, all_images[i], f'labels/image-{i}-090-70')

        # Rotate 180 degrees
        cv2.imwrite(path_my_datasets + f'images/image-{i}-180-00.jpg', cv2.rotate(img, cv2.ROTATE_180))
        export_rotation(180, all_images[i], f'labels/image-{i}-180-00')

        # Change the brightness of the resized image
        cv2.imwrite(path_my_datasets + f'images/image-{i}-180-70.jpg', util.adjust_brightness(cv2.rotate(img, cv2.ROTATE_180)))
        export_rotation(180, all_images[i], f'labels/image-{i}-180-70')

        # Rotate 270 degrees
        cv2.imwrite(path_my_datasets + f'images/image-{i}-270-00.jpg', cv2.rotate(img, cv2.ROTATE_90_CLOCKWISE)) 
        export_rotation(270, all_images[i], f'labels/image-{i}-270-00')

        # Change the brightness of the resized image
        cv2.imwrite(path_my_datasets + f'images/image-{i}-270-70.jpg', util.adjust_brightness(cv2.rotate(img, cv2.ROTATE_90_CLOCKWISE)))
        export_rotation(270, all_images[i], f'labels/image-{i}-270-70')

