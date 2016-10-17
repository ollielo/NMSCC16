NumberOfNeighbors = c(2, 2, 2, 2, 2)
Milk = c(0, 0, 1, 0, 0)
barplot(Milk, ylim = c(0, 1))

for (i in 1:80) {
    ShareTheMilk = Milk/NumberOfNeighbors
    # left boundary, index starts at 1
    Milk[1] = ShareTheMilk[5] + ShareTheMilk[2]
    # right boundary
    Milk[5] = ShareTheMilk[4] + ShareTheMilk[1]
    Milk[2:4] = ShareTheMilk[1:3] + ShareTheMilk[3:5]
    print(Milk)
    barplot(Milk, ylim = c(0, 1))
}
