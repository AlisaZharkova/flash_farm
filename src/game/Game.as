/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/6/13
 * Time: 9:20 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import spark.skins.spark.windowChrome.MacMinimizeButtonSkin;

public class Game {
    private var _cells:Vector.<Vector.<GameCell>>;
    private var _fieldSize:int;
    private var _updateTick:int;
    private var _updateCounter:int;

    public function Game() {
        _fieldSize = 10;
        _cells = new Vector.<Vector.<GameCell>>(_fieldSize);
        _updateTick = 1000;
        _updateCounter = 0;

        for (var i:int=0; i<_fieldSize; i++) {
            _cells[i] = new Vector.<GameCell>(_fieldSize);
            for (var j:int=0; j<_fieldSize; j++) {
                _cells[i][j] = new GameCell(i, j);
            }
        }

        createRandomTrees(8);
    }

    public function setCells(cellsDefinitions:Vector.<Array>): void {
        var tree:Tree;
        for (var i:int=0; i<_fieldSize; i++) {
            _cells[i] = new Vector.<GameCell>(_fieldSize);
            for (var j:int=0; j<_fieldSize; j++) {
                _cells[i][j] = new GameCell(i, j);
                switch (cellsDefinitions[i][j]) {
                    case "1":
                        tree = new Tree();
                        tree.setAge(1);
                        _cells[i][j].gameObject = tree;
                        break;
                    case "2":
                        tree = new Tree();
                        tree.setAge(2);
                        _cells[i][j].gameObject = tree;
                        break;
                    case "3":
                        tree = new Tree();
                        tree.setAge(3);
                        _cells[i][j].gameObject = tree;
                        break;
                }
            }
        }
    }


    private function createRandomTrees(treeQnt:int):void {
        var min:int = 0;
        var max:int = _fieldSize - 1;
        var x:int;
        var y:int;

        for (var i:int = 0; i<treeQnt; i++) {
            x = getRandom(min,  max);
            y = getRandom(min,  max);
            while(_cells[x][y].gameObject != null) {
                x = getRandom(min,  max);
                y = getRandom(min,  max);
            }

            _cells[x][y].gameObject = new Tree();
        }
    }

    private function getRandom(min:int,  max:int):int{
        return Math.round(min + (max - min) * Math.random());
    }

    public function get cells():Vector.<Vector.<GameCell>> {
        return _cells;
    }

    public function get fieldSize():int {
        return _fieldSize;
    }

    public function getCellsWithObjects():Array {
        var cells:Array;
        cells = new Array();

        for (var i:int=0; i<_fieldSize; i++) {
            for (var j:int=0; j<_fieldSize; j++) {
                if (_cells[i][j].gameObject) {
                    cells.push(_cells[i][j]);
                }
            }
        }

        return cells;
    }

    public function update():void {
        _updateCounter++;
        if (_updateCounter == _updateTick) {
            for (var i:int=0; i<_fieldSize; i++) {
                for (var j:int=0; j<_fieldSize; j++) {
                    if (_cells[i][j].gameObject) {
                        _cells[i][j].gameObject.grow();
                    }
                }
            }

            createRandomTrees(getRandom(1,3));

            _updateCounter = 0;
        }
    }
}
}
