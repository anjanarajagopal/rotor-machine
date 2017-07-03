class PolyPrism {

	float height, faces, radius;
	PVector pos;
	PShape prism;

	PolyPrism(float faces, float radius, float height) {
		this.height = height;
		this.faces = faces;
		this.radius = radius;
		this.pos = new PVector(0,0,0);
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
		prism.setFill(color(255));
		//shape.noFill();
		prism.setStroke(color(255));
//
//		//top	face
//		PShape top = createShape();
//		top.beginShape();
//		for( int i = 0; i < faces; i++ ) {
//			top.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, height/2);
//		}
//		top.endShape();
//		prism.addChild(top, 1);
//
//		//bottom face
//		PShape bot = createShape();
//		bot.beginShape();
//		for( int i = 0; i < faces; i++ ) {
//			prism.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, height/2);
//		}
//		bot.endShape();
//		prism.addChild(bot, 2);
//
		//lateral faces
		for(int i = 0; i < faces; i++) {

			PShape face = createShape();

			face.beginShape();

			face.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, height/2);
			face.vertex(cos(radians(360f/faces * i)) * radius, sin(radians(360f/faces * i)) * radius, -height/2);
			face.vertex(cos(radians(360f/faces * (i + 1))) * radius, sin(radians(360f/faces * (i + 1))) * radius, height/2);
			face.vertex(cos(radians(360f/faces * (i + 1))) * radius, sin(radians(360f/faces * (i + 1))) * radius, -height/2);

			face.endShape();
			
			prism.addChild(face, 3 + i);
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

	public void resetMatrix() {
		prism.resetMatrix();
	}

	public void draw() {
		shape(prism);
	}

}

//54365
