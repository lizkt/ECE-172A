%%
A=[2 59 2 5;41 11 0 4;18 2 3 9;6 23 27 10;5 8 5 1]
B=[0 1 0 1;0 1 1 1;0 0 0 1;1 1 0 1;0 1 0 0]
C=A.*B
inner=dot(C(2,:),C(5,:))

min_value=min(C(:))
max_value=max(C(:))

[row,col]=find(C==min_value)
[row,col]=find(C==max_value)


D=bsxfun(@minus,C,C(1,:))

E=bsxfun(@minus,D,D(1,:))

