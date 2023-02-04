# Adders
### - Carry Lookahead Adder (CLA)
#### CLA computers the Cout of K-bit blocks using generate and propagate signals (Ci+1). This type of adders is mainly used to reduce the delay due to the propagation in order to calculate the carry out.
#### CLA block diagram
![image](https://user-images.githubusercontent.com/96621514/216784316-d877a0c3-38ba-4271-aabb-d5512f6a377c.png)
#### The simulation was done on Modelsim and here is a screenshot with the output:
![Screenshot (141)](https://user-images.githubusercontent.com/96621514/216784181-6894269a-2916-4efc-9410-125e1d05689a.png)
#### <hr/>
### - Prefix Adder
#### It computers the Cout of K-bit blocks using generate and propagate signals (Ci-1). It is also used to reduce the delay due to the propagation in order to calculate the carry out but it is faster than CLA. The repo has the implementation of 4-bit prefix adder but here is the block diagram of 16-bit prefix adder.   
![image](https://user-images.githubusercontent.com/96621514/216784564-b4b27df4-1686-4422-bef8-0f26e44b2f74.png)
#### The output of the simulation:
![Screenshot (142)](https://user-images.githubusercontent.com/96621514/216784601-b60d90bc-6302-4da0-a12e-95b94c74b96e.png)

