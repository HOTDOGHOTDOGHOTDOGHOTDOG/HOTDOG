function goTo(position,a,m2,m3,m4)
r4 = readVoltage(a, 'A8');
r3 = readVoltage(a, 'A9');
r2 = readVoltage(a, 'A11');

center4 = position(3);
center3 = position(2);
center2 = position(1);

dist4 = abs(center4 - r4);
if (dist4 <= 0.05)
    sign4 = 0;
elseif (r4 > center4)
    sign4 = 1;
else
    sign4 = -1;
end

dist3 = abs(center3 - r3);
if (dist3 <= 0.05)
    sign3 = 0;
elseif (r3 > center3)
    sign3 = -1;
else
    sign3 = 1;
end

dist2 = abs(center2 - r2);
if (dist2 <= 0.05)
    sign2 = 0;
elseif (r2 > center2)
    sign2 = -1;
else
    sign2 = 1;
end

m4.Speed = sign4*0.5;
start(m4);
m3.Speed = sign3*0.5;
start(m3);
m2.Speed = sign2*0.5;
start(m2);

stopped4 = 0;
stopped3 = 0;
stopped2 = 0;

while (dist4 >= 0.05 ||  dist3 >= 0.05 || dist2 >= 0.05)
    r4 = readVoltage(a, 'A8');
    dist4 = abs(center4 - r4);
    r3 = readVoltage(a, 'A9');
    dist3 = abs(center3 - r3);
    r2 = readVoltage(a, 'A11');
    dist2 = abs(center2 - r2);
    if(dist4 <= 0.05)
        stop(m4);
        stopped4 = 1;
    end
    if(dist3 <= 0.05)
        stop(m3);
        stopped3 = 1;
    end
    if(dist2 <= 0.05)
        stop(m2);
        stopped2 = 1;
    end
    
    if(stopped4 == 1 && stopped3 == 1 && stopped2 == 1)
        break
    end
    pause(0.001);

end

stop(m2);
stop(m3);
stop(m4);
end