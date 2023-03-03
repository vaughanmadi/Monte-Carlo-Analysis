function [aP] = J2J3accel(rSat,J2,J3,rE,mu)
r = norm(rSat);
ai2 = ((-3*J2*mu*rE^2*rSat(1))/(2*r^5))*(1 - (5*rSat(3)^2)/r^2);
aj2 = ((-3*J2*mu*rE^2*rSat(2))/(2*r^5))*(1 - (5*rSat(3)^2)/r^2);
ak2 = ((-3*J2*mu*rE^2*rSat(3))/(2*r^5))*(3 - (5*rSat(3)^2)/r^2);

ai3 = ((-5*J3*mu*rE^3*rSat(1))/(2*r^7))*(3*rSat(3) - (7*rSat(3)^3)/r^2);
aj3 = ((-5*J3*mu*rE^3*rSat(2))/(2*r^7))*(3*rSat(3) - (7*rSat(3)^3)/r^2);
ak3 = ((-5*J3*mu*rE^3)/(2*r^7))*(6*rSat(3)^2 - (7*rSat(3)^4)/r^2 - (3/5)*r^2);

ai = ai2 + ai3;
aj = aj2 + aj3;
ak = ak2 + ak3; 

aP = [ai aj ak];
end