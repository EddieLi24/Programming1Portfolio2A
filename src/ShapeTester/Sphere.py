import math
class Sphere:
  r = 0.0
  def __init__(self):
    self.r = 0.0
  
  def calcVol(self):
    vol = (4/3) * math.pi * (float(self.r)*float(self.r)*float(self.r))
    return vol

  def calcSA(self):
    sa = 4 * math.pi * (float(self.r)*float(self.r))
    return sa