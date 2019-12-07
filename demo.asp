#include "parsing.asp".
#include "convert_input.asp".

#const n=50.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    GENERATING ACTIONS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

move(0,1;0,-1;-1,0;1,0).

{robotMove(R,move(DX,DY),T):move(DX,DY)}1:- R=1..NR, numRobots(NR), T=0..TN,TN=n-1.
{pickUpShelf(R,SI,T):shelf(SI)}1:- R=1..NR, numRobots(NR), T=0..TN,TN=n-1.
{putDownShelf(R,SI,T):shelf(SI)}1:- R=1..NR, numRobots(NR), T=0..TN,TN=n-1.
{deliver(R,OI,with(SI,PR,DQ),T):orderAt(OI,object(node,ND),contains(PR,OQ),T), productOn(PR,object(shelf,SI),with(quantity,PQ),T), DQ=1..PQ}1:- R=1..NR, numRobots(NR), T=0..TN,TN=n-1.

occurs(object(robot,R),move(DX,DY),T):-robotMove(R,move(DX,DY),T).
occurs(object(robot,R),pickup,T):-pickUpShelf(R,_,T).
occurs(object(robot,R),putdown,T):-putDownShelf(R,_,T).
occurs(object(robot,R),deliver(OI,PRI,DQ),T):-deliver(R,OI,with(SI,PRI,DQ),T).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    ACTION CONSTRAINTS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- occurs(object(robot,R),A1,T), occurs(object(robot,R),A2,T), A1!=A2.

%%%%%%%%%%%%        ROBOT MOVING        %%%%%%%%%%%%
% Robot cannot move outside of the grid
:- robotAt(RI,object(node,ND),T), robotMove(R,move(DX,DY),T), nodeAt(ND,pair(X,Y)), X+DX<1.
:- robotAt(RI,object(node,ND),T), robotMove(R,move(DX,DY),T), nodeAt(ND,pair(X,Y)), Y+DY<1.
:- robotAt(RI,object(node,ND),T), robotMove(R,move(DX,DY),T), nodeAt(ND,pair(X,Y)), X+DX>NC, numColumns(NC).
:- robotAt(RI,object(node,ND),T), robotMove(R,move(DX,DY),T), nodeAt(ND,pair(X,Y)), Y+DY>NR, numRows(NR).


%%%%%%%%%%%%      PICKING UP SHELF      %%%%%%%%%%%%
% A shelf cant be picked up by 2 robots
:- 2{pickUpShelf(R,S,T): robot(R)}, shelf(S).

% A robot cannot pickup a shelf if it already has one.
:- pickUpShelf(RI,S1,T), shelfOn(S2,object(robot,RI),T).

% A robot cannot pickup a shelf a shelf is already on a robot
:- pickUpShelf(R1,S,T), shelfOn(S,object(robot,R2),T).

% A robot can pick up shelf only if it is on the node containing that shelf
:- pickUpShelf(RI,S,T), shelfOn(S,object(node,ND),T), not robotAt(RI,object(node,ND),T). 


%%%%%%%%%%%%     PUTTING DOWN SHELF     %%%%%%%%%%%%
% A shelf cant be putDown by 2 robots
:- 2{putDownShelf(R,S,T): robot(R)}, shelf(S).

% A robot can put down a shelf only if it has one.
:- putDownShelf(RI,S,T), not shelfOn(S,object(robot,RI),T).

% A robot cannot putdown a shelf on a highway
:- putDownShelf(RI,S,T), robotAt(RI,object(node,ND),T), highway(ND). 


%%%%%%%%%%%%         DELIVERING         %%%%%%%%%%%%

% Can only deliver if robot is on picking station
:- deliver(R,OI,with(_,PR,_),T), orderAt(OI,object(node,ND),contains(PR,_),T), not robotAt(R,object(node, ND),T).

% Can only deliver if robot has the shelf containing product
:- deliver(R,OI,with(SI,PR,_),T), productOn(PR,object(shelf,SI),with(quantity,_),T), not shelfOn(SI,object(robot,R),T).

% Cannot deliver more quantities than the order.
:- deliver(R,OI,with(SI,PR,DQ),T), orderAt(OI,object(node,ND),contains(PR,OQ),T), DQ>OQ.

