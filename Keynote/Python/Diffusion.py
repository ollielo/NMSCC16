import numpy as np

NumberOfNeighbors = np.array([2, 2, 2, 2, 2])
Milk = np.array([0.0, 0.0, 1.0, 0.0, 0.0])
print Milk

for i in range(0, 10):
  ShareTheMilk = Milk/NumberOfNeighbors
  Milk[0] = ShareTheMilk[4] + ShareTheMilk[1]
  Milk[4] = ShareTheMilk[3] + ShareTheMilk[0]
  
  Milk[1:4] = ShareTheMilk[0:3] + ShareTheMilk[2:5]
  print Milk
