/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/5/13
 * Time: 9:19 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.BitmapData;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.net.URLLoader;

import spark.components.BorderContainer;

public class GameCanvas extends BorderContainer {
     private var _game:Game;
     private static const _step:int = 24; //hardcore is here :)
     private var _bufferBitmap: BitmapData;

    public static var loader:URLLoader;

    public function GameCanvas() {
        addEventListener(Event.ADDED_TO_STAGE, function(e:Event):void {
            stage.addEventListener(Event.ENTER_FRAME, renderScene);
        });

        addEventListener(MouseEvent.CLICK, clickHandler);

        _game = new Game();
        _bufferBitmap = new BitmapData(600, 600, true);
    }

    public function onDataLoaded (e:Event):void {
        if (loader.data == "") {
            return;
        }

        var strings:Vector.<Array> = new Vector.<Array>(10);
        var first_array:Array = new Array(10);
        first_array = loader.data.split("-");
        for (var i:int; i<10; i++) {
            strings[i] = first_array[i].split("+");
        }

        _game.setCells(strings);
    }

    public function getGameDataSerialized(username:String): String {
        var cells:Vector.<Vector.<GameCell>>;
        cells = _game.cells;
        var result:String = "savegame";

        for (var i:int = 0; i<10; i++) {
            for (var j:int = 0; j<10; j++) {
                if (cells[i][j].gameObject) {
                    result += (cells[i][j].gameObject as Tree).getAge();
                } else {
                    result += 0;
                }
                if (j<9) {
                    result += "+";
                }
            }
            if (i<9) {
                result += "-";
            }
        }

         return result + username;
    }

    private function clickHandler(event:MouseEvent):void {
        var cells:Array = _game.getCellsWithObjects();
        var xy:Vector.<int> = new Vector.<int>(2);
        var go:GameObject;
        var clickedCellIndex:int = null;

        for (var i:int=0; i<cells.length; i++) {
            xy =  convertXY(cells[i].x,  cells[i].y);
            go =  cells[i].gameObject;
            xy[0] -= go.width/2;
            xy[1] += go.yOffset - go.height;
            if (event.stageX > xy[0] && event.stageX < xy[0] + go.width && event.stageY > xy[1] && event.stageY < xy[1] + go.height) {
                if (clickedCellIndex) {
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

    private var _showAkvelon:Boolean;

    public function set showAkvelon(value:Boolean):void {
        _showAkvelon = value;
    }

    public function get showAkvelon():Boolean{
        return _showAkvelon;
    }

    protected override function updateDisplayList(width:Number, height:Number):void
    {
        // prevent default behaviour
    }

    public function renderScene(e:Event):void
    {
        _game.update();

        graphics.clear();
        _bufferBitmap.fillRect(new Rectangle(0,0,600,600),0);

        var n:int = _game.fieldSize;
        var cells:Vector.<Vector.<GameCell>> = _game.cells;
        var startValue:int = 0;
        var endValue:int = 0;
        var newXY:Vector.<int>;
        var currentCell:GameCell;

        for (var i:int=0; i<n*2-1; i++) {
            //for every line

            for (var j:int = startValue; j<=endValue; j++) {
                // for every cell in line

                if (i < n) {
                    newXY = convertXY(j, endValue-j);
                    currentCell = cells[j][endValue-j];
                } else {
                    newXY = convertXY(j, endValue-j + i - n + 1);
                    currentCell = cells[j][endValue-j + i - n + 1];
                }

                _bufferBitmap.copyPixels(currentCell.graphicsData, new Rectangle(0,0,48,24),new Point(newXY[0] - 24, newXY[1] - 12), null, null, true);
                if (currentCell.gameObject) {
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

        graphics.beginBitmapFill(_bufferBitmap);
        graphics.drawRect(0, 0, 600, 600);
        graphics.endFill();
        invalidateDisplayList();
    }

    private function convertXY(tx:int, ty:int): Vector.<int> {
        var newX:int = 0;
        var newY:int = 0;

        newX = 200 + tx*_step - ty*_step;
        newY = 50 + ty*_step/2 + tx*_step/2;
        return new <int>[newX, newY];
    }
}
}
