import numpy as np

Student = ["Alice", "Bob", "Chris", "Dylan", "Eve"]
NumberOfFriends = np.array([1, 2, 2, 2, 1])
Love = np.array([1.0, 1.0, 1.0, 1.0, 1.0])

for i in range(1, 10):
  ShareTheLove = Love/NumberOfFriends
  # left boundary, array index starts from 0 in Python
  Love[0] = 0.15 + 0.85 * ShareTheLove[1]
  Love[4] = 0.15 + 0.85 * ShareTheLove[3]
  # internal nodes, Numpy array range does not include the "end",
  # i.e. array[0:3] => gives array elements 0, 1, 2
  Love[1:4] = 0.15 + 0.85 * (ShareTheLove[0:3] + ShareTheLove[2:5])
