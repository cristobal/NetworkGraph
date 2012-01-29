#### Code Sample

	import com.furusystems.network.graph.*;
				
	var graph:Graph = new Graph();
	graph.addEdge(0, 55, 1);
	graph.addEdge(0, 11, 13);
				
	graph.addEdge(55, 44, 4);
	graph.addEdge(55, 22, 9);
				
	graph.addEdge(11, 55, 2);
	graph.addEdge(11, 22, 1);
				
	graph.addEdge(22, 11, 3);
	graph.addEdge(22, 33, 6);
				
	graph.addEdge(44, 22, 3);
	graph.addEdge(44, 33, 10);
	
	// Search using Dijkstra (weights can not be non-negative)
	trace("--- Dijkstra --");
	var path:Vector.<Edge> = GraphSearch.findShortestPathDijkstra(graph, 0, 33);
	for each (var edge:Edge in path) {
		trace(edge);
	}
	trace("\n");

	// Search using Breadth First Search (does not take weight's into account)
    trace("--- BFS --");
	path = GraphSearch.findShortestPathBFS(graph, 0, 33);
	for each (edge in path) {
		trace(edge);
	}
	trace("\n");

	// Print the edges in the Graph
	trace("--- Graph --- ");
	trace(graph);
	trace("\n");

	// Print the adjacency matrix
	trace("--- Adjacency Matrix --- ");
	trace(graph.getAdjacencyMatrix());
	trace("\n");



#### Output

	--- Dijkstra --
	0,55,1
	55,44,4
	44,22,3
	22,33,6

	--- BFS --
	0,55,-1
	55,44,-1
	44,33,-1

	--- Graph --- 
	0,55,1
	0,11,13
	55,44,4
	55,22,9
	11,55,2
	11,22,1
	22,11,3
	22,33,6
	44,22,3
	44,33,10

	--- Adjacency Matrix --- 
	\, 0, 11, 22, 33, 44, 55
	0, 0, 1, 0, 0, 0, 1
	11, 0, 0, 1, 0, 0, 1
	22, 0, 1, 0, 1, 0, 0
	33, 0, 0, 0, 0, 0, 0
	44, 0, 0, 1, 1, 0, 0
	55, 0, 0, 1, 0, 1, 0