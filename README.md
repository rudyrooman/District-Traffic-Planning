# District-Traffic-Planning
Balance reduced cut-through traffic with accessibility of your city district.   

**step 1: create coordinates set of crossroads**     

a.define and save waypoints on gps visualizer   
http://www.gpsvisualizer.com/draw/ 

b.save in gpx format.

c.convert gpx data to svg  
http://www.gpsvisualizer.com/map_input?form=svg  

d.save in svg format  

**step 2 : draw map of existing situation** 

Go tot /drawsvgmap/ and populate a *.dat file with your data.  
Run tekenstratenplan.run in ampl ide and result is graph.svg  
  
**step 3 : create data file 'stratenplan.dat'**  

a. use xcoord/ycoord from step 2 to define nodes (crossroads a-k)  

b. define set of accesspoints to your district (toegangspoort set)   

c. define set of all current street directions based on existing setup  

d. define set of all changeable street directions (changestreet set). Make list as long as possible limited by calculation time and your AMPL license. Avoid repeats in initialstraat and changestreet.      

e. define length param. Actual length is irrelevant and default =1 (nodes in a graph). I use length=3 for traffic lights to consider time loss.       

f. impose certain requirements via set enkelrichting, set tweerichting, set vasterichting   

g. impose requirements on maximum  inbound and outbound distances between any street and an accesspoint.   
   conflicting requirements lead to failure.  
   
h. use langsteuitweg, langsteinweg param to give maximum inbound and outbounddistances for any node.  
	this ensures that all nodes have reasonable travel distances.  

**step 4: solve in ampl ( minimizes bidirectional streets)** 

**step 5. open '2018plan.svg' to evaluate your result.**   

Repeat from step 2d. until you are satisfied with the outcome. 

Have fun!
