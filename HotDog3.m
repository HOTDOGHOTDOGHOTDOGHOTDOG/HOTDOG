%% Setup Arduino and Motor Shield connection

clear;

a = arduino('COM4','Mega2560', 'Libraries', 'Adafruit\MotorShieldV2');
dev = addon(a, 'Adafruit\MotorShieldV2');


home = [0.8 2.5 2.26];                  % hardcode positions
armup1 = [0.9 2.6 1.7];
armup2 = [0.9 2.6 2.26];
armup3 = [0.9 2.6 2.8];
ketchup = [0.8 2.5 1.2];
mustard = [0.8 2.5 3.3];
hotdog1 = [1.8 2.5 1.7];
hotdog2 = [1.8 2.5 2.26];
hotdog3 = [1.8 2.5 2.8];


m1 = dcmotor(dev,1);                    % start motors
m2 = dcmotor(dev,2);
m3 = dcmotor(dev,3);
m4 = dcmotor(dev,4);

%% Tests

goTo(home,a,m2,m3,m4);
%% MAIN 2
goTo(home,a,m2,m3,m4);

ketchup_dog = [1 1 0];
mustard_dog = [1 0 1];

goTo(ketchup,a,m2,m3,m4);
dip(a,m2,m3,m4);

if ketchup_dog(1) == 1
    goTo(hotdog1,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog1,home);
    goTo(armup1,a,m2,m3,m4); 
    goTo(home,a,m2,m3,m4);    
end
if ketchup_dog(2) == 1
    goTo(hotdog2,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog2,home);
    goTo(armup2,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if ketchup_dog(3) == 1
    goTo(hotdog3,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog3,home);
    goTo(armup3,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end

goTo(mustard,a,m2,m3,m4);
dip(a,m2,m3,m4);

if mustard_dog(1) == 1
    goTo(hotdog1,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog1,home);
    goTo(armup1,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if mustard_dog(2) == 1
    goTo(hotdog2,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog2,home);
    goTo(armup2,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if mustard_dog(3) == 1
    goTo(hotdog3,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog3,home);
    goTo(armup3,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end



%% Main function
goTo(home,a,m2,m3,m4);

quit = input(prompt1, 's');
condiment = input(prompt2, 's');
hotdog = input(prompt3, 's');

if (condiment == "ketchup")
    condiment = ketchup;
else
    condiment = mustard;
end

if (hotdog == "1")
    hotdog = hotdog1;
elseif (hotdog == "2")
    hotdog = hotdog2;
else
    hotdog = hotdog3;
end

while (quit ~= "no")
    % go to condiment
    % grab brush
    % go to hotdog
    % condiment on dog dog
    % go to condiment
    % drop brush
    % go to home
    % prompt1 again
    goTo(armup,a,m2,m3,m4);
    goTo(condiment,a,m2,m3,m4);
    goTo([0,2.9,condiment(3)],a,m2,m3,m4);
    goTo([0.5,2.9,condiment(3)],a,m2,m3,m4);
    goTo(armup,a,m2,m3,m4);
    goTo(hotdog,a,m2,m3,m4);
    petTheDog(a,m2,m3,m4,hotdog,home);
    goTo(home,a,m2,m3,m4);
    
    quit = input("How about another...?", 's');
end

%% Start Motors

m1 = dcmotor(dev,1);
m2 = dcmotor(dev,2);
m3 = dcmotor(dev,3);
m4 = dcmotor(dev,4);

%% Bottle Test
%{
function grabbrush(m1)
m1.Speed = -0.2;
start(m1);
pause(1);
stop(m1);
end

function dropbrush(m1)
m1.Speed = 0.2;
start(m1);
pause(1);
stop(m1);
end
%}
%% Paintbrush

%goTo(home,a,m2,m3,m4);
%goTo(ketchup,a,m2,m3,m4);
%goTo(home,a,m2,m3,m4);

