#include "sampleInstances/inst1.asp".


numNodes(ND):- ND=#count{I:init(object(node,I),value(at,pair(X,Y)))}.
numShelves(ND):- ND=#count{I:init(object(shelf,I),value(at,pair(X,Y)))}.
numProducts(ND):- ND=#count{I:init(object(product,I),value(on,pair(X,Y)))}.
numPickingStation(ND):- ND=#count{I:init(object(pickingStation,I),value(at,pair(X,Y)))}.
numOrders(ND):- ND=#count{I:init(object(order,I),value(pickingStation,J))}.
numRobots(ND):- ND=#count{I:init(object(robot,I),value(at,pair(X,Y)))}.
node(ND,(X,Y)):- init(object(node,ND), value(at, pair(X,Y))).
highway(ND):- init(object(highway,ND), value(at, pair(X,Y))).
pickingStation(I,ND):-init(object(pickingStation,I),value(at,pair(X,Y))), node(ND,(X,Y)).

#const n=3.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No robot on 2 nodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- robot(I,N1,T), robot(I,N2,T), N1!=N2.
:- shelf(I,N1,T), shelf(I,N2,T), N1!=N2.

shelf(I,ND,0):-init(object(shelf,I),value(at,pair(X,Y))), node(ND,(X,Y)).
robot(I,ND,0):-init(object(robot,I),value(at,pair(X,Y))), node(ND,(X,Y)).
product(I,SH,U,0):-init(object(product,I),value(on,pair(SH,U))), shelf(SH,ND,0).
order(I,PR,U,ND,unfullfilled, 0):-init(object(order,I),value(line,pair(PR,U))),init(object(order,I),value(pickingStation,PK)),pickingStation(PK,ND).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No 2 robots on the same node
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:- 2{robot(I,ND,T)}, node(ND,(X,Y)), T=1..n.
:- 2{shelf(I,ND,T)}, node(ND,(X,Y)), T=1..n.

action(move, (0,1;1,0;0,-1;-1,0)).

robot(I,N_ND,T+1):-robot(I,ND,T), action(move, (DX,DY)), node(ND,(X,Y)), node(N_ND,(X+DX,Y+DY)).


%#show action/2.
#show robot/3. 
%#show shelf/3. 
%#show highway/1. 
%#show pickingStation/2. 
%#show product/3. 
%#show order/5. 
%#show node/3.