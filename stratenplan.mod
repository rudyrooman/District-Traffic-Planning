param langsteuitweg integer;
param langsteinweg integer;

set kruispunt;
param xcoord {kruispunt};
param ycoord {kruispunt};

# access points to your district
set toegangspoort within kruispunt;

# current plan 
set currentstreet within kruispunt cross kruispunt  ;

# changeable street directions
set changestreet within kruispunt cross kruispunt  ;
var richtinggebruikt { changestreet } integer >=0;

# fixed street directions
set fixstreet = currentstreet diff changestreet  ;

set straat = fixstreet union changestreet; 
param lengte { straat } default 1 integer; 

set enkelrichting within changestreet;
set tweerichting within changestreet;
set vasterichting within changestreet;

# hieronder de inrij voorwaarden. 
set inrijden within toegangspoort cross (kruispunt diff toegangspoort); 
param maxinafstand {inrijden} default langsteinweg integer;
var afstandin {inrijden}; 

set inroute = {inrijden,straat};
var Usein {inroute} integer >=0,<=1;   

subject to Afgelegdewegin {(i,j) in inrijden } :sum {(k,l) in straat } Usein[i,j,k,l]* lengte[k,l] = afstandin [i,j];

subject to constraininrijden {(i,j) in inrijden}: afstandin [i,j] <= langsteinweg;
subject to constraintafgelegdeweg {(i,j) in inrijden}: afstandin [i,j] <= maxinafstand[i,j];

subject to Beginin {(i,j) in inrijden} : sum {k in kruispunt : (i,k) in straat } Usein[i,j,i,k] = 1;
subject to nietaankomeninstartin{(i,j) in inrijden} : sum {k in kruispunt : (k,i) in straat } Usein[i,j,k,i] = 0;

subject to nietvertrekkenindoelin {(i,j) in inrijden } : sum {k in kruispunt : (j,k) in straat  }  Usein[i,j,j,k] = 0;
subject to Doelin {(i,j) in inrijden }: sum {k in kruispunt : (k,j) in straat } Usein[i,j,k,j] = 1;

subject to kruispuntevenwichtin {(i,j) in inrijden, l in kruispunt : l <> i and l <> j }:
   	sum {k in kruispunt : (k,l) in straat} Usein[i,j,k,l] = sum {m in kruispunt: (l,m) in straat } Usein[i,j,l,m];
   
# hieronder de uitrij voorwaarden. 
set uitrijden within (kruispunt diff toegangspoort) cross toegangspoort; 
param maxuitafstand {uitrijden} default langsteuitweg integer; 
var afstanduit {uitrijden}; 

set uitroute = {uitrijden,straat};
var Useuit {uitroute} integer >=0, <=1;   

subject to Afgelegdeweguit {(i,j) in uitrijden } :sum {(k,l) in straat } Useuit[i,j,k,l]* lengte[k,l]= afstanduit [i,j];

subject to constrainuitrijden {(i,j) in uitrijden}: afstanduit [i,j] <= langsteuitweg;
subject to constraintuitafgelegdeweg {(i,j) in uitrijden}: afstanduit [i,j] <= maxuitafstand[i,j];
#subject to constraintminuitafgelegdeweg {(i,j) in uitrijden}: afstanduit [i,j] >= minuitafstand[i,j];

subject to Beginuit {(i,j) in uitrijden} : sum {k in kruispunt : (i,k) in straat } Useuit[i,j,i,k] = 1;
subject to nietaankomeninstartuit{(i,j) in uitrijden} : sum {k in kruispunt : (k,i) in straat } Useuit[i,j,k,i] = 0;

subject to nietvertrekkenindoeluit {(i,j) in uitrijden } : sum {k in kruispunt : (j,k) in straat  }  Useuit[i,j,j,k] = 0;
subject to Doeluit {(i,j) in uitrijden }: sum {k in kruispunt : (k,j) in straat } Useuit[i,j,k,j] = 1;

subject to kruispuntevenwichtuit {(i,j) in uitrijden, l in kruispunt : l <> i and l <> j }:
   	sum {k in kruispunt : (k,l) in straat} Useuit[i,j,k,l] = sum {m in kruispunt: (l,m) in straat } Useuit[i,j,l,m];

# voorwaarden voor Use_in
subject to richtinginmoetbestaan {(i,j) in inrijden, (k,l) in changestreet}: Usein[i,j,k,l] <=  richtinggebruikt[k,l];

# voorwaarden voor Use_out
subject to richtinguitmoetbestaan {(i,j) in uitrijden, (k,l) in changestreet}: Useuit[i,j,k,l] <= richtinggebruikt[k,l];

# minimaal 1 richting 
subject to eenrichtingen {(i,j) in changestreet }: richtinggebruikt[i,j] + richtinggebruikt[j,i] >=1 ;

# verplichte enkelrichting 
subject to enkelrichtingen {(i,j) in enkelrichting }: richtinggebruikt[i,j] + richtinggebruikt[j,i] =1 ;

# verplichte dubbelerichting 
subject to tweerichtingen {(i,j) in tweerichting  }: richtinggebruikt[i,j] + richtinggebruikt[j,i] =2 ;

# rijrichting opgelegd
subject to opgelegderichting {(i,j) in vasterichting  }: richtinggebruikt[i,j] =1 ;

minimize tweerichtingsstraten : sum { (i,j) in changestreet } richtinggebruikt[i,j] ;


           
