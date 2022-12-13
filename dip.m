function dip(a,m2,m3,m4) %This function moves the brush in and out of the condiment container
m2.Speed = -0.3;
start(m2);
pause(2);
m2.Speed = 0.5;
pause(3);
stop(m2);
end