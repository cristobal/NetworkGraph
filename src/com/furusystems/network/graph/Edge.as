package com.furusystems.network.graph
{
	/**
	 * Edge.as
	 * 
	 * @author Cristobal Dabed 
	 */ 
	public class Edge
	{
		
		public function Edge(from:int, to:int, weight:Number = -1)
		{
			_from = from;
			_to   = to;
			_weight = weight;
		}
		
		/**
		 * @private
		 */ 
		private var _from:int;
		
		/**
		 * @readonly from
		 */ 
		public function get from():int
		{
			return _from;
		}
		
		/**
		 * @private
		 */ 
		private var _to:int;
		
		/**
		 * @readonly to
		 */ 
		public function get to():int
		{
			return _to;
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
			return [from, to, weight].join(",");
		}
	}
	
}