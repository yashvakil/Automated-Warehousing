


% FILE CONVERTS THE INIT TO OUR FORMAT




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Each (X,Y) coordinate is assigned an identity number
% Eg: node(15,(4,3)) = coordinate '(4,3)' is has identity '15' 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
node(ND,(X,Y)):- init(object(node,ND), value(at, pair(X,Y))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Node 'ND' is a highway
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
highway(ND):- init(object(highway,ND), value(at, pair(X,Y))).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Picking Station with identity 'I' is at node 'ND'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pickingStation(I,ND):-init(object(pickingStation,I),value(at,pair(X,Y))), node(ND,(X,Y)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Shelf with identity 'I' is at node 'ND' at Timestamp 'T'
% Here T is 0 cause initial condition.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
shelf(I,ND,0):-init(object(shelf,I),value(at,pair(X,Y))), node(ND,(X,Y)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Robot with identity 'I' is at node 'ND' at Timestamp 'T'
% Here T is 0 cause initial condition.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
robot(I,ND,0):-init(object(robot,I),value(at,pair(X,Y))), node(ND,(X,Y)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Product with identity 'I' is on shelf 'SH' 
% and has quantity 'U' at Timestamp 'T'
% Here T is 0 cause initial condition.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
product(I,SH,U,0):-init(object(product,I),value(on,pair(SH,U))), shelf(SH,ND,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Order with identity 'I' is of product 'P' 
% and quantity 'U' has status 'ST' at Timestamp 'T'
% Here ST is unfullfilled cause initial condition.
% Here T is 0 cause initial condition.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
order(I,PR,U,unfullfilled, 0):-init(object(order,I),value(line,pair(PR,U))),init(object(order,I),value(pickingStation,PK)),pickingStation(PK,ND).