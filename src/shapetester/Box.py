class Box:
  w = 0.0
  l = 0.0
  h = 0.0
  def __init__(self):
    self.l = 0.0
    self.w = 0.0
    self.h = 0.0
  
  def calcVol(self):
    vol = float(self.l) * float(self.w) * float(self.h)
    return vol

  def calcSA(self):
    sa = 2*(float(self.l) * float(self.w)) + 2*(float(self.l) * float(self.h)) + 2*(float(self.h) * 
float(self.w))
    return sa