


% FILE CALCULATES PARSES THE INIT TO GET THE NUMBERS OF "_____"



% Number of Rows of the grid
numRows(NR):- NR=#count{X:init(object(node,I),value(at,pair(X,Y)))}.

% Number of Columns of the grid
numColumns(NC):- NC=#count{Y:init(object(node,I),value(at,pair(X,Y)))}.

% Number of Nodes
numNodes(ND):- ND=#count{I:init(object(node,I),value(at,pair(X,Y)))}.

% Number of Shelves
numShelves(ND):- ND=#count{I:init(object(shelf,I),value(at,pair(X,Y)))}.

% Number of Products
numProducts(ND):- ND=#count{I:init(object(product,I),value(on,pair(X,Y)))}.

% Number of Picking Stations
numPickingStation(ND):- ND=#count{I:init(object(pickingStation,I),value(at,pair(X,Y)))}.

% Number of Orders
numOrders(ND):- ND=#count{I:init(object(order,I),value(pickingStation,J))}.

% Number of Robots
numRobots(ND):- ND=#count{I:init(object(robot,I),value(at,pair(X,Y)))}.