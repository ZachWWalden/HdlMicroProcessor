import cv2

def main():
    img = cv2.imread("retirement.bmp")
    
    pixWords = []

    for y in img:
        cnt = 0
        word = []
        for x in y:
            cnt += 1
            word.append(x[0])
            if cnt == 32:
                wordNum = 0
                for i in range(32):
                    #print(hex(wordNum))
                    if word[i] == 255:
                        wordNum = wordNum << 1
                        wordNum = wordNum | 1  
                    else:
                        wordNum = wordNum << 1
                        wordNum = wordNum & 0xFFFFFFFE
                cnt = 0
                #print(word)
                word = []
                pixWords.append(wordNum)

    for word in pixWords:
        print(".DW " + hex(word))
        #pass


if __name__ == "__main__":
    main()