package ;
import flash.display.Bitmap;
import flash.display.BitmapData;

/**
 * ...
 * @author Alisa Zharkova
 */

 @:bitmap("assets/images/Akvelon_logo_3.jpg")
private class AkvelonLogoClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}

 @:bitmap("assets/images/spriteObjectTreeFur1_50_66.png")
private class TreeImageClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}

 @:bitmap("assets/images/tilesetSummer1.png")
private class GrassImageClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}

@:bitmap("assets/images/spriteObjectTreeFur1_50_66_small.png")
private class TreeSmallImageClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}

@:bitmap("assets/images/spriteObjectTreeFur1_50_66_middle.png")
private class TreeMiddleImageClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}

@:bitmap("assets/images/point.png")
private class PointImageClass extends BitmapData
{
	public function new() 
	{
		super(10,10);
	}
}
 
class Images 
{
    public static var akvelonLogo:Bitmap = new Bitmap(new AkvelonLogoClass());
	public static var treeImage:Bitmap = new Bitmap(new TreeImageClass());
	public static var grassImage:Bitmap = new Bitmap(new GrassImageClass());
	public static var treeSmallImage:Bitmap = new Bitmap(new TreeSmallImageClass());
	public static var treeMiddleImage:Bitmap = new Bitmap(new TreeMiddleImageClass());
    public static var pointImage:Bitmap = new Bitmap(new PointImageClass());	
}