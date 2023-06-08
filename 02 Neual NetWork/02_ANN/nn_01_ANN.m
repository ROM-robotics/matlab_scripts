%%%% ANN ( default hardlimit activiation function ) %%%%
clear;clc;

%{ %% 1 Creating a new perceptron with newp()
% [-1 1;-2 2] က input နှစ်ခုရဲ့ range 
% 1 က neuron အရေအတွက်, 
% TF='Hardlim'သူက activation function 
% LF='learnp' သူက learning algo

net = newp([-1 1;-2 2],1);
%view(net);

% default weight တန်ဖိုးနှစ်ခုက 0
net.IW{1,1};
net.IW{1,1}=[0.9,0.1];

% default Layer weight
net.LW;
% default bias
net.biases;

X = [1 -1 5;
     2 -2 2];
Y = [3 -3 7];
% Training ( train(all) or adapt(one) )
% [ updated_network, epoch ] 
[net, tr] = train(net, X, Y);

%}


%{ 
%% 2 AND gate perceptron
X = [0 0 1 1;
     0 1 0 1];
Y = [0 0 0 1];

net = newp([0 1;0 1],1);
trained_net = train(net, X, Y);

% After training , feed input data and simulate
y_hat = sim(trained_net, X);
%}


%{ 
%% 3 Feedforward
% defalut 1 hidden with 10 neurons, 1 output
net1 = feedforwardnet();
% 1 Hidden layers with 8 nodes
net2 = feedforwardnet(8);
% 2 Hidden layers with 8 nodes and 3 nodes
net3 = feedforwardnet([8 3]);
view(net3);
%}

%{ 
%% 4 Function with one variable
x = 0:0.05:2;
y = 1./( (x-0.3).^3 + 0.1 )  + 1./( (x-0.9).^2+0.04 ) - 6;
% plot(x,y);

net = feedforwardnet([5 10]);
net.trainParam.goal = 0.001; % performance goal
trained_net = train(net,x,y);
y_hat = sim(trained_net, x);
figure(1);plot(x,y,"-",x,y_hat,'o');
legend('actual','predict');
%}

%{ 
%% 5 Function with two variable
x = -2:0.25:2;
y = -2:0.25:2;
[x1,y1] = meshgrid(x,y); % return 1x17 to 17x17
z = sin(x1).*cos(y1);
% mesh(x,y,z); xlabel('x'); ylabel('y'); zlabel('z');
X = [x;y];
Y = z;
net = feedforwardnet([20 15]);
net.trainParam.goal = 0.0001;
trained_net = train(net, X, Y);
predict_output = sim(trained_net, X);
%plot(x,z,'-',x,predict_output,'o');
plot(y,z,'-',y,predict_output,'o');
%}

%{  
%% 6 Function with multi variable
a = rand(1,100); 
b = rand(1,100); 
c = rand(1,100); 
d = rand(1,100);

y = 3.*a + 4.*a.*b + 2.*c + d;
X = [a;b;c;d]
Y = y;
net = feedforwardnet([6 2]);
net.trainParam.goal = 0.1;
trained_net = train(net, X, Y);
Y_predict = sim(trained_net, X);
plot(X,Y,'-',X,Y_predict,'o');
legend('actual','predict');
%}
%%%% ------------------------------------------------------------------------%%%%