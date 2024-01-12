#input file format: K_value coverage_value
#file name: results_128_56.txt

import matplotlib.pyplot as plt

in_file_0 = open("results_128_56.txt", "r")
in_file_1 = open("results_56_56.txt", "r")
in_file_2 = open("results_4_0.txt", "r")
x_0 = []
x_1 = []
x_2 = []
y_0 = []
y_1 = []
y_2 = []

for line in in_file_0:
    line = line.strip()
    line = line.split()
    x_0.append(float(line[0]))
    y_0.append(float(line[1]))

for line in in_file_1:
    line = line.strip()
    line = line.split()
    x_1.append(float(line[0]))
    y_1.append(float(line[1]))

for line in in_file_2:
    line = line.strip()
    line = line.split()
    x_2.append(float(line[0]))
    y_2.append(float(line[1]))


plt.plot(x_0, y_0, 'r.')
plt.plot(x_1, y_1, 'b.')
plt.plot(x_2, y_2, 'g.')
plt.axis([1, 2, 0, 100])
plt.xlabel('K value')
plt.ylabel('Coverage value')
plt.savefig('%s.png' % in_file_0.name)