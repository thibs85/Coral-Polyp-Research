macro "Macro 1" {
	Overlay.clear;
	n = 0;
	b = true;
	locations_x = newArray(10000);
	locations_y = newArray(10000);
	for(i = 0; i < 225; i++){
		for(j = 0; j < 224; j++){
			if(getPixel(j,i) == 255){
				for(k = 1; k <= 2; k++){
					if(getPixel(j+(1*k),i) != 255 || getPixel(j-(1*k),i) != 255){
						b = false;
					}
					else if(getPixel(j,i+(1*k)) != 255 || getPixel(j,i-(1*k)) != 255){
						b = false;
					}
					else{
						b = true;
					}
				}
				if(b == true){
					print("Point located at "+j+","+i);
					locations_x[n] = j;
					locations_y[n] = i;
					n++;
				}				
			}
			else{
				//maybe something to calculate whitespace?
			}
		}
	}
	print(n + " points located");
	for(a = 0; a < n; a++){
		dist = 10;
		temp = 0;
		for(b = 0; b < n; b++){
			sq1 = Math.pow((locations_x[b]-locations_x[a]), 2);
			sq2 = Math.pow((locations_y[b]-locations_y[a]), 2);
			if(Math.sqrt(sq1 + sq2) < dist && Math.sqrt(sq1 + sq2) > 2){
				dist = Math.sqrt(sq1 + sq2);
				temp = b;
			}
		}
		//print(dist);
		if(dist > 2 && dist < 10){ //threshold for the line length
			Overlay.drawLine(locations_x[a],locations_y[a],locations_x[temp],locations_y[temp]);
			setColor('blue');
			setLineWidth(1);
			Overlay.add;
		}
	} 
	Overlay.show;
	Array.print(locations_x);
	Array.print(locations_y);
}