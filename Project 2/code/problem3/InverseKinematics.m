%{
This function is supposed to implement inverse kinematics for a robot arm
with 3 links constrained to move in 2-D. The comments will walk you through
the algorithm for the Jacobian Method for inverse kinematics

INPUTS:
l0, l1, l2: lengths of the robot links
x_e_target, y_e_target: Desired final position of the end effector 

OUTPUTS:
theta0_target, theta1_target, theta2_target: Joint angles of the robot that
take the end effector to [x_e_target,y_e_target]


%}





function [theta0_target, theta1_target, theta2_target] = InverseKinematics(l0,l1,l2,x_e_target,y_e_target)

    


    % Initialize the thetas to some value
    theta0 = pi/6; %pi/3
    theta1 = 0;
    theta2 = 0;
    
    
    l0=5;
    l1=5;
    l2=5;
    x_e_target=8;
    y_e_target=8;
    % Obtain end effector position x_e, y_e for current thetas: 
    % HINT: use your ForwardKinematics function
    
     [x_1,y_1,x_2,y_2,x_e,y_e] = ForwardKinematics(l0,l1,l2, theta0, theta1, theta2);
    
    
    while  (sqrt((x_e_target-x_e)^2+(y_e_target-y_e)^2)>0.1)
     
        %(Replace the '1'  with a condition that checks if your estimated [x_e,y_e] is close to [x_e_target,y_e_target])
        % Calculate the Jacobian matrix for current values of theta:
        % HINT: write a function for doing this
        dxedth0=-l0*sin(theta0)-l1*sin(theta0+theta1)-l2*sin(theta0+theta1+theta2);
        dxedth1=-l1*sin(theta0+theta1)-l2*sin(theta0+theta1+theta2);
        dxedth2=-l2*sin(theta0+theta1+theta2);
        
        dyedth0=l0*cos(theta0)+l1*cos(theta0+theta1)+l2*cos(theta0+theta1+theta2);
        dyedth1=l1*cos(theta0+theta1)+l2*cos(theta0+theta1+theta2);
        dyedth2=l2*cos(theta0+theta1+theta2);
        
        
        J=[dxedth0 dxedth1 dxedth2; dyedth0 dyedth1 dyedth2];
        % Calculate the pseudo-inverse of the jacobian using 'pinv()': 

        jpinv=pinv(J);
        
        % Update the values of the thetas by a small step:
      
        dtheta=0.1*jpinv*[x_e_target-x_e;y_e_target-y_e];
        theta0=theta0+dtheta(1,1);
        theta1=theta1+dtheta(2,1);
        theta2=theta2+dtheta(3,1);
        
        
        % Obtain end effector position x_e, y_e for the updated thetas:
         [x_1,y_1,x_2,y_2,x_e,y_e] = ForwardKinematics(l0,l1,l2, theta0, theta1, theta2);

        
        
        
        
        % Draw the robot using drawRobot( ) : This will help you visualize how the robot arm moves through the iteration: 
        
        drawRobot(x_1,y_1,x_2,y_2,x_e,y_e); %hold on;
        
        
        
    
        pause(0.00001)  % This will slow the loop just a little bit to help you visualize the robot arm movement 
    end
    
    
    
    % Set the theta_target values:
    theta0_target = theta0;
    theta1_target = theta1;
    theta2_target = theta2;







end