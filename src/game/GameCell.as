/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/6/13
 * Time: 9:23 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.BitmapData;

public class GameCell {
    private var _gameObject:GameObject;
    private var _graphicsData:BitmapData;
    private var _width:int;
    private var _height:int;
    private var _x:int;
    private var _y:int;

    public function GameCell(tx:int,  ty:int) {
        _graphicsData = Images.grassImage.bitmapData;
        _width=48;
        _height=24;
        _x = tx;
        _y = ty;
    }

    public function get graphicsData():BitmapData {
        return _graphicsData;
    }

    public function get width():int {
        return _width;
    }

    public function get height():int {
        return _height;
    }

    public function get gameObject():GameObject {
        return _gameObject;
    }

    public function set gameObject(value:GameObject):void {
        _gameObject = value;
    }

    public function get x():* {
        return _x;
    }

    public function get y():* {
        return _y;
    }
}
}
