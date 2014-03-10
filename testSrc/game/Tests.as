/**
 * Created with IntelliJ IDEA.
 * User: v-alzhar
 * Date: 3/10/14
 * Time: 5:12 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flexunit.flexui.patterns.AssertEqualsPattern;
import flexunit.framework.Assert;

public class Tests {
    [Test(description="Test for Tree Object basic functionality")]
    public function testTree(): void {
        var tree:Tree = new Tree();
        Assert.assertEquals("Tree has invalid age after creating",
                tree.getAge(), 1);
        Assert.assertStrictlyEquals("Tree has invalid graphics after creating",
                tree.graphicData, Images.treeSmallImage.bitmapData);

        tree.grow();
        Assert.assertEquals("Tree has invalid age after first growing",
                tree.getAge(), 2);
        Assert.assertStrictlyEquals("Tree has invalid graphics after first growing",
                tree.graphicData, Images.treeMiddleImage.bitmapData);

        tree.grow();
        Assert.assertEquals("Tree has invalid age after second growing",
                tree.getAge(), 3);
        Assert.assertStrictlyEquals("Tree has invalid graphics after second growing",
                tree.graphicData, Images.treeImage.bitmapData);

        tree.setAge(2);
        Assert.assertEquals("Tree has invalid age after age setting",
            tree.getAge(), 2);
        Assert.assertStrictlyEquals("Tree has invalid graphics after setting age to 2",
            tree.graphicData, Images.treeMiddleImage.bitmapData);

        tree.setAge(3);
        Assert.assertEquals("Tree has invalid age after age setting",
                tree.getAge(), 3);
        Assert.assertStrictlyEquals("Tree has invalid graphics after setting age to 3",
                tree.graphicData, Images.treeImage.bitmapData);
    }

    [Test(description="Test for Game Cell Object basic functionality")]
    public function testGameCell(): void {
        var gameCell:GameCell = new GameCell(12, 34);

        Assert.assertEquals("Game Cell has invalid x after creating", gameCell.x, 12);
        Assert.assertEquals("Game Cell has invalid y after creating", gameCell.y, 34);
        Assert.assertStrictlyEquals("Game Cell has invalid graphics after creating",
            gameCell.graphicsData, Images.grassImage.bitmapData);

        var tree:Tree = new Tree();
        gameCell.gameObject = tree;

        Assert.assertStrictlyEquals("Game Cell has invalid game object after setting the game object",
            gameCell.gameObject, tree);
    }

    [Test(description="Test for Game Object basic functionality")]
    public function testGame(): void {
        var gameObject:Game = new Game();
        var cellsWithObjects:Array = gameObject.getCellsWithObjects();

        Assert.assertEquals("Game has invalid quantity of cells with objects after creating",
                cellsWithObjects.length, 8);
        Assert.assertEquals("Game has invalid field size after creating",
            gameObject.fieldSize, 10);

        for (var i:int = 0; i<cellsWithObjects.length; i++) {
            Assert.assertEquals("Tree in cell should have min age after creating",
                    (cellsWithObjects[i].gameObject as Tree).getAge(), 1);
        }

        var counter:int = 0;
        while(counter<1000){
            gameObject.update();
            counter++;
        }

        cellsWithObjects = gameObject.getCellsWithObjects();

        Assert.assertTrue("After 1000 updates game should have more then 8 trees",
            cellsWithObjects.length > 8);

        var qntMiddleTrees:int = 0;
        var qntYoungTrees:int = 0;

        for (var i:int = 0; i<cellsWithObjects.length; i++) {
            if ((cellsWithObjects[i].gameObject as Tree).getAge() == 1) {
                qntYoungTrees++;
            } else if ((cellsWithObjects[i].gameObject as Tree).getAge() == 2) {
                qntMiddleTrees++;
            } else {
                Assert("Tree doesn't have age 1 or 2, current age is "
                        + (cellsWithObjects[i].gameObject as Tree).getAge());
            }
        }

        Assert.assertEquals("There should be 8 middle trees", qntMiddleTrees, 8);
        Assert.assertTrue("There should be not more then 3 young trees", qntYoungTrees < 4);
        Assert.assertTrue("There should be at least 1 young tree", qntYoungTrees > 0);
    }
}
}
