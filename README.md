为了便于检查计算结果的正确性，作业内容结合文献*模拟了四个能量的质子(100MeV、150MeV、200MeV、230MeV)在水中的能损曲线。

Geant4源代码和四个能量的计算数据、作图结果、数据处理程序均存放在本文件目录下。

模拟过程中，质子从坐标轴上(0cm,0cm,-50cm)的位置沿Z轴正方向出射，定义的水体积为100cm*100cm*100cm，也即质子的入射位置就位于水的边缘上。

计算过程为了减少统计误差，同时又避免数据量过大，每个能量都设置了10000个质子入射，最后的能损曲线为10000个质子分别的能损曲线求平均所得。由于Geant4数据记录时是按照一次能量沉积记录一次，在某个范围内可能有多次能量沉积，所以数据处理过程中以10cm为一段，分别计算0~10cm，10cm~20cm以此类推各段中的能量沉积之和再进行的画图。
    
与文献相比，较大的不同出现在深度小于10cm位置处，模拟结果出现了很多小峰，猜测可能是在这个过程中可能由于非弹性散射产生次级粒子沉积了部分能量导致了小峰的出现。
