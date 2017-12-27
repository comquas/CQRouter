# CQRouter

CQRouter is the bus routing for YBS (Yangon Bus Servie). We are using dijkstra algorithm to find the bus stops. Thanks [swift algorithm club](https://github.com/raywenderlich/swift-algorithm-club) for [Priority Queue](https://github.com/raywenderlich/swift-algorithm-club/tree/master/Priority%20Queue). **router.txt** is the main data file. It's a tree structure of bus stops. It's showing which bus stop id can arrive which bus stop. We generated this **router.txt** from sqlite database that generated from csv.

It doesn't included bus number information. This code is not optimize yet.

We took 3 months to write this code. We are using same logic in [Yangon Map Offline](https://play.google.com/store/apps/details?id=com.comquas.yangonmap&hl=en).