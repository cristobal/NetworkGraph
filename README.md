#### Code Sample

	import com.furusystems.network.graph.*;
				
	var graph:Graph = new Graph();
	graph.addEdge(0, 5, 1);
	graph.addEdge(0, 1, 13);
				
	graph.addEdge(5, 4, 4);
	graph.addEdge(5, 2, 9);
				
	graph.addEdge(1, 5, 2);
	graph.addEdge(1, 2, 1);
				
	graph.addEdge(2, 1, 3);
	graph.addEdge(2, 3, 6);
				
	graph.addEdge(4, 2, 3);
	graph.addEdge(4, 3, 10);
	
	// Search using Dijkstra (weights can not be non-negative)
	trace("--- Dijkstra --");
	var path:Vector.<Edge> = GraphSearch.findShortestPathDijkstra(graph, 0, 3);
	for each (var edge:Edge in path) {
		trace(edge);
	}
	trace("\n");

	// Search using Breadth First Search (does not take weight's into account)
    trace("--- BFS --");
	path = GraphSearch.findShortestPathBFS(graph, 0, 3);
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
	0,5,1
	5,4,4
	4,2,3
	2,3,6

	--- BFS --
	0,5,-1
	5,4,-1
	4,3,-1

	--- Graph --- 
	0,5,1
	0,1,13
	5,4,4
	5,2,9
	1,5,2
	1,2,1
	2,1,3
	2,3,6
	4,2,3
	4,3,10

	--- Adjacency Matrix --- 
	\, 0, 1, 2, 3, 4, 5
	0, 0, 1, 0, 0, 0, 1
	1, 0, 0, 1, 0, 0, 1
	2, 0, 1, 0, 1, 0, 0
	3, 0, 0, 0, 0, 0, 0
	4, 0, 0, 1, 1, 0, 0
	5, 0, 0, 1, 0, 1, 0