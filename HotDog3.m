%% Setup Arduino and Motor Shield connection

clear;

a = arduino('COM4','Mega2560', 'Libraries', 'Adafruit\MotorShieldV2');
dev = addon(a, 'Adafruit\MotorShieldV2');


home = [0.8 2.5 2.26];                  % hardcoded positions
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
%% MAIN FUNCTION
goTo(home,a,m2,m3,m4);              % starts at home

ketchup_dog = [1 1 0];              % user set values for which dogs will have ketchup
mustard_dog = [1 0 1];              % user set values for which dogs will have mustard

goTo(ketchup,a,m2,m3,m4);           % moves arm to ketchup
dip(a,m2,m3,m4);                    % brush picks up ketchup

if ketchup_dog(1) == 1              % checks if user wants dog to have ketchup
    goTo(hotdog1,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog1,home); % applies ketchup
    goTo(armup1,a,m2,m3,m4); 
    goTo(home,a,m2,m3,m4);    
end
if ketchup_dog(2) == 1              % checks if user wants dog to have ketchup
    goTo(hotdog2,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog2,home); % applies ketchup
    goTo(armup2,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if ketchup_dog(3) == 1              % checks if user wants dog to have ketchup
    goTo(hotdog3,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog3,home); % applies ketchup
    goTo(armup3,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end

goTo(mustard,a,m2,m3,m4);           % moves arm to mustard
dip(a,m2,m3,m4);                    % brush picks up mustard

if mustard_dog(1) == 1              % checks if user wants dog to have mustard
    goTo(hotdog1,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog1,home); % applies mustard
    goTo(armup1,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if mustard_dog(2) == 1              % checks if user wants dog to have mustard
    goTo(hotdog2,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog2,home); % applies ketchup
    goTo(armup2,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end
if mustard_dog(3) == 1              % checks if user wants dog to have mustard
    goTo(hotdog3,a,m2,m3,m4);       % moves to correct dog
    petTheDog(a,m2,m3,m4,hotdog3,home); % applies ketchup
    goTo(armup3,a,m2,m3,m4);
    goTo(home,a,m2,m3,m4);    
end



