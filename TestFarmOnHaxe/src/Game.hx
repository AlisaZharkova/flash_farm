package ;
import flash.Vector;

/**
 * ...
 * @author Alisa Zharkova
 */

class Game 
{
	private var _cells:Vector<Vector<GameCell>>;
    private var _fieldSize:Int;
    private var _updateTick:Int;
    private var _updateCounter:Int;
	
	public function new() 
	{
		_fieldSize = 10;
        _cells = new Vector<Vector<GameCell>>(_fieldSize);
        _updateTick = 1000;
        _updateCounter = 0;

        for (i in 0..._fieldSize) {
            _cells[i] = new Vector<GameCell>(_fieldSize);
            for (j in 0..._fieldSize) {
                _cells[i][j] = new GameCell(i, j);
            }
        }

        createRandomTrees(8);
	}

    public function setCells(cellsDefinitions:Vector<Array<String>>): Void {
        var tree:Tree;
        for (i in 0..._fieldSize) {
            _cells[i] = new Vector<GameCell>(_fieldSize);
            for (j in 0..._fieldSize) {
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

    private function createRandomTrees(treeQnt:Int):Void {
        var min:Int = 0;
        var max:Int = _fieldSize - 1;
        var x:Int;
        var y:Int;

        for (i in 0...treeQnt) {
            x = getRandom(min,  max);
            y = getRandom(min,  max);
            while(_cells[x][y].gameObject != null) {
                x = getRandom(min,  max);
                y = getRandom(min,  max);
            }

            _cells[x][y].gameObject = new Tree();
        }
    }

    private function getRandom(min:Int,  max:Int):Int{
        return Math.round(min + (max - min) * Math.random());
    }

	public var cells(get,never):Vector<Vector<GameCell>>;
	
    function get_cells() {
        return _cells;
    }
	
	public var fieldSize(get,never):Int;

    function get_fieldSize() {
        return _fieldSize;
    }

    public function getCellsWithObjects():Array<GameCell> {
        var cells:Array<GameCell>;
        cells = new Array();

        for (i in 0..._fieldSize) {
            for (j in 0..._fieldSize) {
                if (_cells[i][j].gameObject != null) {
                    cells.push(_cells[i][j]);
                }
            }
        }

        return cells;
    }

    public function update():Void {
        _updateCounter++;
        if (_updateCounter == _updateTick) {
            for (i in 0..._fieldSize) {
                for (j in 0..._fieldSize) {
                    if (_cells[i][j].gameObject != null) {
                        _cells[i][j].gameObject.grow();
                    }
                }
            }

            createRandomTrees(getRandom(1,3));

            _updateCounter = 0;
        }
    }
}