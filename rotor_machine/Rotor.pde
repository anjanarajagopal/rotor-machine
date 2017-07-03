class Rotor extends PolyPrism {
	//thing that stores letters		
	int l;
	float theta = 0;
	Rotor() {

		super(26f, 100f, 100f); 

		//draw letters
		this.rotateY(PI/2);
	}

	float _posToAng(int n) {
		return (360/faces) * n;
	}

	void advance(int n) {
		l = (l + n) % (int)faces;
	}

	void reverse(int n) {
		l = (l + n) % (int)faces;
	}

	void reset(int n) {
		l = 0;
	}

	void draw() {
		this.rotateX(PI/2);
	}

}
