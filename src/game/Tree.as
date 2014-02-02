/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/6/13
 * Time: 9:03 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.BitmapData;

public class Tree extends GameObject{

    public function Tree() {
        _graphicData = Images.treeSmallImage.bitmapData;
        _height = Images.treeSmallImage.bitmapData.height;
        _width = Images.treeSmallImage.bitmapData.width;
        _yOffset = 10;
    }

    override public function grow():void {
        if (_graphicData == Images.treeSmallImage.bitmapData) {
            _graphicData = Images.treeMiddleImage.bitmapData;
        } else if (_graphicData = Images.treeMiddleImage.bitmapData) {
            _graphicData = Images.treeImage.bitmapData;
        }
    }

    public function setAge(age:int): void{
        switch (age) {
            case 1:
                _graphicData == Images.treeSmallImage.bitmapData;
                break;
            case 2:
                _graphicData = Images.treeMiddleImage.bitmapData;
                break;
            case 3:
                _graphicData = Images.treeImage.bitmapData;
                break;
        }
    }

    public function getAge(): int {
        if (_graphicData == Images.treeSmallImage.bitmapData) {
            return 1;
        } else if (_graphicData == Images.treeMiddleImage.bitmapData) {
            return 2;
        } else {
            return 3;
        }
    }
}
}
