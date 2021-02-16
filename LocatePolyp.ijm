macro "Macro 1" {
	Overlay.clear;
	n = 0;
	b = true;
	locations_x = newArray(50000);
	locations_y = newArray(50000);
	for(i = 0; i < 225; i++){
		for(j = 0; j < 224; j++){
			if(getPixel(j,i) == 255){
				for(k = 1; k <= 1; k++){
					//if(getPixel(j+(1*k),i) != 255 || getPixel(j-(1*k),i) != 255){
						//b = false;
					//}
					//else if(getPixel(j,i+(1*k)) != 255 || getPixel(j,i-(1*k)) != 255){
						//b = false;
					//}
					//else{
						b = true;
					//}
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
		dist = 1000;
		temp = 0;
		for(b = 0; b < n; b++){
			if(Math.sqrt((locations_x[b]-locations_x[a])+(locations_y[b]-locations_y[a])) < dist &&
			Math.sqrt((locations_x[b]-locations_x[a])+(locations_y[b]-locations_y[a])) > 0){
				dist = Math.sqrt((locations_x[b]-locations_x[a])+(locations_y[b]-locations_y[a]));
				print(dist);
				temp = b;
			}	
		}
		Overlay.drawLine(locations_x[a],locations_y[a],locations_x[temp],locations_y[temp]);
		setColor('blue');
		setLineWidth(1);
		Overlay.add;
	} 
	Overlay.show;
	Array.print(locations_x);
	Array.print(locations_y);
}