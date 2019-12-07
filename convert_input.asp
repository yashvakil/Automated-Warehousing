nodeAt(NDI,pair(X,Y)):- init(object(node,NDI),value(at,pair(X,Y))).
pair(X,Y):- init(object(node,NDI),value(at,pair(X,Y))).
node(NDI):- init(object(node,NDI),value(at,pair(X,Y))).

highway(NDI):- init(object(highway,NDI),value(at,pair(X,Y))).

pickingStationAt(PSI,NDI):- init(object(pickingStation,PSI),value(at,pair(X,Y))), init(object(node,NDI),value(at,pair(X,Y))).
pickingStation(PSI):- init(object(pickingStation,PSI),value(at,pair(X,Y))), init(object(node,NDI),value(at,pair(X,Y))).

robotAt(RI,object(node,ND),0):- init(object(robot,RI),value(at,pair(X,Y))), nodeAt(ND,pair(X,Y)).
robot(RI):- init(object(robot,RI),value(at,pair(X,Y))).

shelfOn(SI,object(node,ND),0):- init(object(shelf,SI),value(at,pair(X,Y))), nodeAt(ND,pair(X,Y)).
shelf(SI):- init(object(shelf,SI),value(at,pair(X,Y))).

productOn(PRI,object(shelf,SI),with(quantity,PQ),0):- init(object(product,PRI),value(on,pair(SI,PQ))).
product(PRI):- init(object(product,PRI),value(on,pair(SI,PQ))).

orderAt(OI,object(node,ND),contains(PRI,PQ),0):- init(object(order,OI),value(pickingStation,PKI)), pickingStationAt(PKI,ND), init(object(order,OI),value(line,pair(PRI,PQ))).
order(OI):- init(object(order,OI),value(pickingStation,PKI)).