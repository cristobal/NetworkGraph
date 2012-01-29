				
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
	
	// Search using Dijkstra (weight can not be non-negative)
	trace("--- Dijkstra --");
	var path:Vector.<Edge> = GraphSearch.findShortestPathDijkstra(graph, 0, 33);
	for each (var edge:Edge on path) {
		trace(edge);
	}

	// Search using Breadth First Search (does not take weight's into account)
    trace("--- BFS --");
	path = GraphSearch.findShortestPathBFS(graph, 0, 33);
	for each (var edge:Edge on path) {
		trace(edge);
	}