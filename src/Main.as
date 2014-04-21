package {
import net.flashpunk.Engine;
import net.flashpunk.FP;

[SWF(width=429,height=120)]
public class Main extends Engine {
    public function Main() {
	    super(429, 120);
    }

	override public function init():void {
		super.init();
		FP.screen.color = 0xffffff;
		FP.world = new MainWorld();
	}
}
}
