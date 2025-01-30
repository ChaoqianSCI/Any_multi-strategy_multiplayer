function [value,isterminal,direction] = events2(t,y)
global dx;
value = sum(abs(dx(:)))-0.0000001;
isterminal= 1;
direction = 0;
end