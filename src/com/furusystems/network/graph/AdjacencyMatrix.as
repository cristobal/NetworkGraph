package com.furusystems.network.graph
{
	import flash.utils.Dictionary;
	
	/**
	 * AdjacencyMatrix.as
	 * 
	 * @author Cristobal Dabed
	 */ 
	public class AdjacencyMatrix
	{
		public function AdjacencyMatrix(vertices:Vector.<int>, keys:Dictionary, matrix:Vector.<int>)
		{
			_vertices = vertices;
			_keys     = keys;
			_matrix   = matrix;
		}
		
		/**
		 * @private
		 */ 
		private var lines:Vector.<String>;
		
		/**
		 * @private
		 */  
		private var _vertices:Vector.<int>;
		
		/**
		 * @readonly vertices
		 */ 
		public function get vertices():Vector.<int>
		{
			return _vertices;
		}
		
		/**
		 * @private
		 */  
		private var _keys:Dictionary;
		
		/**
		 * @readonly keys
		 */ 
		public function get keys():Dictionary
		{
			return _keys;
		}
		
		/**
		 * @private
		 */ 
		private var _matrix:Vector.<int>;
		
		/**
		 * @readonly matrix
		 */ 
		public function get matrix():Vector.<int>
		{
			return _matrix;
		}
		
		/**
		 * @readonly size
		 */ 
		public function get size():int 
		{
			return _vertices.length;
		}
		
		/**
		 * Get adjacent vertices
		 * 
		 * @param from
		 */ 
		public function getAdjacentVertices(from:int):Vector.<int>
		{
			var adjacentVertices:Vector.<int> = vertices.concat(); // create shallow copy
			var to:int;
			for (var i:int = adjacentVertices.length; i--;) {
				to = adjacentVertices[i];
				if (!edgeExists(from, to) /* || (from == to) */ ) {
					adjacentVertices.splice(i, 1);	
				}
			}
			
			return adjacentVertices;
		}
		
		/**
		 * Vertex exists
		 * 
		 * @param key
		 */ 
		public function vertexExists(vertex:int):Boolean
		{
			return vertex in keys;
		}
		
		/**
		 * Edge exists
		 * 
		 * @param from
		 * @param to
		 */ 
		public function edgeExists(from:int, to:int):Boolean
		{
			var value:Boolean = false;
			
			if ((from in keys) && (to in keys)) {
				var x:int = keys[to];
				var y:int = keys[from];
				
				value = edgeExistsXY(x, y);
			}
			
			return value;
		}
		
		/**
		 * Edge exists
		 * 
		 * @param from
		 * @param to
		 */ 
		public function edgeExistsXY(x:int, y:int):Boolean
		{
			return matrix[x + (y * size)];
		}
		
		/**
		 * To string
		 */ 
		public function toString():String
		{
			if (!lines) {
				lines = new Vector.<String>();
				
				
				var args:Array = ["\\"];
				
				var V:Vector.<int> = this.vertices;
				var vertex:int;
				
				for (var i:int = 0, l:int = size; i < l; i++) {
					vertex = V[i];
					args.push(vertex);
				}
				
				var line:String = args.join(", ");
				lines.push(line);
				
				for (var y:int = 0, h:int = size; y < h; y++) {
					vertex = V[y];
					args   = [vertex];
					for (var x:int = 0, w:int = size; x < w; x++) {
						if (edgeExistsXY(x, y)) {
							args.push("1");
						}
						else {
							args.push("0");
						}
					}
					
					line = args.join(", ");
					lines.push(line);
				}
			}
			
			return lines.join("\n");		
		}
		
	}
}