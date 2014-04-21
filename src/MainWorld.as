package
{
import net.flashpunk.World;
import net.flashpunk.graphics.Text;
import net.flashpunk.utils.Input;

public class MainWorld extends World
{
	protected var _infoText:Text;

	/** The inventory entity. */
	protected var _inventory:Inventory;

	public function MainWorld()
	{
		super();
	}

	override public function begin():void {
		_infoText = new Text("Select a badge.", 10, 95, {width:409});
		_infoText.color = 0x000000;
		addGraphic(_infoText);

		_inventory = new Inventory(10, 10);
		add(_inventory);
	}

	override public function update():void {
		var mx:int = Input.mouseX, my:int = Input.mouseY;
		if (Input.mouseDown && _inventory.collidePoint(_inventory.x, _inventory.y, mx, my))
		{
			// Collided with inventory. Get the selected inventory item.
			var selectedItem:Object = _inventory.selectItemAtCursor(mx, my);

			// Update the information text.
			_infoText.text = selectedItem.name + " (" + selectedItem.value + " pts.)";
		}

		super.update();
	}
}
}
