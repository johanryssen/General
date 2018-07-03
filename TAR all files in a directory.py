## TAR all files in a directory

import tarfile
import glob

def create_tarfile():
        tfile = tarfile.open("mytarfile.zip", "w")
        for configFile in glob.glob("D:\DL"):
                tfile.add(configFile)
        tfile.close()

create_tarfile()