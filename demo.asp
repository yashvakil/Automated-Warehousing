#include "simpleInstances/inst1.asp".
#include "parsing.asp".
#include "convert_input.asp".

#const n=3.


%%%%%%%%%%%%%%%%%%%%%
%      ACTIONS      %
%%%%%%%%%%%%%%%%%%%%%

% Robot moving actions
{robotMove(I,(0,1),T);robotMove(I,(0,-1),T);robotMove(I,(-1,0),T);robotMove(I,(1,0),T)}1 :- I=1..R, numRobots(R), T=0..n.

% Robot cannot move outside of the grid
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), X+DX<0.
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), Y+DY<0.
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), X+DX>NR, numRows(NR).
:- robot(I,N,T), node(N,(X,Y)), robotMove(I,(DX,DY),T), Y+DY>NC, numColumns(NC).




%%%%%%%%%%%%%%%%%%%%%
%      OBJECTS      %
%%%%%%%%%%%%%%%%%%%%%

% No 2 robots on the same node
:- 2{robot(I,ND,T)}, node(ND,(X,Y)), T=0..n.

% No robot on 2 nodes
:- robot(I,N1,T), robot(I,N2,T), N1!=N2.

% Common Law of Inertia
{robot(I,N,T+1)}:-robot(I,N,T), T<n.

% Effect of moving a robot
robot(I,N_ND,T+1):-robot(I,ND,T), robotMove(I,(DX,DY),T), node(ND,(X,Y)), node(N_ND,(X+DX,Y+DY)).




%#show moves/2.
%#show action/2.
#show robot/3.
#show robotMove/3.
%#show shelf/3. 
%#show highway/1. 
%#show pickingStation/2. 
%#show product/3. 
%#show order/5. 
%#show node/3.