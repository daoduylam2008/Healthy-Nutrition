from random import randint
import util
import cv2
import math


class BoxDetection:
    def __init__(self, text):
        text = text.split()
        self.cl = text[0]
        self.center_x = float(text[1])
        self.center_y = float(text[2])
        self.w = float(text[3])
        self.h = float(text[4])
    
    def detected_box(self):
        return (self.center_x, self.center_y, self.w, self.h)

    def detect_box(self):
        point_1 = (int(self.center_x * 640 + self.w * 320), int(self.center_y * 640 + self.h * 320))
        point_2 = (int(self.center_x * 640 - self.w * 320), int(self.center_y * 640 - self.h * 320))

        return point_1, point_2


def segment_length(x1, y1, x2, y2):
    length = math.sqrt(
        math.pow(
            (x1 - x2), 2
        ) + math.pow(
            (y1 - y2), 2
        )
    )
    return length


def quadratic_equation(a, b, c):
    delta = b ** 2 - 4 * a * c
    if delta < 0:
        return None
    x1 = (-b + math.sqrt(delta)) / (2*a)
    x2 = (-b - math.sqrt(delta)) / (2*a)

    return x1, x2


def detected_boxes(path="my_datasets/train/labels"):
    files = util.load_files_from_dir(path, '.txt')
    boxes = {}
    for file in files:
        with open(file, 'r') as f:
            data = f.readlines()
        
        fi = file.split("/")[-1].replace('.txt', '')

        boxes[fi] = [BoxDetection(d) for d in data]
    return boxes


def x_cal(y, a, b, c):
    return (-c - b * y) / (a)


def square(n):
    return (n) ** 2


def odd_degrees_rotated_calculator(x1, y1):
    """
    normal vector =. 
    """
    a = 320 - x1
    b = 320 - y1
    c = - 320 * (a + b)
    radius = segment_length(x1, y1, 320, 320)

    A = square(a) + square(b)
    B = 2 * b * (c + 320 * a) - 640 * square(a)
    C = square(320) * square(a) + square((c + 320 * a)) - square(a) * square(radius)

    s1, s2 = quadratic_equation(A, B, C) # There are two solutions of y
    sp1 = x_cal(s1, a, b, c)
    sp2 = x_cal(s2, a, b, c)

    return sp1, s1, sp2, s2


def even_degrees_rotated_calculator(x1, y1):
    return 320 + (320 - x1), 320 + (320 - y1)


def coordinates_with_angle(angle, original: tuple, w: float, h: float):
    if angle == 0:
        return original[0], original[1], w, h
    elif 320 - original[0] == 0 and 320 - original[1] == 0:
        if angle == 90 or angle == 270:
            return original[0], original[1], h, w
        return  original[0], original[1], w, h
    elif 320 - original[0] == 0:
        if angle == 90:
            return original[1], 0, h, w
        elif angle == 270:
            return  640 - original[1], 0, h, w
        else:
            return 0, 640 - original[1], w, h
    elif 320 - original[1] == 0:
        if angle == 90:
            return 0, original[0], h, w
        elif angle == 270:
            return  0, 640 - original[0], h, w
        else:
            return 640 - original[0], 0, w, h
    else:
        if angle == 270:
            x1, y1, x2, y2 = odd_degrees_rotated_calculator(original[0], original[1])
            if 320 - original[0] > 0 and 320 - original[1] > 0:
                if (320 - x1) < 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w 
            elif 320 - original[0] > 0 and 320 - original[1] < 0:
                if (320 - y1) > 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w
            elif 320 - original[0] < 0 and 320 - original[1] < 0:
                if (320 - x1) > 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w
            else:
                if (320 - y1) < 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w
        elif angle == 90:
            x1, y1, x2, y2 = odd_degrees_rotated_calculator(original[0], original[1])
            if 320 - original[0] > 0 and 320 - original[1] > 0:
                if (320 - y1) < 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w 
            elif 320 - original[0] > 0 and 320 - original[1] < 0:
                if (320 - x1) < 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w
            elif 320 - original[0] < 0 and 320 - original[1] < 0:
                if (320 - y1) > 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w
            else:
                if (320 - x1) > 0:
                    return x1, y1, h, w
                else:
                    return x2, y2, h, w  
        elif angle == 180:      
            x, y = even_degrees_rotated_calculator(original[0], original[1])
            return x, y, w, h


