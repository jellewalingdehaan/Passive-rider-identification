function [y, t12] = my_xcov_function_IMU(u1,u2)

%u3          = cell2mat(u2);
[~, col]    = size(u2);
t12         = NaN(1,col);
y           = cell(1,col);

for i = 1:col
    [C12, lag]  = xcov(u1,u2(:,i));
    [~,I1]      = max(abs(C12));
    t12(:,i)    = lag(I1);
end

delay = abs(t12);

for i = 1:col
    sub = u2(:,i);
    sub_aligned = sub(delay(:,i):end);
    y{i} = sub_aligned;
end



