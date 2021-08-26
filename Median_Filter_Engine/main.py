# -*- coding: utf-8 -*-
"""
Created on Wed Aug 11 15:52:12 2021

@author: User
"""

# Importing all necessary libraries
import cv2
import numpy as np
from skimage.util import random_noise
import scipy.signal as signal

def read_process_image():
    image = cv2.imread('./image.jpg', 0)
    image = cv2.resize(image, (128,128), interpolation= cv2.INTER_AREA)
    image = random_noise(image, mode = 's&p')
    noise = (image*255).astype('uint8')
    blur = cv2.medianBlur(noise, 3).astype('uint8')
    '''
    cv2.imshow('Noise Image', noise)
    cv2.imshow('Blur Image', blur)
    cv2.waitKey(0)
    '''
    return noise, blur

def output_image_file(noise_image, blur_image):
    noise = noise_image
    f0 = open('img.dat','w')
    for i in range(noise.shape[0]):
        for j in range(noise.shape[1]):
            f0.write(format(noise[i,j], 'x'))
            f0.write('\n')
    f0.close()
    
    blur = blur_image
    f1 = open('golden.dat','w')
    for i in range(blur.shape[0]):
        for j in range(blur.shape[1]):
            f1.write(format(blur[i,j], 'x'))
            f1.write('\n')
    f1.close()
            
if __name__ == '__main__':
    # read image, resize to 128*128, add noise(salt and pepper) and apply median filter
    noise, blur = read_process_image()
    output_image_file(noise, blur)
    


