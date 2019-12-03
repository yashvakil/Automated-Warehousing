#include "simpleInstances/inst1.asp".
#include "parsing.asp".
#include "convert_input.asp".

#const n=20.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%    GENERATING ACTIONS     %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Robot moving actions
{robotMove(I,(0,1),T);robotMove(I,(0,-1),T);robotMove(I,(-1,0),T);robotMove(I,(1,0),T)}1 :- I=1..R, numRobots(R), T=0..n.

% Picking Up Shelf actions
{pickUpShelf(I,S,T):S=1..NS, numShelves(NS)}1:- I=1..NR, numRobots(NR), T=0..n.

% Putting Down Shelf actions
{putDownShelf(I,S,T):S=1..NS, numShelves(NS)}1:- I=1..NR, numRobots(NR), T=0..n.




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
:- shelf(S,L1,ID1,T), shelf(S,L2,ID2,T), L1!=L2, ID1!=ID2.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      ACTION EFFECTS       %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Effect of moving a robot
robot(I,N_ND,T+1):-robot(I,ND,T), robotMove(I,(DX,DY),T), node(ND,(X,Y)), node(N_ND,(X+DX,Y+DY)).

%Effect of picking up a shelf
shelf(S, robot, NR, T+1):-robot(NR,ND,T), pickUpShelf(NR,S,T).

%Effect of putting down a shelf
shelf(S, node, ND, T+1):-robot(I,ND,T), putDownShelf(NR,S,T).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      LAW OF INERTIA       %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

{robot(I,N,T+1)}:-robot(I,N,T), T<n.
{shelf(S, L, ID, T+1)}:-shelf(S, L, ID, T), T<n.


%#show moves/2.
%#show action/2.
%#show robot/3.
%#show robotMove/3.
#show pickUpShelf/3.
%#show putDownShelf/3.
%#show shelf/4. 
%#show highway/1. 
%#show pickingStation/2. 
%#show product/3. 
%#show order/5. 
%#show node/3.