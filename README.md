# fractional_pde2path
Figures, video and m-files related to the paper "Numerical continuation of fractional PDEs: sharp teeth and bloated snakes" by N. Ehstand, C. Kuehn, C. Soresina.

Folders' content:
* Figures contains the figures in the paper and additional figures.
* Videos contains some videos of the solutions along the bifurcating branches.
* mFiles contains the necessary files to perform the continuation of the 1D fractional Allen-Cahn, the 1D fractional Swift-Hohenberg and the 1D fractional Schnakenberg. By running the file 'cmds1.m' in each respective folder, the program will produce and store the bifurcation diagram of these equations for various fractional orders.  

Important note: in each run of cmds1.m the matrix approximation to the fractional Laplacian is stored as 'Ks*.mat'. Thus if one desires to change the number of discretization points, nx, it is necessary to delete all 'Ks*.mat' files before running the program again to avoid errors. 
