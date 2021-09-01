# -*- coding: utf-8 -*-
"""
Created on Wed Aug 11 15:52:12 2021

@author: User
"""
import cv2
import numpy as np
from skimage.util import random_noise
import scipy.signal as signal

image = cv2.imread('./image.jpg', 0)
image = cv2.resize(image, (128,128), interpolation= cv2.INTER_AREA)
image = random_noise(image, mode = 's&p')
noise = (image*255).astype('uint8')

medfilt = signal.medfilt2d(noise, kernel_size = 3)

f0 = open('img.dat','w')
for i in range(noise.shape[0]):
    for j in range(noise.shape[1]):
        f0.write(format(noise[i,j], 'x'))
        f0.write('\n')
f0.close()

f1 = open('golden.dat','w')
for i in range(medfilt.shape[0]):
    for j in range(medfilt.shape[1]):
        f1.write(format(medfilt[i,j], 'x'))
        f1.write('\n')
f1.close() 
