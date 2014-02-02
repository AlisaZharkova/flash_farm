package ;
import flash.Lib;
import flash.display.BitmapData;
import flash.events.MouseEvent;
import flash.events.Event;
import flash.Vector;
import flash.geom.Rectangle;
import flash.Vector;
import flash.geom.Point;

/**
 * ...
 * @author Alisa Zharkova
 */

class MainNotStatic 
{

	private static var _game:Game;
    private static var _step:Int = 24; //hardcore is here :)
    private static var _bufferBitmap: BitmapData;
	
	public function new() 
	{
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, renderScene);
		Lib.current.stage.addEventListener(MouseEvent.CLICK, clickHandler);
		
		_game = new Game();
        _bufferBitmap = new BitmapData(600, 600, true);
	}
	
	public function clickHandler(event:MouseEvent):Void {
        var cells:Array<GameCell> = _game.getCellsWithObjects();
        var xy:Vector<Int> = new Vector<Int>(2);
        var go:GameObject;
        var clickedCellIndex:Null<Int> = null;

        for (i in 0...cells.length) {
            xy =  convertXY(cells[i].x,  cells[i].y);
            go =  cells[i].gameObject;
            xy[0] -= Std.int(go.width/2);
            xy[1] += go.yOffset - go.height;
            if (event.stageX > xy[0] && event.stageX < xy[0] + go.width && event.stageY > xy[1] && event.stageY < xy[1] + go.height) {
                if (clickedCellIndex != null) {
                    if (cells[i].x > cells[clickedCellIndex].x || cells[i].y > cells[clickedCellIndex].y) {
                        clickedCellIndex = i;
                    }
                } else {
                    clickedCellIndex = i;
                }
            }
        }

        _game.cells[cells[clickedCellIndex].x][cells[clickedCellIndex].y].gameObject = null;
    }

    //private override function updateDisplayList(width:Number, height:Number):Void
    //{
        // prevent default behaviour
    //}

    public function renderScene(e:Event):Void
    {
        _game.update();

        Lib.current.graphics.clear();
        _bufferBitmap.fillRect(new Rectangle(0,0,600,600),0);

        var n:Int = _game.fieldSize;
        var cells:Vector<Vector<GameCell>> = _game.cells;
        var startValue:Int = 0;
        var endValue:Int = 0;
        var newXY:Vector<Int>;
        var currentCell:GameCell;

        for (i in 0...(n*2-1)) {
            //for every line

            for (j in startValue...endValue) {
                // for every cell in line

                if (i < n) {
                    newXY = convertXY(j, endValue-j);
                    currentCell = cells[j][endValue-j];
                } else {
                    newXY = convertXY(j, endValue-j + i - n + 1);
                    currentCell = cells[j][endValue-j + i - n + 1];
                }

                _bufferBitmap.copyPixels(currentCell.graphicsData, new Rectangle(0,0,48,24),new Point(newXY[0] - 24, newXY[1] - 12), null, null, true);
                if (currentCell.gameObject != null) {
                    // draw object in the cell

                    var go = currentCell.gameObject;
                    _bufferBitmap.copyPixels(go.graphicData, new Rectangle(0,0,go.width,go.height),new Point(newXY[0] - go.width/2, newXY[1] - go.height + go.yOffset), null, null, true);
                }
            }

            if (i >= n - 1) {
                startValue +=1;
            } else {
                endValue += 1;
            }
        }
		
        Lib.current.graphics.beginBitmapFill(_bufferBitmap);
        Lib.current.graphics.drawRect(0, 0, 600, 600);
        Lib.current.graphics.endFill();
		Lib.current.stage.invalidate();
    }

    private function convertXY(tx:Int, ty:Int): Vector<Int> {
        var newX:Int = 0;
        var newY:Int = 0;

        newX = 200 + tx*_step - ty*_step;
        newY = 50 + Std.int(ty * _step / 2) + Std.int(tx * _step / 2);
		
		var result:Vector<Int> = new Vector<Int>(2);
		result[0] = newX;
		result[1] = newY;
		
        return result;
    }
}