% Cannot deliver more quantities than the product.
:- deliver(R,OI,with(SI,PR,DQ),T), productOn(PR,object(shelf,SI),with(quantity,PQ),T), DQ>PQ.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    STATES CONSTRAINTS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- pickingStationAt(_,NDI), highway(NDI).

%%%%%%%%%%%%        ROBOT        %%%%%%%%%%%%
% No robot on 2 nodes
:- 2{robotAt(R,object(node,ND),T):node(ND)}, robot(R), T=0..n.

% No 2 robots on the same node
:- 2{robotAt(R,object(node,ND),T):robot(R)}, node(ND), T=0..n.

% Robots cant swap places
:- robotAt(R1,object(node,ND1),T), robotAt(R1,object(node,ND2),T+1), robotAt(R2,object(node,ND2),T), robotAt(R2,object(node,ND1),T+1), R1!=R2.


%%%%%%%%%%%%        SHELF        %%%%%%%%%%%%

% No shelf on 2 robots
:- 2{shelfOn(S,object(robot,NR),T): robot(NR)}, shelf(S), T=0..n.

% No 2 shelves on the same robot
:- 2{shelfOn(S,object(robot,NR),T): shelf(S)}, robot(NR), T=0..n.

% No shelf on 2 nodes
:- 2{shelfOn(S,object(node,ND),T): node(ND)}, shelf(S), T=0..n.

% No 2 shelves on the same node
:- 2{shelfOn(S,object(node,ND),T): shelf(S)}, node(ND), T=0..n.

% No shelf on 2 locations (robot, node)
:- shelfOn(S,object(node,_),T), shelfOn(S,object(robot,_),T).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      ACTIONS EFFECTS      %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Effect of moving a robot
robotAt(R,object(node,NEW_ND),T+1):- robotAt(R,object(node,ND),T), nodeAt(ND,pair(X,Y)), nodeAt(NEW_ND, pair(X+DX,Y+DY)), robotMove(R,move(DX,DY),T).

% Effect of picking up a shelf
shelfOn(S,object(robot,RI),T+1):- pickUpShelf(RI,S,T), shelfOn(S,object(node,ND),T), robotAt(RI,object(node,ND),T).

%Effect of putting down a shelf
shelfOn(S,object(node,ND),T+1):- putDownShelf(RI,S,T), shelfOn(S,object(robot,RI),T), robotAt(RI,object(node,ND),T).

%Effect of delivering a product
orderAt(OI,object(node,ND),contains(PR,OU-DQ),T+1):- deliver(R,OI,with(SI,PR,DQ),T), orderAt(OI,object(node,ND),contains(PR,OU),T).
productOn(PR,object(shelf,SI),with(quantity,PQ-DQ),T+1):- deliver(R,OI,with(SI,PR,DQ),T), productOn(PR,object(shelf,SI),with(quantity,PQ),T).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      LAW OF INERTIA       %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

robotAt(R,object(node,ND),T+1):- robotAt(R,object(node,ND),T), not robotMove(R,move(_,_),T), T<n.
shelfOn(S,object(node,ND),T+1):-shelfOn(S,object(node,ND),T), not pickUpShelf(_,S,T), T<n.
shelfOn(S,object(robot,RI),T+1):-shelfOn(S,object(robot,RI),T), not putDownShelf(RI,S,T), T<n.
orderAt(OI,object(node,ND),contains(PR,OU),T+1):- orderAt(OI,object(node,ND),contains(PR,OU),T), productOn(PR,object(shelf,SI),with(quantity,PQ),T), not deliver(_,OI,with(SI,PR,_),T), T<n.
productOn(PR,object(shelf,SI),with(quantity,PQ),T+1):- productOn(PR,object(shelf,SI),with(quantity,PQ),T), not deliver(_,_,with(SI,PR,_),T), T<n.

:- not orderAt(OI,object(node,_),contains(PR,0),n), orderAt(OI,object(node,_),contains(PR,_),0).

numActions(N):-N=#sum{1,O,A,T:occurs(O,A,T)}.
#minimize{1,O,A,T:occurs(O,A,T)}.
#minimize{T:occurs(O,A,T)}.

%#show node/1.
%#show robot/1.
%#show shelf/1.
%#show product/1.
%#show order/1.
%#show nodeAt/2.
%#show robotAt/3.
%#show shelfOn/3.
%#show productOn/4.
%#show orderAt/4.

%#show robotMove/3.

#show occurs/3.
#show numActions/1.