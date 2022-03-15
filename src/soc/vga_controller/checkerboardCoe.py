def main():
    file = open("checkerboard.coe", "w")
    file.write("memory_initialization_radix=16;\nmemory_initialization_vector=\n")

    for i in range(76800):
        if i % 2 == 0:
            str = "FFF" # 0xF0F is yellow, # 0xF00 is red Scheme RBG
        else:
            str = "000"

        if i == 76799:
            file.write(str + ";")
        else:
            file.write(str + ",\n")

if __name__ == "__main__":
    main()
