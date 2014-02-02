package ;
import flash.display.BitmapData;

/**
 * ...
 * @author Alisa Zharkova
 */

class GameObject 
{
	private var _x:Int;
    private var _y:Int;
    private var _width:Int;
    private var _yOffset:Int;
    private var _height:Int;
    private var _graphicData:BitmapData;

	public function new() 
	{
		
	}

	public var y(get, set):Int;
	
    function get_y() {
        return _y;
    }

    function set_y(value) {
        _y = value;
		return _y;
    }
	
	public var x(get, set):Int;

    function get_x() {
        return _x;
    }

    function set_x(value) {
        _x = value;
		return _x;
    }

	public var graphicData(get, never):BitmapData;
	
    function get_graphicData() {
        return _graphicData;
    }
	
	public var height(get, set):Int;

    function get_height() {
        return _height;
    }

    function set_height(value) {
        _height = value;
		return _height;
    }

	public var width(get, set):Int;
	
    function get_width() {
        return _width;
    }

    function set_width(value) {
        _width = value;
		return _width;
    }

	public var yOffset(get, never):Int;
	
    function get_yOffset() {
        return _yOffset;
    }

    public function grow():Void {
        // override
    }
}