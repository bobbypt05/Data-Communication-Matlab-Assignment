% 2B1Q function for generating 2B1Q wave
% two_B_one_Q function takes 2 arguments bits & bitrate and returns 2
% variables t & x. t denotes x-axis scale & x denotes output signal  
% i.e. array to draw graph.

function[t,x]= two_B_one_Q(bits,bitrate)

% T is total time of bit sequence

T=length(bits)/bitrate;   

% n is used for generating continuous graph

n=200;
N=n*length(bits);

% incrementing in small intervals

dt=T/N;

t=0:dt:T;

% x is output signal and is 1 x length(t) dimensional matrix i.e.
% a row matrix. Firstly initializing all elements of matrix as 0.

x=zeros(1,length(t));

% for first time assuming previous level as positive
 
% if bits are 00 then next level is 1
if (bits(1)==0 && bits(2) ==0)
    x(0*n+1:(1)*n) = 1;

% elseif bits are 01 then next level is 3
elseif (bits(1)==0 && bits(2) ==1)
    x(0*n+1:(1)*n) = 3;

%elseif bits are 10 then next level is -1
elseif (bits(1)==1 && bits(2) ==0)
    x(0*n+1:(1)*n) = -1;

%elseif bits are 11 then next level is -3
elseif (bits(1)==1 && bits(2) ==1)
    x(0*n+1:(1)*n) = -3;
end


% now in every state checking for previous levels
for i=2:(length(bits)/2)
    
    % if bits are 00
    if (bits(2*i-1)==0 && bits(2*i) ==0)

        % if previous level is positive then next level is 1

        if(x((i-2)*n+1:(i-1)*n) >0)
            x((i-1)*n+1:i*n) = 1;

        % else if previous level is negative then next level is -1

        else
            x((i-1)*n+1:i*n) = -1;
        end

    % elseif bits are 01
    elseif (bits(2*i-1)==0 && bits(2*i) ==1)

        % if previous level is positive then next level is 3
        if(x((i-2)*n+1:(i-1)*n) >0)
            x((i-1)*n+1:i*n) = 3;

        % else if previous level is negative then next level is -3
        else
            x((i-1)*n+1:i*n) = -3;
        end

    % elseif bits are 10    
    elseif (bits(2*i-1)==1 && bits(2*i) ==0)

        % if previous level is positive then next level is -1
        if(x((i-2)*n+1:(i-1)*n) >0)
            x((i-1)*n+1:i*n) = -1;
        
        % else if previous level is negative then next level is 1    
        else
            x((i-1)*n+1:i*n) = 1;
        end
    
    % elseif bits are 11
    elseif (bits(2*i-1)==1 && bits(2*i) ==1)
        
        % if previous level is positive then next level is -3
        if(x((i-2)*n+1:(i-1)*n) >0)
            x((i-1)*n+1:i*n) = -3;
        
        % else if previous level is negative then next level is 3
        else
            x((i-1)*n+1:i*n) = 3;
        end
    end
end


