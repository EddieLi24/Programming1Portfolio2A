from Box import Box
from Sphere import Sphere
from Pyramid import Pyramid
print("Welcome to shape maker! Lets find and volume and surface area for a few shapes...")
myShape = input("Select shape: Box = 1, Sphere = 2, Pyramid = 3 - ")
print(' ')

b1 = Box()
s1 = Sphere()
p1 = Pyramid()

myShape = str(myShape)
if myShape == '1':
  b1.l = input('enter value for box length:')
  print(b1.l)
  b1.w = input('enter value for box width:')
  print(b1.w)
  b1.h = input('enter value for box height:')
  print(b1.h)
  print('Box Volume:', b1.calcVol())
  print('Box Surface Area:', b1.calcSA())
  
elif myShape == '2':
  s1.r = input('enter value for sphere radius:')
  print('Sphere Volume:', s1.calcVol())
  print('Sphere Surface Area:', s1.calcSA())


elif myShape == '3':
  p1.l = input('enter value for box length:')
  print(p1.l)
  p1.w = input('enter value for box width:')
  print(p1.w)
  p1.h = input('enter value for box height:')
  print(p1.h)
  print('Pyramid Volume:', p1.calcVol())
  print('Pyramid Surface Area:', p1.calcSA())