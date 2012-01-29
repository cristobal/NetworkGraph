package com.furusystems.network.graph
{
	/**
	 * TreeNode.as
	 * 
	 * @author Cristobal Dabed
	 */ 
	public class TreeNode
	{
		public function TreeNode(vertex:int, parent:TreeNode = null, weight:int = -1)
		{
			_vertex = vertex;
			_parent = parent;
			_weight = weight;
		}
		
		/**
		 * @private
		 */ 
		private var _vertex:int;
		
		/**
		 * @readonly vertex
		 */ 
		public function get vertex():int
		{
			return _vertex;
		}
		
		/**
		 * @private
		 */ 
		private var _parent:TreeNode;
		
		/**
		 * @readonly parent
		 */ 
		public function get parent():TreeNode
		{
			return _parent;
		}
		
		/**
		 * @private
		 */ 
		private var _weight:Number;
		
		/**
		 * @readonly weight
		 */ 
		public function get weight():Number
		{
			return _weight;
		}
		
		
		public function toString():String
		{
			return ["vertex:", vertex, "parent:", parent ? parent.vertex : "-1", "weight:", weight].join(" ");
		}
	}
	
}