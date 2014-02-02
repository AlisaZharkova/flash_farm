package ;

/**
 * ...
 * @author Alisa Zharkova
 */

class Tree extends GameObject
{

	public function new() 
	{
		super();
		_graphicData = Images.treeSmallImage.bitmapData;
        _height = Images.treeSmallImage.bitmapData.height;
        _width = Images.treeSmallImage.bitmapData.width;
        _yOffset = 10;
	}

    override public function grow():Void {
        if (_graphicData == Images.treeSmallImage.bitmapData) {
            _graphicData = Images.treeMiddleImage.bitmapData;
        } else if (_graphicData == Images.treeMiddleImage.bitmapData) {
            _graphicData = Images.treeImage.bitmapData;
        }
    }

    public function setAge(age:Int): Void{
        switch (age) {
            case 1:
                _graphicData == Images.treeSmallImage.bitmapData;
            case 2:
                _graphicData = Images.treeMiddleImage.bitmapData;
            case 3:
                _graphicData = Images.treeImage.bitmapData;
        }
    }

    public function getAge(): Int {
        if (_graphicData == Images.treeSmallImage.bitmapData) {
            return 1;
        } else if (_graphicData == Images.treeMiddleImage.bitmapData) {
            return 2;
        } else {
            return 3;
        }
    }
	
}