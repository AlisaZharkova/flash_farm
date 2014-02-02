package ;

import flash.display.BitmapData;

/**
 * ...
 * @author Alisa Zharkova
 */

class GameCell 
{

	private var _gameObject:GameObject;
    private var _graphicsData:BitmapData;
    private var _width:Int;
    private var _height:Int;
    private var _x:Int;
    private var _y:Int;
	
	public function new(tx:Int, ty:Int) 
	{
		_graphicsData = Images.grassImage.bitmapData;
        _width=48;
        _height=24;
        _x = tx;
        _y = ty;
	}

	public var graphicsData(get,never):BitmapData;
	
    function get_graphicsData() {
        return _graphicsData;
    }

	public var width(get,never):Int;
	
    function get_width() {
        return _width;
    }
	
	public var height(get,never):Int;

    function get_height() {
        return _height;
    }
	
	public var gameObject(get, set): GameObject;

    function get_gameObject() {
        return _gameObject;
    }

    function set_gameObject(value:GameObject) {
        _gameObject = value;
		return _gameObject;
    }
	
	public var x(get, never) : Int;

    function get_x(){
        return _x;
    }
	
	public var y(get,never) : Int;

    function get_y() {
        return _y;
    }
	
}