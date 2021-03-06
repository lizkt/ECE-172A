function [ newPos ] = get_new_pos( curPos, sensorInput, dir )
% sensorInput is a 3x3 matrix and follows the following convention. 
% sensorInput = [   a   b   c   ;
%                   d   x   e   ;
%                   f   g   h   ];
% 'x' is the location of the bot.
% a to h are either '0' or '1' depending on the presence of obstacle in
% those blocks. For example take the image shown in Q2. At this location
% sensorInput = [1 1 1;
%                0 0 0;
%                0 0 0];
    newPos = curPos;
    if dir == 0
        if sensorInput(1,2) == 1
            newPos(2) = newPos(2) + 1; % Move Right
            %newPos(1) = newPos(1) + 1; % Move Down
        end
        
        if sensorInput(1,2) == 0 && sensorInput(1,1) == 1
            newPos(1) = newPos(1) - 1; %  up
        end
             
        if sensorInput(2,3) == 1 && sensorInput(1,2) == 1 && sensorInput(3,2)==0
            newPos(1) = newPos(1) + 1;
            newPos(2) = newPos(2) -1; %down corner
        end
             
        if sensorInput(3,2) == 0 && sensorInput(2,3) == 1 && sensorInput(1,2)==0
            newPos(1) = newPos(1) + 1;  % down
        end   
        if  sensorInput(3,2) == 1 && sensorInput(2,1)==0
            newPos(2) = newPos(2) - 1;  %left
        end
       
        if  sensorInput(2,1) == 1 && sensorInput(1,2)==0 && sensorInput(1,1)==0 && sensorInput(3,2)==0
            newPos(1) = newPos(1) - 1;  %up
        end
        if  sensorInput(3,1) == 1 && sensorInput(2,1)==0 && sensorInput(3,2)==0
            newPos(2) = newPos(2) - 1;  %left at corner
        end
        if  sensorInput(3,2) == 0 && sensorInput(3,3)==1 && sensorInput(2,3)==0
            newPos(1) = newPos(1) + 1;  
        end
        if  sensorInput(1,3) == 1 && sensorInput(2,3)==0 && sensorInput(1,2)==0
            newPos(2) = newPos(2) + 1;  
        end
      
        
    elseif dir == 1
        if sensorInput(1,2) == 1  || (sensorInput(1,1) == 1 && sensorInput(2,1) == 0)
            newPos(2) = newPos(2) - 1; % Move Left  _|
        end
        if sensorInput(2,1) == 1 &&  sensorInput(1,2) == 1
            newPos(1) = newPos(1) + 1;  
            newPos(2) = newPos(2) + 1;    %Move down at corner zuoshang
        end
        if (sensorInput(3,1) == 1 &&  sensorInput(3,2) == 0 && sensorInput(2,1) == 0)
            newPos(1) = newPos(1) + 1;  
               %Move down 
        end
        
        
        if sensorInput(2,1) == 1 && sensorInput(1,2) == 0
            newPos(1) = newPos(1) + 1;  %move down not at corner
        end
        if (sensorInput(3,2) == 1 && sensorInput(2,1) == 1)
            newPos(2) = newPos(2) + 1;
            newPos(1) = newPos(1) - 1;  %move right at |_corner
        end
        if sensorInput(2,3) == 1 && sensorInput(1,2) == 0 && sensorInput(1,3) == 0
            newPos(1) = newPos(1) - 1;
            
        end
        if sensorInput(2,3) == 0 && sensorInput(3,3) == 1 && sensorInput(3,2) == 0
            newPos(2) = newPos(2) + 1;
        end
        if sensorInput(3,2) ==1 && sensorInput(2,1) == 0
            newPos(2) = newPos(2) +1; %right
        end
        if ((sensorInput(1,3)) == 1 && (sensorInput(1,2) ==0))
            newPos(1) = newPos(1) -1;
                
             %newPos(1) = newPos(1) - 1; % Move Up at |_ or |-corner
        end
        if sensorInput(2,3) ==1 && sensorInput(1,2) == 0 && sensorInput(3,2) ==1
            newPos(1) = newPos(1) -1;
            newPos(1) = newPos(1) +1; 
            newPos(2) = newPos(2) -1;
            
             %newPos(1) = newPos(1) - 1; % Move Up  at _| corner
        end

    end
end