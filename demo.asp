#include "simpleInstances/inst1.asp".
#include "parsing.asp".
#include "convert_input.asp".

#const n=1.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    GENERATING ACTIONS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Picking Up Shelf actions
{pickUpShelf(I,S,T):S=1..NS, numShelves(NS)}1:- I=1..NR, numRobots(NR), T=0..n.

% Putting Down Shelf actions
{putDownShelf(I,S,T):S=1..NS, numShelves(NS)}1:- I=1..NR, numRobots(NR), T=0..n.

% Robot moving actions
{robotMove(I,(0,1),T);robotMove(I,(0,-1),T);robotMove(I,(-1,0),T);robotMove(I,(1,0),T)}1 :- I=1..R, numRobots(R), T=0..n.

% Delivering Actions
{deliver(R,OI,DQ,T):OI=1..NO, numOrders(NO), DQ=1..NU_O, order(OI,PK,PR,NU_O,T), NU_O>0}1:- R=1..NR, numRobots(NR), T=0..n.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    ACTION CONSTRAINTS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%        ROBOT MOVING        %%%%%%%%%%%%
% Robot cannot move outside of the grid
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), X+DX<0.
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), Y+DY<0.
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), X+DX>NR, numRows(NR).
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), Y+DY>NC, numColumns(NC).


%%%%%%%%%%%%      PICKING UP SHELF      %%%%%%%%%%%%
% A shelf cant be picked up by 2 robots
:- pickUpShelf(I1,S,T), pickUpShelf(I2,S,T), I1!=I2.

% A robot cannot pickup a shelf if it already has one.
:- pickUpShelf(I,S1,T), shelf(S2,robot,I,T).

% A robot cannot pickup a shelf a shelf is already on a robot
:- pickUpShelf(I1,S,T), shelf(S,robot,I2,T).

% A robot can pick up shelf only if it is on the node containing that shelf
:- pickUpShelf(I,S,T), shelf(S,node,ND,T), not robot(I,ND,T). 



%%%%%%%%%%%%     PUTTING DOWN SHELF     %%%%%%%%%%%%
% A shelf cant be putDown by 2 robots
:- putDownShelf(I1,S,T), putDownShelf(I2,S,T), I1!=I2.

% A robot can put down a shelf only if it has one.
:- putDownShelf(I,S,T), not shelf(S,robot,I,T).

% A robot cannot putdown a shelf on a highway
:- putDownShelf(I,S,T), robot(I,ND,T), highway(ND).  


%%%%%%%%%%%%         DELIVERING         %%%%%%%%%%%%

% Can only deliver if robot is on picking station
:- deliver(R,OI,DQ,T), robot(R,ND,T), order(OI,PK,PR,OU,T), not pickingStation(PK,ND).

% Can only deliver if robot has the shelf containing product
:- deliver(R,OI,DQ,T), robot(R,ND,T), order(OI,PK,PR,OU,T), product(PR,SH,PQ,T), not shelf(SH,robot,R,T).

% Cannot deliver more quantities than the order.
:- deliver(_,OI,DQ,T), order(OI,PK,PR,OU,T), DQ>OU.

% Cannot deliver more quantities than the product.
:- deliver(R,OI,DQ,T), robot(R,ND,T), order(OI,PK,PR,OU,T), product(PR,SH,PQ,T), DQ>PQ.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    STATES CONSTRAINTS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%        ROBOT        %%%%%%%%%%%%
% No 2 robots on the same node
:- 2{robot(I,ND,T)}, node(ND,(X,Y)), T=0..n.

% No robot on 2 nodes
:- robot(I,N1,T), robot(I,N2,T), N1!=N2, T=0..n.


%%%%%%%%%%%%        SHELF        %%%%%%%%%%%%
% No 2 shelves on the same robot
:- 2{shelf(S,robot,NR,T)}, robot(NR,_,T), T=0..n.

% No 2 shelves on the same node
:- 2{shelf(S,robot,ND,T)}, node(ND,_), T=0..n.

% No shelf on 2 locations (robot, node)
:- shelf(S,node,ID1,T), shelf(S,node,ID2,T), ID1!=ID2.
:- shelf(S,robot,ID1,T), shelf(S,robot,ID2,T), ID1!=ID2.
:- shelf(S,node,ID1,T), shelf(S,robot,ID2,T).

% Actions are exclusive
:- 1{robotMove(R,_,T)}, 1{pickUpShelf(R,_,T)}, 1{putDownShelf(R,_,T)}, 1{deliver(R,_,_,T)}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      ACTION EFFECTS       %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Effect of moving a robot
robot(I,N_ND,T+1):-robot(I,ND,T), robotMove(I,(DX,DY),T), node(ND,(X,Y)), node(N_ND,(X+DX,Y+DY)).

%Effect of picking up a shelf
shelf(S, robot, NR, T+1):-robot(NR,ND,T), pickUpShelf(NR,S,T).

%Effect of putting down a shelf
shelf(S, node, ND, T+1):-robot(I,ND,T), putDownShelf(NR,S,T).

%Effect of delivering a product
order(OI,PK,PR,OU-DQ,T+1):- deliver(R,OI,DQ,T), order(OI,PK,PR,OU,T).
product(PR,SH,PQ-DQ,T+1):- deliver(R,OI,DQ,T), order(OI,PK,PR,OU,T), product(PR,SH,PQ,T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      LAW OF INERTIA       %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

{robot(I,N,T+1)}:-robot(I,N,T), T<n.
{shelf(S, L, ID, T+1)}:-shelf(S, L, ID, T), T<n.
{order(O,PK,PR,U,T+1)}:-order(O,PK,PR,U,T), T<n.

:- not order(O,PK,PR,0,n), order(O,PK,PR,U,0).

#show robot/3.
#show shelf/4. 
%#show highway/1. 
#show pickingStation/2. 
%#show product/4. 
%#show order/5. 
%#show node/2.

#show robotMove/3.
#show deliver/4.
#show pickUpShelf/3.
#show putDownShelf/3.
