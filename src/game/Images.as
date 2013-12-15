/**
 * Created with IntelliJ IDEA.
 * User: v-ignovi
 * Date: 10/5/13
 * Time: 9:47 PM
 * To change this template use File | Settings | File Templates.
 */
package game {
import flash.display.Bitmap;

import mx.core.BitmapAsset;

public class Images {

    [Embed("../../assets/images/Akvelon_logo_3.jpg")]
    private static const _akvelonLogoClass:Class;
    public static const akvelonLogo:BitmapAsset = new _akvelonLogoClass();

    [Embed("../../assets/images/tilesetSummer1.png")]
    private static const _grassImageClass:Class;
    public static const grassImage:Bitmap = new _grassImageClass();

    [Embed("../../assets/images/spriteObjectTreeFur1_50_66.png")]
    private static const _treeImageClass:Class;
    public static const treeImage:Bitmap = new _treeImageClass();

    [Embed("../../assets/images/spriteObjectTreeFur1_50_66_small.png")]
    private static const _treeSmallImageClass:Class;
    public static const treeSmallImage:Bitmap = new _treeSmallImageClass();

    [Embed("../../assets/images/spriteObjectTreeFur1_50_66_middle.png")]
    private static const _treeMiddleImageClass:Class;
    public static const treeMiddleImage:Bitmap = new _treeMiddleImageClass();

    [Embed("../../assets/images/point.png")]
    private static const _pointImageClass:Class;
    public static const pointImage:Bitmap = new _pointImageClass();
}
}