def export(label, file, old_file, x, y, w, h):
    x = x / 640
    y = y / 640

    try:
        with open(old_file, 'r') as file:
            old_data = file.readlines()
    except:
        old_data = []
        
    data = f'{label} {x} {y} {w} {h}\n'
    print(data)
    old_data.append(data)
    
    try:
        with open(file.name, 'w+') as file:
            file.writelines(old_data)
    except:
        with open(file, 'w+') as file:
            file.writelines(old_data)


if __name__ == "__main__":    
    boxes = detected_boxes()

    files = util.load_files_from_dir("my_datasets/train/images", '.jpg')
    angles = [90, 180, 270]
    file = randint(0, len(files) - 1)
    print(files[file])

    angle = angles[randint(0, 2)]

    if angle == 180:
        rotated_angle = cv2.ROTATE_180
    elif angle == 90:
        rotated_angle = cv2.ROTATE_90_COUNTERCLOCKWISE
    elif angle == 270:
        rotated_angle = cv2.ROTATE_90_CLOCKWISE

    img = cv2.imread(files[file])
    img = cv2.rotate(img, rotated_angle)
    
    detect_box = boxes[files[file].split("/")[-1].replace(".jpg", "")][0]

    x = detect_box.center_x * 640
    y = detect_box.center_y * 640
    w = detect_box.w * 640
    h = detect_box.h * 640

    x1, y1, width, height = coordinates_with_angle(angle, (x, y), w, h)
    point_1 = (int(x1 - width / 2), int(y1 - height / 2))
    point_2 = (int(x1 + width / 2), int(y1 + height / 2))

    p_1 = (int(x - w / 2), int(y - h / 2))
    p_2 = (int(x + w / 2), int(y + h / 2))

    while True:
        cv2.circle(img, (320, 320), radius=5, color=(0, 0, 0), thickness=-1)
        cv2.circle(img, (int(x), int(y)), radius=5, color=(255, 0, 0), thickness=-1)
        cv2.circle(img, (int(x1), int(y1)), radius=5, color=(0, 255, 0), thickness=-1)
        
        # box detection
        cv2.rectangle(img, p_1, p_2, (255, 0 ,0), 1)
        cv2.rectangle(img, point_1, point_2, (0, 255 ,0), 1)

        position = str(point_1) + ", " + str(point_2)
        cv2.putText(img, position, point_1, cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,0))

        cv2.imshow(files[file] + " " + str(angle), img)

        k = cv2.waitKey(1)
        if k == ord('q'):
            quit()
        elif k == ord('r'):
            cv2.destroyAllWindows()
            file = randint(0, len(files) - 1)

            angle = angles[randint(0, 2)]

            if angle == 180:
                rotated_angle = cv2.ROTATE_180
            elif angle == 90:
                rotated_angle = cv2.ROTATE_90_COUNTERCLOCKWISE
            elif angle == 270:
                rotated_angle = cv2.ROTATE_90_CLOCKWISE

            img = cv2.imread(files[file])
            img = cv2.rotate(img, rotated_angle)
            n = len(boxes[files[file].split("/")[-1].replace(".jpg", "")])
            detect_box = boxes[files[file].split("/")[-1].replace(".jpg", "")][randint(0, n-1)]

            x = detect_box.center_x * 640
            y = detect_box.center_y * 640
            w = detect_box.w * 640
            h = detect_box.h * 640

            x1, y1, width, height = coordinates_with_angle(angle, (x, y), w, h)
            point_1 = (int(x1 - width / 2), int(y1 - height / 2))
            point_2 = (int(x1 + width / 2), int(y1 + height / 2))

            p_1 = (int(x - w / 2), int(y - h / 2))
            p_2 = (int(x + w / 2), int(y + h / 2))
