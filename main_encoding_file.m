%--- According to question we have to take input a stream of bits and first convert it into manchester and then 2B1Q signal 
%--- Output would be 4 graphs in 1 window using subplot
%--- 1st graph will be manchester encoding using default bitrate as 1, default baudrate as 2 & default bandwidth as 1
%--- 2nd graph will be modified manchester encoding using bitrate or baudrate or bandwidth you entered
%--- 3rd graph will be 2B1Q encoding using default bitrate as 1, default baudrate as 0.5 & default bandwidth as 0.25
%--- 4th graph will be 2B1Q encoding using bitrate or baudrate or bandwidth you entered


% Taking input as an array of bits i.e. like [1 0 1 0]
bits = input('Enter the input :');

% Enter choice for i.e. enter bitrate ,baudrate or bandwidth 
% According to entering choice you will get modified graph    
x=input('Enter choice\n1.bit rate\n2.baud rate\n3.bandwidth\n');
if(x==1)
    bitrate=input('Enter bit rate\n');
elseif(x==2)
    baudrate=input('Enter baud rate\n');
    bitrate=baudrate/2;
    bqbitrate=baudrate*2;
elseif(x==3)
    bandwidth=input('Enter bandwidth\n');
    bitrate=bandwidth;
    bqbitrate=4*bandwidth;
end

%--------------------Manchester encoding-------------------------
 
defaultMbitrate=1;                                     %-- default manchester bitrate                                     
defaultMbaudrate=2;                                    %-- default manchester baudrate
defaultMbandwidth=1;                                   %-- default manchester bandwidth
rm=0.5;                                                
cm=0.5;

      %-- figure to draw figure
figure;
      %-- using manchester function from manchester.m file
[t,s] = manchester(bits,defaultMbitrate);                 
subplot(2,2,1);
plot(t,s);
ylabel('Amplitude','fontweight','bold','fontsize',13);
xlabel('time(sec)','fontweight','bold','fontsize',13);
axis([0 t(end) -6 6]);
grid on;

text(t(end)-t(end)/length(bits),6-0.5,strcat('bitrate = ',num2str(defaultMbitrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),6-1.5,strcat('baudrate = ',num2str(defaultMbaudrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+0.5,strcat('bandwidth = ',num2str(defaultMbandwidth)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+1.5,strcat('r = ',num2str(rm)),'Color', 'k', 'FontWeight', 'bold');

title(['Manchester: [' num2str(bits) ']']);

      %-- using manchester function from manchester.m file
[t,s] = manchester(bits,bitrate);     
baudrate=bitrate/rm;                                       % modified manchester baudrate
bandwidth=cm*bitrate/rm;                                   % modified manchester bandwidth
subplot(2,2,2);
plot(t,s);
ylabel('Amplitude','fontweight','bold','fontsize',13);
xlabel('time(sec)','fontweight','bold','fontsize',13);
axis([0 t(end) -6 6]);
grid on;

text(t(end)-t(end)/length(bits),6-0.5,strcat('bitrate = ', num2str(bitrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),6-1.5,strcat('baudrate = ',num2str(baudrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+0.5,strcat('bandwidth = ',num2str(bandwidth)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+1.5,strcat('r = ',num2str(rm)),'Color', 'k', 'FontWeight', 'bold');

title(['New Manchester: [' num2str(bits) ']']);


%----------------------2B1Q encoding----------------------------
rq=2;
cq=0.5;
defaultBQbaudrate=0.5;                                    % default 2B1Q baudrate
defaultBQbitrate=rq*defaultBQbaudrate;                    % default 2B1Q baudrate
defaultBQbandwidth=cq*defaultBQbitrate/rq;                % default 2B1Q baudrate

      %-- using two_B_one_Q function from two_B_one_Q.m file

[t,s] = two_B_one_Q(bits,defaultBQbitrate);
subplot(2,2,3);
plot(t,s);
ylabel('Amplitude','fontweight','bold','fontsize',13);
xlabel('time(sec)','fontweight','bold','fontsize',13);
t=t/2;
axis([0 t(end) -6 6]);
grid on;

text(t(end)-t(end)/length(bits),6-0.5,strcat('bitrate = ',num2str(defaultBQbitrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),6-1.5,strcat('baudrate = ',num2str(defaultBQbaudrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+0.5,strcat('bandwidth = ',num2str(defaultBQbandwidth)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+1.5,strcat('r = ',num2str(rq)),'Color', 'k', 'FontWeight', 'bold');

title(['2B1Q: [' num2str(bits) ']']);


      %-- using two_B_one_Q function from two_B_one_Q.m file

[t,s] =two_B_one_Q(bits,bitrate);
baudrate=bitrate/rq;                                       % 2B1Q baudrate
bandwidth=cq*bitrate/rq;                                   % 2B1Q bandwidth
subplot(2,2,4);
plot(t,s);
ylabel('Amplitude','fontweight','bold','fontsize',13);
xlabel('time(sec)','fontweight','bold','fontsize',13);
t=t/2;
axis([0 t(end) -6 6]);
grid on;

text(t(end)-t(end)/length(bits),6-0.5,strcat('bitrate = ',num2str(bitrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),6-1.5,strcat('baudrate = ',num2str(baudrate)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+0.5,strcat('bandwidth = ',num2str(bandwidth)),'Color', 'k', 'FontWeight', 'bold');
text(t(end)-t(end)/length(bits),-6+1.5,strcat('r = ',num2str(rq)),'Color', 'k', 'FontWeight', 'bold');

title(['New 2B1Q: [' num2str(bits) ']']);