a = @()sinfun1(20000);
b = @()sinfun2(20000);

time1 = timeit(a)
time2 = timeit(b)