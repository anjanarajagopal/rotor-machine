class PolyPrism {

	protected float height, faces, radius;
	protected PVector pos;
	protected PShape prism;
	protected int stroke;
	protected int fill;

	PolyPrism(float faces, float radius, float height) {
		this.height = height;
		this.faces = faces;
		this.radius = radius;
		this.pos = new PVector(0,0,0);
		this.stroke = color(0);
		this.fill = color(255);

		_init();
	}

	PolyPrism(float faces, float radius) {
		this.faces = faces;
		this.radius = radius;
		this.height = 50;
		this.pos = new PVector(0,0,0);

		_init();
	}

	protected void _init() {
		prism = createShape(GROUP);
		//shape.noFill();

		//top	face
		PShape top = createShape();
		top.beginShape();
		for( int i = 0; i < faces + 1; i++ ) {
			top.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, height/2);
		}
		top.endShape();
		top.setFill(fill);
		top.setStroke(stroke);
		prism.addChild(top);

		//bottom face
		PShape bot = createShape();
		bot.beginShape();
		for( int i = 0; i < faces + 1; i++ ) {
			bot.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, -height/2);
		}
		bot.endShape();
		bot.setFill(fill);
		bot.setStroke(stroke);
		prism.addChild(bot);

		//lateral faces
	PShape face;
	for(int i = 0; i < faces; i++) {

			face = createShape();

			face.beginShape();
			

			face.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, height/2, 1,1);
			face.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, -height/2, 0,1);
			face.vertex(cos(radians(360f/faces * (i + 1))) * radius, sin(radians(360f/faces * (i + 1))) * radius, -height/2,0,0);
			face.vertex(cos(radians(360f/faces * (i + 1))) * radius, sin(radians(360f/faces * (i + 1))) * radius, height/2, 1,0);

			face.endShape();
			
			face.setFill(fill);
			//shape.noFill();
			face.setStroke(stroke);
			prism.addChild(face);
		}
		
	}

	public void scale(float s) {
		prism.scale(s);
	}
	public void translate(float x, float y) {
		pos.add(x, y, pos.z);
		prism.translate(x, y);
	}

	public void translate(float x, float y, float z) {
		pos.add(x,y,z);
		prism.translate(x, y, z);
	}

	public void setPos(float x, float y) {
		PVector delta = new PVector(x, y);
		delta = delta.sub(pos);

		pos.set(x, y, pos.z);
		prism.translate(delta.x, delta.y);
	}

	public void setPos(float x, float y, float z) {
		PVector delta = new PVector(x, y, z);
		delta = delta.sub(pos);

		pos.set(x, y, z);
		prism.translate(delta.x, delta.y, delta.z);
	}

	public void rotateX(float ang) {
		prism.translate(-pos.x,-pos.y,-pos.z);
		prism.rotateX(ang);
		prism.translate(pos.x,pos.y,pos.z);
	}

	public void rotateY(float ang) { 

		prism.translate(-pos.x,-pos.y,-pos.z);
		prism.rotateY(ang);
		prism.translate(pos.x,pos.y,pos.z);
	}

	public void rotateZ(float ang) {
		prism.translate(-pos.x,-pos.y,-pos.z);
		prism.rotateZ(ang);
		prism.translate(pos.x,pos.y,pos.z);
	}

	public void addChild(PShape s, int idx) {
		prism.addChild( s, idx);
	}
	
	public void addChild(PShape s) {
		prism.addChild( s );
	}

	PShape getChild(int idx) {
		return prism.getChild(idx);
	}

	public void setStroke(int c) {
		stroke = c;
		PShape face;
		for( int i = 0; i < faces + 2; i++) {
			face = prism.getChild(i);
			face.setStroke(c);
		}
	}

	public int getStroke(){
		return stroke;
	}

	public void setFill(int c) {
		PShape face;
		fill = c;
		for( int i = 0; i < faces + 2; i++) {
			face = prism.getChild(i);
			face.setFill(c);
		}
	}

	public int getFill() {
		return fill;
	}	

	public void resetMatrix() {
		prism.resetMatrix();
	}

	public void draw() {
		shape(prism);
	}

}
