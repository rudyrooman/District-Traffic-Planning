# District-Traffic-Planning
Find a balance between reduced cut-through traffic and accessibility of your district.  

step 1: create coordinates set of crossroads     

a.select crossroads on gps visualizer   
http://www.gpsvisualizer.com/draw/ 

b.save in gpx format.

c.convert gpx data to svg  
http://www.gpsvisualizer.com/map_input?form=svg  

d.save in svg format  

step 2 : create data file 'stratenplan.dat'  

a. use xcoord/ycoord from previous step  to define nodes (crossroads a-k)     
b. define accesspoints to your district in set toegangspoort    
c. define existing setup : Specify every streetdirection.       
   Actual length is irrelevant. We consider crossroads as nodes in a graph--> length =1. I use length=3 for traffic lights to consider time loss.  
d. list the streets that you are prepared to change as a planner. Make list as long as possible limited by calculation time and your AMPL license.    
e. impose certain requirements via set enkelrichting ,set tweerichting ,set vasterichting   
f. impose requirements on inbound and outbound distances between any street and an accesspoint.   
   conflicting requirements lead to failure.    
g. use langsteuitweg , langsteinweg param to give maximum inbound and outbounddistances for any node.  
	this ensures that all streets have reasonable travel distances.  

step 3: solve in ampl ( minimizes bidirectional streets) 

step 4. open '2018plan.svg' to evaluate your result.   

Repeat from step 2d. until you are satisfied with the outcome. 

Have fun!
