clc; clear; close all;

initial_loc = [1,1];
cur_loc = initial_loc;
final_loc = [100,100];
mu = [60, 50; 10, 40]; 
sigma = [50, 0; 0, 50];

% Set up vector potential field
syms u v; % define symbolic variables to denote the coordintes on the potential field

% Symbolic equation that represents the potential field at any point (u, v)
z_sym(u, v) = (((final_loc(1,1)-u).^2 + (final_loc(1,2)-v).^2)/20000) + ...,
    1e4*(1/(det(sigma)*2*pi))*exp(-(1/2) .* [(u-mu(1,1)); (v-mu(1,2))]'*pinv(sigma)*[(u-mu(1,1)); (v-mu(1,2))]) + ...,
    1e4*(1/(det(sigma)*2*pi))*exp(-(1/2) .* [(u-mu(2,1)); (v-mu(2,2))]'*pinv(sigma)*[(u-mu(2,1)); (v-mu(2,2))]);

% Calculate symbolic derivatives of the field with respect to the coordinates u and v
dzdu_sym = diff(z_sym, u);
dzdv_sym = diff(z_sym, v);

% Convert symbolic functions into MATLAB functions for ease of use
z = matlabFunction(z_sym);
dx = matlabFunction(dzdu_sym);
dy = matlabFunction(dzdv_sym);
[x, y] = meshgrid(0:4:100);

%% Part 1
figure();
%meshc(x, y, z(x,y)); hold on;
xlabel('x');
ylabel('y');
zlabel('z');

contour(x,y,z(x,y),20);hold on;
plot(1,1,'b*');hold on;
plot(100,100,'r*');hold on;
quiver(x,y,dx(x,y),dy(x,y));hold off;
figure 
 mesh(x,y,z(x,y));hold on;
 plot3(1,1,z(1,1),'b*');
 plot3(100,100,z(100,100),'r*');


% Above, we plot the mesh and contour plot as a single figure.
%
% a) Plot the contour plot and mesh of the vector field as separate figures.
% Useful functions are contour, mesh, surf, meshc, etc.
% Use x, y, and z(x, y) to plot the vector field.
%
% a) Plot the gradient (dx, dy) as quivers over the contour plot
% Use x, y, dx(x,y), and dy(x,y) to plot the quivers
%
% c) Indicate where the bot will begin, blue asterisk, and where the
% bot will finish, red asterisk. (Look through the code).


%% Part 2
% Implement the algorithm from the discussion slides to control the bot
% through the vector field helping it reach it's final location.
% Plot each location it passes through as a blue asterisk, the final image
% should be the complete trajectory the bot takes.

%Press any key to begin the animation
pause;

% for i=1:50
%     
%     % This line must be deleted and replaced with your gradient descent update,
%     % it's here to show you how the bot might move.
%     %cur_loc = cur_loc + [0,1];
% 
%     %Plot the bots current location on the mesh.
%     plot3(cur_loc(1,1), cur_loc(1,2), z(cur_loc(1,1), cur_loc(1,2)), '*b');
%     pause(.1);
% end

absgradient=sqrt(dx(1,1)^2+dy(1,1)^2);
lambda=1/absgradient;

while (absgradient>0)
   % cur_loc=cur_loc-lambda*[];
   % absgradient=sqrt();
    absgradient=sqrt(dx(round(cur_loc(1,1)),round(cur_loc(1,2)))^2+dy(round(cur_loc(1,1)),round(cur_loc(1,2)))^2);
    lambda=1/absgradient;
    cur_loc=cur_loc-lambda*([dx(round(cur_loc(1,1)),round(cur_loc(1,2))),dy(round(cur_loc(1,1)),round(cur_loc(1,2)))]);
    
    %absgradient=sqrt(dx((cur_loc(1,1)),(cur_loc(1,2)))^2+dy((cur_loc(1,1)),(cur_loc(1,2)))^2);
    %lambda=1/absgradient;
    plot3(cur_loc(1,1), cur_loc(1,2), z(cur_loc(1,1), cur_loc(1,2)), '*b');
    pause(.1);
end


hold off;




