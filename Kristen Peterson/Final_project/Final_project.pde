//"Minimal Conway's Game of Life" by Andrew Martin, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
//Work: http://openprocessing.org/visuals/?visualID= 13658
//License:
//http://creativecommons.org/licenses/by-sa/3.0/
//http://creativecommons.org/licenses/GPL/2.0/

//Kristen Peterson created the code to idenify various still lifes and
//oscillators by filling them with a color 

//----------------
//global variables
//----------------
//essentials
boolean scene[][]; // <- stores current state of the system
boolean nextScene[][];// <- stores the next state of the system
 
 
// variable settings
int squareSize = 4; // <- fewer larger or more smaller squares, try 1, 2, 5, 50
int columns = 800;// <- window pixel width
int rows = 600;// <- window pixel height
int fps = 65;// refresh rate, try 1, 5, 100, and 100000;
 
//---------
//functions
//---------
void setup(){
  frameRate(fps);// <- Set frame rate
  size(columns,rows);// <- Set window size
  columns = width/squareSize;// <- columns = number of squares wide
  rows = height/squareSize;// <- rows = number of squares high
  scene = new boolean[rows][columns];// <- Scene stored as a 2d Array of boolen
  nextScene = new boolean[rows][columns];// <- Next scene stored as a 2d Array of boolean
 
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      scene[j][i] = false;// <- Set all 'squares' to off/false
    }
  }
  background(0,128,128);// <- Set the background to a seriously lovely teal.
  makeInitialShape();// <- Set some initial shapes in 'scene'
  showScene();// <- Display the initial state of the machine
  updateScene();// <- Calculate the next frame and update data structures
}
 
