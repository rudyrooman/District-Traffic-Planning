# District-Traffic-Planning
Find a balance between reduced cut-through traffic and accesibility of your district.  

step 1 : create coordinates of crossroads data   

a.select crossroads on gps visualizer   
http://www.gpsvisualizer.com/draw/ 

b.save in gpx format.

c.convert gpx data to svg  
http://www.gpsvisualizer.com/map_input?form=svg  

d.save in svg format  

step 2 : create data file 'stratenplan.dat'  

a. use xcoord/ycoord from previous step  to define crossreads ( a-k)   
b. define accespoints to your district in set toegangspoort    
c. define existing setup : Every streetdirection is specfied.     
   Actual length is irrelevant. We consider crossroads as nodes in a graph--> length =1. I use length=3 to indicate traffic lights.  
d. list the streets that you are prepared to change as a planner.   
e. impose certain requirements via set enkelrichting ,set tweerichting ,set vasterichting   
f. impose requirements on inbound and outbound distances between any street and an accesspoint 
   conflicting requirements lead to failure.  
g. use langsteuitweg , langsteinweg param to give maximum inbound and outbounddistances for any node.  
	this ensures that all streets have reasonable travel distances.  

step 3: solve in ampl  

step 4. evaluate the result in svg format.   

