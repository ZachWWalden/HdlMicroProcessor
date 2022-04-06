from hashlib import new
import cv2
import numpy

def main():
    img = cv2.imread("f22160120.jpg")
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    file = open("f22160120.coe", "w")
    file.write("memory_initialization_radix=16;\nmemory_initialization_vector=\n")

    i = 0

    for x in img:
        for y in x:
            string = ""
            for z in y:
                #convert to 4 bit value.
                pix_val = translate(z, 0, 255, 0, 15)
                pix_val = int(pix_val)
                newPixel = translate(pix_val, 0, 15, 0, 255)
                z = int(newPixel)
                hex_str = hex(pix_val)
                string+= hex_str[2]
            i += 1
            if i == 19200:
                file.write(string + ";")
            else:
                file.write(string + ",\n")

    cv2.imwrite("f22TwelveBit.jpg", img)

def translate(value, leftMin, leftMax, rightMin, rightMax):
    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)

if __name__ == "__main__":
    main()
