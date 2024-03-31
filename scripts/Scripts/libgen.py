#!/sbin/python3

import os

print("Libgen Textbook Downloader")
md5 = input("Enter MD5 number: ")
os.system(f"cd ~/go/bin/ ; ./libgen-cli download {md5} -o ~/Documents/Textbooks")
