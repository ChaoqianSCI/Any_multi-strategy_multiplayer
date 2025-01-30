function [value,isterminal,direction] = events1(t,y)
global dx;
value = sum(abs(dx(:)))-0.0001;
isterminal= 1;
direction = 0;
end