# District-Traffic-Planning
Find a balance between reduced cut-through traffic and accessibility of your district.  

**step 1: create coordinates set of crossroads     

a.define and save waypoints on gps visualizer   
http://www.gpsvisualizer.com/draw/ 

b.save in gpx format.

c.convert gpx data to svg  
http://www.gpsvisualizer.com/map_input?form=svg  

d.save in svg format  

**step 2 : create data file 'stratenplan.dat'  

a. use xcoord/ycoord from step 1 to define nodes (crossroads a-k)  

b. define set of accesspoints to your district (toegangspoort set)   

c. define set of all fixed street directions based on existing setup (initialstraat set)  

d. define set of all changeable street directions (changestreet set). Make list as long as possible limited by calculation time and your AMPL license. Avoid repeats in initialstraat and changestreet.      

e. define length param for all street directions. Actual length is irrelevant. We consider crossroads as nodes in a graph--> length =1. I use length=3 for traffic lights to consider time loss.       

f. impose certain requirements via set enkelrichting, set tweerichting, set vasterichting   

g. impose requirements on inbound and outbound distances between any street and an accesspoint.   
   conflicting requirements lead to failure.  
   
h. use langsteuitweg, langsteinweg param to give maximum inbound and outbounddistances for any node.  
	this ensures that all nodes have reasonable travel distances.  

**step 3: solve in ampl ( minimizes bidirectional streets) 

**step 4. open '2018plan.svg' to evaluate your result.   

Repeat from step 2d. until you are satisfied with the outcome. 

Have fun!
