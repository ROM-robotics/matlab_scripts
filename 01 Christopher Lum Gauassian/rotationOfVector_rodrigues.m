clear
clc
close all

% define normal vector n
n = [1;0;0];
n = ( 1/norm(n) ) * n; % n needs to be unit vector

% define vector u
u = [2;2;-1];

% define range of angles to rotate through
mu_range = linspace(0, 2*pi, 50);

% rotate u around vector n
figure
for i=1:length(mu_range)
    clf   % delete all children of specified figures
    hold on  
    
    % get the current rotation angle
    mu = mu_range(i);
    
    % Apply Goldstein's rotation of a vector formula
    v = (1-cos(mu)) * dot(n,u) * n  + cos(mu)*u  - sin(mu)*cross(n,u);
    
    % Draw u
    plot3([0 u(1)],[0 u(2)],[0 u(3)],'r-', 'LineWidth', 2);
    
    % Draw n
    plot3([0 n(1)],[0 n(2)],[0 n(3)],'g-', 'LineWidth', 2);
    
    % Draw v
    plot3([0 v(1)],[0 v(2)],[0 v(3)],'b-', 'LineWidth', 2);
    
    legend('u','n','v');
    
    xlabel('x')
    ylabel('y')
    zlabel('z')
    
    grid on
    title('Rotation of u around n')
    axis equal
    
    %view([35 15])
    view([90 0])
    axis([-norm(u) norm(u) -norm(u) norm(u) -norm(u) norm(u)])
    
    drawnow
    
end

