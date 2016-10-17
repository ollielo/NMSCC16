Students = c("Alice", "Bob", "Chris", "Dylan", "Eve")
NumberOfFriends = c(1, 2, 2, 2, 1)
Love = c(1, 1, 1, 1, 1)
barplot(Love, ylim = c(0, 1.5), names.arg = Students)
alpha = 0.85

for (i in 1:80) {
    ShareTheLove = Love/NumberOfFriends
    # print(ShareTheLove)
    # left boundary, array index in R starts at 1.
    Love[1] = 1-alpha + alpha * ShareTheLove[2]
    # right boundary
    Love[5] = 1-alpha + alpha * ShareTheLove[4]
    # internal nodes
    Love[2:4] = 1-alpha + alpha * (ShareTheLove[1:3] + ShareTheLove[3:5])
    print(Love)
    barplot(Love, ylim = c(0, 1.5), names.arg = Students)
}
