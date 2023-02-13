#!/usr/bin/python3
import math
class Pyramid:
  w = 0.0
  l = 0.0
  h = 0.0
  def __init__(self):
    self.w = 0.0
    self.l = 0.0
    self.h = 0.0
  
  def calcVol(self):
    vol = ((float(self.w) * float(self.l) * float(self.h))/3)
    return vol

  def calcSA(self):
    sa = (float(self.l) * float(self.w)) + (float(self.l)*math.sqrt(((float(self.w)/2)*(float(self.w)/2)) + (float(self.h)*float(self.h)))) + (float(self.w)*math.sqrt(((float(self.l)/2)*(float(self.l)/2)) + (float(self.h)*float(self.h))))
    return sa