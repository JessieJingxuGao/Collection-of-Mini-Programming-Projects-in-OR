set NODES;
set ARCS within (NODES cross NODES);
param dis {ARCS}>=0;
param ava {NODES} default 0;
var x{ARCS} >= 0;

minimize cost:
	sum {(i,j) in ARCS} dis[i,j]*x[i,j];
subject to balance {i in NODES}:
	sum {(i,j) in ARCS} x[i,j] - sum {(j,i) in ARCS} x[j,i] = ava[i];
	
