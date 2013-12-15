/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/6/13
 * Time: 9:12 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.BitmapData;

public class GameObject {
    private var _x:int;
    private var _y:int;
    protected var _width:int;
    protected var _yOffset:int;
    protected var _height:int;
    protected var _graphicData:BitmapData;

    public function GameObject() {
    }

    public function get y():int {
        return _y;
    }

    public function set y(value:int):void {
        _y = value;
    }

    public function get x():int {
        return _x;
    }

    public function set x(value:int):void {
        _x = value;
    }

    public function get graphicData(): BitmapData {
        return _graphicData;
    }

    public function get height():int {
        return _height;
    }

    public function set height(value:int):void {
        _height = value;
    }

    public function get width():int {
        return _width;
    }

    public function set width(value:int):void {
        _width = value;
    }

    public function get yOffset():int {
        return _yOffset;
    }

    public function grow():void {
        // override
    }
}
}
