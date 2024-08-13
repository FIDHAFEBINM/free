import matplotlib.pyplot as plt
import numpy as np

#plotting
plt.figure(figsize=(15,15))
xpoints = np.array([1, 5])
ypoints = np.array([4, 7])

plt.subplot(3, 3, 1)
plt.plot(xpoints,ypoints,'o')

font1 = {'color':'blue'}

plt.title("Title 1")
plt.xlabel("y label", fontdict = font1)
plt.ylabel("x label", fontdict = font1)

y1 = np.array([4,2,4,2,4])
y2 = np.array([2,4,2,4,2])

plt.subplot(3,3,2)
plt.plot(y1,linestyle = 'dashed',linewidth = '2.5')
plt.plot(y2,marker = '*',linewidth = '2.5')

#markers
ypoints = np.array([1, 8, 3, 10])

plt.subplot(3,3,3)
plt.plot(ypoints,marker = 'o', ms = 10, mec = 'k', mfc = 'y')

x = np.array([80, 85, 90, 95, 100, 105, 110, 115, 120, 125])
y = np.array([240, 250, 260, 270, 280, 290, 300, 310, 320, 330])

plt.subplot(3,3,4)
plt.title("Title 2")
plt.plot(x, y)
plt.grid()

z = np.array([10,10,5])
a = np.array([99,86,103])
sizes = np.array([500])
plt.subplot(3,3,5)
plt.scatter(z, a, color = 'hotpink',s=sizes,alpha=0.5)


z = np.array([2,2,8,1,15,8,15,9,7,3,11,4,7])
a = np.array([100,105,84,105,90,99,90,95,94,100,79,112,91])
colors = np.array(["red","green","blue","yellow","pink","black","orange","purple","beige","brown","gray","cyan","magenta"])
plt.scatter(z, a, c=colors)


x = np.array(["A", "B", "C"])
y = np.array([10, 5, 14])

plt.subplot(3, 3, 6)
plt.bar(x, y, color = "red",width = 0.1)


# Graph 7 - Pie Chart
plt.subplot(3, 3, 7)
y = np.array([35, 25, 25, 15])
mylabels = ["explode", "shadow", "color", "legend"]
myexplode = [0.2, 0, 0, 0]
# Plot pie chart
plt.pie(y, labels=mylabels, explode=myexplode, startangle=90, shadow=True, autopct='%1.1f%%')
# Place legend outside the pie chart
plt.legend(title="Districts:", bbox_to_anchor=(1.05, 1), loc='upper left')


x = np.random.normal(170, 10, 250)
plt.subplot(3, 3, 8)
plt.hist(x)

ypoints = np.array([3, 8, 1, 10, 5, 7])
plt.subplot(3, 3, 9)
plt.plot(ypoints, linestyle = 'dashed')

plt.suptitle('GRAPH',fontsize=25, fontweight='bold')

plt.tight_layout()
plt.show()
