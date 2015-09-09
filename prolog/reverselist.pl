reverselist([],[]).
reverselist(List,ReverseList) :- List = [Head|Tail],
         reverselist(Tail, ReverseTail),
         append(ReverseTail,[Head],ReverseList).
