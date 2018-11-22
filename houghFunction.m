function [H, theta, rho, P, lines] = houghFunction( BW, image )

    % Hough transform, with theta going from -90 to 89 with an
    % interval of x
    [H, theta, rho] = hough(BW, 'Theta', -90:0.02:89);
    
    % Normalize to get the hough tranform matrix in grayscale and then show the
    % image
    H1 = H ./ max(max(H));
    figure
    imshow(imadjust(H1),[],...
           'XData',theta,...
           'YData',rho,...
           'InitialMagnification','fit');
    xlabel('\theta (degrees)')
    ylabel('\rho')
    axis on
    axis normal 
    hold on
    
    
    % Get x amount of peaks
    P  = houghpeaks(H, 15);
    
    % Now things are weird, I have no clue what this does. But it might work
    x = theta(P(:,2));
    y = rho(P(:,1));
    plot(x, y, 's', 'color', 'blue');
    lines = houghlines(BW, theta, rho, P, 'FillGap', 5, 'MinLength', 7);

    % Lol var egentligen detta jag menade
    figure, imshow(BW), hold on
    max_len = 0;
    for k = 1:length(lines)
       xy = [lines(k).point1; lines(k).point2];
       plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

       % Plot beginnings and ends of lines
       plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
       plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

       % Determine the endpoints of the longest line segment
       len = norm(lines(k).point1 - lines(k).point2);
       if (len > max_len)
          max_len = len;
          xy_long = xy;
       end
    end

end

