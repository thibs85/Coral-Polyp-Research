/*macro "Macro 1" {
    Overlay.clear;
	runs = 1;
	for(runs = 1; runs < 2; runs++){
		Stack.setSlice(runs);
		R = 0;
		while(R < 7){
			//close gaps
			run("Dilate", "No");
			run("Erode", "No");
			n = 0;
			b = true;
			locations_x = newArray(10000);
			locations_y = newArray(10000);
			//iterate through every pixel
			//start skipping every other frame
			for(i = 0; i < 225; i++){
				for(j = 0; j < 224; j+=20){
					//255 = black pixel
					if(getPixel(j,i) == 255){
                        b = true;
                    }
                    else{
                        b = false;
                    }
                    if(b == true){
                        print("Point located at "+j+","+i);
                        locations_x[n] = j;
                        locations_y[n] = i;
                        n++;
					}	
				}
			}
			print(n + " points located");
			//nearest neighbor
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
				if(dist > 3){ //threshold for the line length
					Overlay.drawLine(locations_x[a],locations_y[a],locations_x[temp],locations_y[temp]);
					setColor('blue');
					setLineWidth(2);
					Overlay.add;
				}
			} 
			Overlay.show;
			Array.print(locations_x);
			Array.print(locations_y);
			R++;
		}
	}
	//invert binary
	run("Make Binary", "Ok");
}*/

run("Close-", "stack");
run("Dilate", "stack");
run("Close-", "stack");
run("Dilate", "stack");
run("Close-", "stack");
run("Dilate", "stack");
run("Close-", "stack");
run("Dilate", "stack");
run("Close-", "stack");
run("Dilate", "stack");
run("Close-", "stack");



