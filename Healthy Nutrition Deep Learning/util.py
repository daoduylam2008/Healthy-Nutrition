import os
import cv2 
import numpy as np


def load_files_from_dir(path, f=None):
    files = []
    for file in os.listdir(os.getcwd() + "/" + path):
        if f != None and file.endswith(f):
            files.append(path + "/" + file)
        else:
            files.append(path + "/" + file)
    
    return files



def adjust_brightness(image, contrast=1.25, brightness=10):
    return cv2.addWeighted(image, contrast, np.zeros(image.shape, image.dtype), 0, brightness)