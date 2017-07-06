import java.util.*;
import java.lang.Character;

class Rotor extends PolyPrism {

	//thing that stores letters		
	int l;
	float theta;
	char route[];

	Rotor(boolean random) {

		super(26f, 100f, 50f); 

		theta = 0;
		l = 0;
		route = new char[(int)faces];
		for( int i = 0; i < (int)faces; i++ ) {
			route[i] = _itoalpha(i);
		}

		if( random ) {
			_shuffle(route);
			_shuffle(route);
		}

		this._wheel_init();
		this.rotateY(PI/2);

	}

	private void _wheel_init() {

		for( int i = 0; i < faces; i++ ) {
			_redraw(i);
		}

	}

	private void _redraw(int face_index) {
	
		float w = 2*radius*cos(radians(90f - (360f/(faces*2))));
		float h = this.height;
		PFont f	= createFont("SansSerif", 10);
		PGraphics pg;

		char letter = route[face_index];
		pg = createGraphics((int)h, (int)w, P2D);
		pg.beginDraw();
			pg.background(fill);
			pg.fill(stroke);
			pg.textFont(f);
			pg.textAlign(CENTER, CENTER);
			pg.text(letter, h/2, w/2 - 2);
		pg.endDraw();


		PShape face = prism.getChild(face_index+2);
		face.setTextureMode(NORMAL);
		face.setTexture(pg);

	}

	private char _itoalpha(int n) {
		return (char)(65 + (n + l)%(int)faces);
	}

	private int _alnumtoi(char a) {
		int i = (int)a;
		return (a - 65 + l) % (int)faces;
	}

	private void _shuffle(char[] array) {
		int index;
		char temp;
		Random random = new Random();
		for (int i = array.length - 1; i > 0; i--) {
				index = random.nextInt(i + 1);
				temp = array[index];
				array[index] = array[i];
				array[i] = temp;
		}
	}

	private int _index_of(char[] array, char c) {
		for(int i = 0; i < faces; i++) {
			if( array[i] == c ) {
				return i;
			}
		}
		return -1;
	}

	private float _posToAng(int n) {
		return (360/faces) * n;
	}

	public void swap(char a, char b) {
		int i_a = _alnumtoi(a);
		int i_b = _alnumtoi(a);
		char temp = route[i_a];

		route[i_a] = route[i_b];
		route[i_b] = temp;
	}

	public void fwd(int n) {
		l = (l + n) % (int)faces ;
	}

	public void rev(int n) {
		l = (l + (26 - n)) % (int)faces ;
	}

	public void reset() {
		l = 0;
	}

	public int encode( char c ) {
		return route[_alnumtoi(c)];
	}

	public void draw() {
		float d0 = (_posToAng(l) - theta + 360) % 360;
		theta += d0*0.05;
		theta %= 360;
		this.rotateX(radians(d0*0.05));

		shape(prism);
	}
}