void showScene(){
  //First redraw whole screen
  background(0,128,128);
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square
      if (scene[j][i] == true){
        //If the square is on/true draw a white square
        fill(255);
        
           if (neighbourCount(j, i) == 3) {
          int result = 0;

          if (j < rows-1 && i < columns-1) {  
            if (isLive(j+1, i+1)) {
              result++;
            }
          }//and if the lower right neighbour is true/on

          if (i < columns-1) {
            if (isLive(j, i+1)) {
              result++;
            }
          }//and if there's a true/on square to the right

          if (j < rows-1) {  
            if (isLive(j+1, i)) {
              result++;
            }
          }//and if there's a true/on square to the bottom



          if (result==3) {
            fill(255, 0, 0);
          }
        } //turn red 

          if (neighbourCount(j, i) == 3) {
            int result = 0;

            if (i > 0) {  
              if (isLive(j, i-1)) {
                result++;
              }
            }  //left

            if (j < rows-1) {
              if (isLive(j+1, i)) {
                result++;
              }
            } //down

            if (j < rows-1 && i > 0) { 
              if (isLive(j+1, i-1)) {
                result++;
              }
            } //and if the lower left neighbor is on

            if (result==3) {
              fill(255, 0, 0);
            }
          }  //turn red

            if (neighbourCount(j, i) == 3) {
              int result = 0;
              if (j > 0) {//If the square isn't on the top
                if (isLive(j-1, i)) {
                  result++;
                }
              }

              if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }

              if (i < columns-1) {
                if (isLive(j, i+1)) {
                  result++;
                }
              }

              if (result==3) {
                fill(255, 0, 0);
              }
            }   //turn red

              if (neighbourCount(j, i) == 3) {
                 int result = 0;

                if (j > 0) {//If the square isn't on the top
                  if (isLive(j-1, i)) {
                    result++;
                  }
                }

                if (j > 0 && i > 0) {//If the square isn't on the far left or top
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                }

                if (i > 0) {  
                  if (isLive(j, i-1)) {
                    result++;
                  }
                }

                if (result==3) {
                  fill(255, 0, 0);
                }
              }  //turn red
              
              if (neighbourCount(j, i) == 1) {
                 int result = 0;
               
               if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }
               
                 if (result==1) {
                   fill(1);
                   
                 }
              } //turn black when neighbour down 
              
              if (neighbourCount(j, i) == 1) {
                 int result = 0;
                 
                if(j > 0){
                  if(isLive(j-1,i)){
                    result++;
                  }
                }
                
                if (result==1) {
                  fill(1);
                  
                } //turn black when neighbour up 
              }   
              
              if (neighbourCount(j, i) == 1) {
                 int result = 0;
                 
                  if(i < columns-1){
                      if(isLive(j,i+1)){
                          result++;
                        
                      }
                   }
                   
                   if (result==1) {
                     fill(1);
                     
                   }
              } //turn black when neighbour right
              
               if (neighbourCount(j,i) == 1) {
                  int result = 0;
                  
                   if(i > 0){
                        if(isLive(j,i-1)){
                            result++;
                          
                          }
                        }
                        
                        if (result==1) {
                          fill(1);
                          
                        }
                    } //turn black when neighbour left 
               
                if (neighbourCount(j,i) == 2) {
                    int result = 0;
                    
                    if(j <rows-1){
                       if(isLive(j+1,i)){
                           result++;
                       }
                     }   //neighbour down alive 
                     
                     
                     if(j > 0){
                       if(isLive(j-1,i)){
                         result++;
                       }
                     }   //neighbour up alive 
                     
                     if (result==2) {
                       fill(1);
                       
                     }
                  }  //turn black
                  
                  if (neighbourCount(j, i) == 2) {
                     int result = 0;
                 
                  if(i < columns-1){
                      if(isLive(j,i+1)){
                          result++;
                        
                      }
                   }    //nieghbour right alive
                   
                
                 
               
                   if(i > 0){
                        if(isLive(j,i-1)){
                            result++;
                          
                          }
                        }   //neighbour left alive 
                        
                        if(result==2) {
                          fill(1);
                          
                        }
                     }  //turn black 
                     
         if (neighbourCount(j, i) == 2) {
          int result = 0;
          
          if(i < columns-1) {
            if (isLive(j, i+1)) {
              result++;
            }
          }  //neighbor right alive
          
          if (j < rows-1 && i> 0) {
            if (isLive(j+1, i-1))   {
              result++;
            }
          } //neighbour lower/left diagonal alive
          
          if (result==2) {
            fill(0,255,0);
          }
        }
        
          if (neighbourCount(j,i) == 2) {
            int result =0;
            
            if(i > 0) {
              if (isLive(j, i-1)) {
                result++;
              }
            } //neighbor left alive
            
            if(j < rows-1 && i < columns-1)   {
              if (isLive(j+1, i+1)) {
                result++;
              }
            } //neighbor lower/right diagonal 
            
            if(result==2) {
              fill(0,255,0);
            }
          }
          
            if (neighbourCount(j,i) == 2) {
              int result = 0;
              
              if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
              if(j < rows-1 && i < columns-1)  {
                if (isLive(j+1, i+1)) {
                  result++;
                }
              }   //neighbour lower/left supposed rightdiagonal alive
              
              if (result==2) {
                fill(0,255,0);
              }
            } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper/left diagonal alive 
                
                 if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower/left diagonal alive
              
                if (result==2) {
                  fill(0,255,0);
                }
              }
                 if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper/left diagonal alive 
                
                 if(i < columns-1) {
                    if (isLive(j, i+1)) {
                      result++;
               }
            }  //neighbor right alive
            
             if (result==2) {
                fill(0,255,0);
                }
              }
          
          if(neighbourCount(j,i) == 2) {
                int result = 0;
                
            if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
                 if(i > 0) {
                  if (isLive(j, i-1)) {
                    result++;
                  }  
                } //neighbor left alive
                
                if (result==2) {
                  fill(0,255,0);
                }
          }
          
           if (neighbourCount(j, i) == 2) {
          int result = 0;
          
          if(i < columns-1) {
            if (isLive(j, i+1)) {
              result++;
            }
          }  //neighbor right alive
          
          if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
               if (result==2) {
                  fill(0,255,0);
                  
               }
          } //turn green 
          
           if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(i > 0) {
                  if (isLive(j, i-1)) {
                    result++;
                  }
                } //neighbor left alive
                
                if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive 
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left alive
              
                  if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
                
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper right alive
              
              
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper/left diagonal alive 
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
               
             if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
              
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper/left diagonal alive 
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
                 
                if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                 if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left alive
              
               if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive 
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
               
               if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                 if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
              
                  if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive 
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
               
                if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                    
            if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                 
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
                if(neighbourCount(j,i) == 2) {
                int result = 0;
                
               if(i < columns-1) {
                    if (isLive(j, i+1)) {
                      result++;
               }
            }  //neighbor right alive
               
                 
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 3) {
                int result = 0;
                
               if(i < columns-1) {
                    if (isLive(j, i+1)) {
                      result++;
               }
            }  //neighbor right alive
               
                 
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                 if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
                
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
               if(neighbourCount(j,i) == 3) {
                int result = 0;
                
                if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                
                 if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left alive
               
                 
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                
                
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                
                 if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
                 
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                
                
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 3) {
                int result = 0;
                
                
                 if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
                 
                if (j > 0 && i < columns-1) {
                  if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper right alive
                
                 if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive 
                
                
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
                            if(neighbourCount(j,i) == 3) {
                int result = 0;
                
                if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left alive
               
                 if(i > 0) {
                  if (isLive(j, i-1)) {
                    result++;
                  }
                } //neighbor left alive
                
                if(j < rows-1 && i < columns-1)   {
              if (isLive(j+1, i+1)) {
                result++;
              }
            } //neighbor lower right alive
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
                         if(neighbourCount(j,i) == 2) {
                int result = 0;
                
                if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left  alive
                
                 if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
               
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
                      if(neighbourCount(j,i) == 3) {
                int result = 0;
                
                if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left  alive
                
                 if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
              
                  if(i < columns-1) {
                  if (isLive(j, i+1)) {
                      result++;
                }
              }  //neighbor right alive
          
               
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 2) {
                int result = 0;
                
               if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                if(i > 0) {
                  if (isLive(j, i-1)) {
                    result++;
                  }
                } //neighbor left alive
          
               
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
              if(neighbourCount(j,i) == 3) {
                int result = 0;
                
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                 if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left alive
              
              if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive
           
          
               
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
                     if(neighbourCount(j,i) == 2) {
                int result = 0;
                
               if(i < columns-1) {
                    if (isLive(j, i+1)) {
                      result++;
               }
            }  //neighbor right alive
              
              if(j >0){
                  if(isLive(j-1,i)){
                    result++;
                    
                  }
                }   //neighbour up alive
           
          
               
                
                if (result==2) {
                  fill(0,255,0);
                }
              } //turn green
              
                   if(neighbourCount(j,i) == 3) {
                int result = 0;
               
               if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                if (j > 0 && i < columns-1) {
                  if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
                if(j < rows-1 && i <columns-1){
                    if(isLive(j+1,i+1)) {
                      result++;
                    }
                  } //neighbour lower right alive
              
                
               
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
                          if(neighbourCount(j,i) == 3) {
                int result = 0;
               
               if(j <rows-1){
                 if(isLive(j+1,i)){
                   result++;
                 }
               }   //neighbour down alive
               
                if (j > 0 && i < columns-1) {
                  if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
               if(j < rows-1 && i >0)   {
                  if (isLive(j+1, i-1)) {
                    result++;
                }
              }   //neighbour lower left  alive
              
                
               
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
              
                            if(neighbourCount(j,i) == 3) {
                int result = 0;
               
                if(j > 0 && i > 0) {
                  if (isLive(j-1, i-1)) {
                    result++;
                  }
                } //neighbour upper left alive  
                
                 if (j > 0 && i < columns-1) {
                if (isLive(j-1, i+1)) {
                  result++;
                }
              }   //neighbour upper/right alive
              
                if(i > 0) {
                  if (isLive(j, i-1)) {
                    result++;
                  }
                } //neighbor left alive
               
                
                if (result==3) {
                  fill(0,255,0);
                }
              } //turn green
               
               
               
              
              
              
                        
                        
                    
           
        //Use 'squareSize' to calculate where to draw the square
        rect(i*squareSize,j*squareSize,squareSize,squareSize);
      }
    }
  }
}
 
void updateScene(){
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square...
      int nCount = neighbourCount(j,i);//<- Count number of true/on neighbours
      if (nCount < 2 || nCount > 3){//If less than 2 OR greater than 3
        // 0, 1, 4, 5, 6, 7, 8
        nextScene[j][i] = false;//Turn square off
      } else {
        if (nCount == 3){//If EQUAL to 3
          //3
          nextScene[j][i] = true;//Turn square on
        } else {//None of the above
          // 2
          nextScene[j][i] = scene[j][i];//Copy current value
        }
      }
    }
  }
  for (int j = 0; j < rows; j++){
    for (int i = 0; i < columns; i++){
      //For each square...
      scene[j][i] = nextScene[j][i];//<- Copy 'nextScene' value to 'scene'
    }
  }
}
 
int neighbourCount(int y, int x){//<- Function to count true/on neighbours
  int result = 0;//<- Variable that stores the value to return
   
   
  if(x < columns-1){//If the square isn't on the far right
    if(isLive(y,x+1)){//and if there's a true/on square to the right
      result++;//Add one to result
    }
  }
  if(x > 0){//If the square isn't on the far left
    if(isLive(y,x-1)){//and if there's a true/on square to the left
      result++;//Add one to result
    }
  }
  if(y < rows-1){//If the square isn't on the bottom
    if(isLive(y+1,x)){//and if there's a true/on square to the bottom
      result++;//Add one to result
    }
  }
  if(y > 0){//If the square isn't on the top
    if(isLive(y-1,x)){//and if there's a true/on square to the top
      result++;//Add one to result
    }
  }
  if(y > 0 && x > 0){//If the square isn't on the far left or top
    if(isLive(y-1,x-1)) {//and if the top left neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y > 0 && x < columns-1){
    if(isLive(y-1,x+1)) {//and if the top right neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y < rows-1 && x > 0){
    if(isLive(y+1,x-1)) {//and if the lower left neighbour is true/on
      result++;//Add one to the result
    }
  }
  if(y < rows-1 && x < columns-1){
    if(isLive(y+1,x+1)) {//and if the lower right neighbour is true/on
      result++;//Add one to the result
    }
  }
  return result; // <- Return 'result' to whatever called 'neighbourCount(y,x)'
}
 
//Simple function to check a cell in an array and return its value
boolean isLive(int y, int x){
  if(scene[y][x] == true){
    return true;
  } else {
    return false;
  }
  /*This code have been written as the single line
  return scene[y][x]
  *///as the values are already boolean true/false values
}
 
void o(int y, int x){
  //One liner to set a chosen cell to true.
  //Defined as an x,y offset from the top left corner
  scene[y][x] = true;
}
 
void c(int y, int x){
  //One liner ro set a chosen cell to true.
  //Calculated as an x,y offset from the center of the screen
  scene[(rows/2)+y][(columns/2)+x] = true;
}
 
void draw(){
  //As we've done all the work in the functions,
  //'draw' just needs to call these functions.
  showScene();
  updateScene();
}
void makeInitialShape(){//<- Function to set some initial shapes
  
  //R-pentomino
  //change (false) to (true) to see it
  if(true){
    //These locations activated directly affecting values in 'scene'
    //Simple calculations with variables used rather than direct values
    scene[(rows/2)][(columns/2)] = true;
    scene[(rows/2)-1][(columns/2)] = true;
    scene[(rows/2)][(columns/2)-1] = true;
    scene[(rows/2)+1][(columns/2)] = true;
    scene[(rows/2)-1][(columns/2)+1] = true;
  }
}
