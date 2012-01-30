package com.furusystems.network.graph
{
	import flash.utils.Dictionary;
	
	/**
	 * GraphSearch.as
	 * 
	 * @author Cristobal Dabed
	 * @references
	 * 
	 *  - Alogrithms Sequential, Parallel and Distirbuted Kenneth A. Berman and Jerome L. Paul 
	 *    "Part Three – Graph and Network Algorithms"
	 *  
	 *  - http://en.wikipedia.org/wiki/Breadth-first_search
	 *  - http://en.wikipedia.org/wiki/Dijkstra's_algorithm
	 * 
	 *  - http://www.informit.com/articles/article.aspx?p=169575&seqNum=3
	 * 	- http://eoinbailey.com/blog/dijkstras-algorithm-illustrated-explanation
	 * 	- http://cs.fit.edu/~ryan/java/programs/graph/Dijkstra-java.html
	 */ 
	public class GraphSearch
	{
		
		//--------------------------------------------------------------------------
		//
		// Dijkstra Implementation
		//
		//-------------------------------------------------------------------------
		
		/**
		 * Find shortest path Dijkstra
		 * 
		 * @param graph
		 * @param from
		 * @param to
		 */
		public static function findShortestPathDijkstra(graph:Graph, from:int, to:int):Vector.<Edge>
		{
			var adjacencyMatrix:AdjacencyMatrix = graph.getAdjacencyMatrix();
			// there is no adjacencyMatrix
			if (!adjacencyMatrix) {
				return null; // 
			}	
				// the vertices from to are not preset
			else if (!adjacencyMatrix.vertexExists(from) || !adjacencyMatrix.vertexExists(to)) {
				return null; //
			}
			
			var vertices:Vector.<int> = adjacencyMatrix.vertices;
			var keys:Dictionary		  = adjacencyMatrix.keys;
			var n:int			      = adjacencyMatrix.size;
			var r:int 				  = keys[from];
			
			var Parent:Vector.<int> = new Vector.<int>(n, true);
			var Dist:Vector.<int>   = new Vector.<int>(n, true);
			var InTheTree:Vector.<Boolean>   = new Vector.<Boolean>(n, true);					
			
			for (var v:int = 0; v < n; v++) {
				Dist[v]   = int.MAX_VALUE;
				InTheTree[v] = false;
			}
			Dist[r]   = 0;
			Parent[r] = -1;
			
			var Tree:Vector.<TreeNode> = new Vector.<TreeNode>(n, true);
			var node:TreeNode 		   = new TreeNode(from, null, 0);
			Tree[r] = node;
			
			var edges:Vector.<Edge>;
			var edge:Edge;
			
			var u:int, w:Number;
			for (var Stage:int = 0; Stage < n; Stage++) {
				u = findMinCostVertex(Dist, InTheTree);
				if (u == int.MIN_VALUE) {
					break; // early break
				}
				
				InTheTree[u] = true;
				r			 = vertices[u];
				
				edges = graph.findEdges(r);
				
				for (var i:int = 0, l:int = edges.length; i < l; i++) {
					edge = edges[i];
					v    = keys[edge.to]; // the vertex index key
					w    = edge.weight;
					if (!InTheTree[v]) {
						if (Dist[u] + w < Dist[v]) {
							Dist[v] = Dist[u] + w;
							
							Parent[v] = u;
							Tree[v]   = new TreeNode(vertices[v], Tree[u], w);
						}
					}
				}	
			}
			
			var path:Vector.<Edge>;
			v = keys[to];
			if (Tree[v]) {
				path = rebuildPathFromTreeNode(Tree[v]);
			}
			
			return path;
		}
		
		/**
		 * Find min cost edge
		 * 
		 * @param graph
		 * @param vertex
		 */ 
		private static function findMinCostVertex(Dist:Vector.<int>, InTheTree:Vector.<Boolean>):int
		{
			var d:int = int.MAX_VALUE;
			var u:int = int.MIN_VALUE; // graph not connected, or no unvisited vertices
			for (var i:int  = 0, l:int = Dist.length; i < l; i++) {
				if (!InTheTree[i] && Dist[i] < d) {
					u = i; 
					d = Dist[i];
				}
			}
			
			return u;
		}
		
		
		//--------------------------------------------------------------------------
		//
		// Breadth First Search - Implementation
		//
		//-------------------------------------------------------------------------
		
		/**
		 * Find shortest path bfs
		 * 
		 * @param graph
		 * @param from
		 * @param to
		 */ 
		public static function findShortestPathBFS(graph:Graph, from:int, to:int):Vector.<Edge>
		{	
			var adjacencyMatrix:AdjacencyMatrix = graph.getAdjacencyMatrix();
			// there is no adjacencyMatrix
			if (!adjacencyMatrix) {
				return null; // 
			}
				
				// the vertices from to are not preset
			else if (!adjacencyMatrix.vertexExists(from) || !adjacencyMatrix.vertexExists(to)) {
				return null; //
			}
			
			var Q:Vector.<TreeNode> = new Vector.<TreeNode>();
			var Mark:Dictionary = new Dictionary();
			
			var v:TreeNode      = new TreeNode(from);
			var u:TreeNode;
			var w:TreeNode;
			
			
			var vertices:Vector.<int>;
			var vertex:int;
			var found:Boolean = false;
			
			Q.push(v);
			Mark[v.vertex] = true;
			while (Q.length) {
				u = Q.shift();
				vertices = adjacencyMatrix.getAdjacentVertices(u.vertex);
				for (var i:int = 0, l:int = vertices.length; i < l; i++) {
					vertex = vertices[i];
					w      = new TreeNode(vertex, u);
					if (w.vertex == to) {
						found = true;
						break;
					}
					
					
					if (!(w.vertex in Mark)) {
						Q.push(w);
						Mark[w.vertex] = true;
					}
				}
				
				if (found) {
					break;
				}
			}
			
			var path:Vector.<Edge>;
			var edge:Edge;
			if (found) {
				path = rebuildPathFromTreeNode(w);
			}
			
			return path;
		}
		
		
		//--------------------------------------------------------------------------
		//
		// Common methods
		//
		//-------------------------------------------------------------------------
		
		/**
		 * Rebuild path
		 * 
		 * @param v
		 */ 
		private static function rebuildPathFromTreeNode(v:TreeNode):Vector.<Edge>
		{
			var path:Vector.<Edge> = new Vector.<Edge>();
			var edge:Edge;
			var u:TreeNode;
			
			while(v.parent) {
				u    = v.parent;
				edge = new Edge(u.vertex, v.vertex, v.weight);
				path.push(edge);
				v = u; // swap
			} 
			path.reverse();
			
			return path;
		}
		
	}
}