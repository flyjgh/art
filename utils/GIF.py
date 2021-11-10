import glob
import os
import imageio
import sys
import IPython
from PIL import Image, ImageFile
 
 
user = os.environ['USERNAME']
 
name = input("what name for your gif? \n")
qa = input("""change dir? 'C:/Users/{user}/Documents/programming/python/temp' \n y/n \n""")
if qa == "y":
    directory = input("where are the images? (abs path)\n")
else: directory = 'C:/Users/%s/Documents/programming/python/temp'%(user)
 
 
def create_gif(name, directory, fps=17):
    os.chdir(directory)
    images = []
    filenames = glob.glob('*')
    c=0
    for filename in filenames:
        images.append(imageio.imread(filename))
        c += 1
    imageio.mimsave(directory + '/' + name + '.gif', images, fps=fps)
    print("%s images saved"%(c))
 
 
q = input("change fps? (17) \n y/n \n")
if q == "y":
    fps = int(input("How many fps? \n"))
    create_gif(name, directory, fps)
else: create_gif(name, directory)
 
 
