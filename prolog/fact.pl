fact(X,1) :- X=1.
fact(X,F) :- X>1, X1 is X-1, fact(X1,F1), F is X * F1.
