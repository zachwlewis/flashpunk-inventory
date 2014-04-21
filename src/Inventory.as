package
{
import net.flashpunk.Entity;
import net.flashpunk.Graphic;
import net.flashpunk.Mask;
import net.flashpunk.graphics.Graphiclist;
import net.flashpunk.graphics.Image;
import net.flashpunk.masks.Hitbox;
import net.flashpunk.masks.Masklist;
import net.flashpunk.utils.Input;

public class Inventory extends Entity
{
	protected var _images:Vector.<Image>;
	protected var _hitboxes:Vector.<Hitbox>;

	/** List of objects the inventory contains. */
	protected var _items:Vector.<Object>;

	/** The selected index. */
	protected var _selectedIndex:int = -1;

	[Embed(source="../assets/flatshadow_medal1.png")] protected const MEDAL1:Class;
	[Embed(source="../assets/flatshadow_medal2.png")] protected const MEDAL2:Class;
	[Embed(source="../assets/flatshadow_medal3.png")] protected const MEDAL3:Class;
	[Embed(source="../assets/flatshadow_medal4.png")] protected const MEDAL4:Class;
	[Embed(source="../assets/flatshadow_medal5.png")] protected const MEDAL5:Class;
	[Embed(source="../assets/flatshadow_medal6.png")] protected const MEDAL6:Class;
	[Embed(source="../assets/flatshadow_medal7.png")] protected const MEDAL7:Class;
	[Embed(source="../assets/flatshadow_medal8.png")] protected const MEDAL8:Class;
	[Embed(source="../assets/flatshadow_medal9.png")] protected const MEDAL9:Class;

	public function Inventory(x:Number = 0, y:Number = 0)
	{
		_images = new Vector.<Image>();
		_hitboxes = new Vector.<Hitbox>();

		var graphics:Graphiclist = new Graphiclist();
		var masks:Masklist = new Masklist();

		for (var i:uint = 0; i < 9; i++)
		{
			_images.push(new Image(this["MEDAL"+(i+1)]));
			_images[i].x = 46 * i;
			_images[i].alpha = 0.25;
			graphics.add(_images[i]);

			_hitboxes.push(new Hitbox(41, 75, 46 * i, 0));
			masks.add(_hitboxes[i]);
		}

		// Create the object information.
		_items = new <Object>[
			{name:"Master Coolguy Badge", value:100},
			{name:"Expert Dancer Badge", value:150},
			{name:"Badger Badge", value:100},
			{name:"Rainbow Charge Badge", value:500},
			{name:"Spacefleet Badge", value:300},
			{name:"Overgrown Garden Badge", value:50},
			{name:"Mutual Fund Badge", value:200},
			{name:"Badge Badge", value:350},
			{name:"Cool Story Brodge", value:200}];


		super(x, y, graphics, masks);
	}

	override public function update():void {
		var mx:int = Input.mouseX, my:int = Input.mouseY, index:uint;

		// Reset hover states.
		for (var i:uint = 0; i < 9; i++)
		{
			if (i != _selectedIndex)
			{
				_images[i].alpha = 0.25;
			}
			else
			{
				_images[i].alpha = 1.0;
			}
		}

		// Determine if the mouse is over any items.
		if (collidePoint(x, y, mx, my))
		{
			// The mouse is touching an object.
			// Each object is a fixed width, so determining the hit index
			// can be done in a single step.

			index = (mx - x) / 46;

			// Highlight the hovered item if it isn't selected.
			if (_selectedIndex != index)
			{
				_images[index].alpha = 0.75;
			}
		}
	}

	public function selectItemAtCursor(mouseX:int, mouseY:int):Object {
		// It would be a good idea to do some error checking here.
		_selectedIndex = (mouseX - x) / 46;
		return _items[_selectedIndex];
	}
}
}
