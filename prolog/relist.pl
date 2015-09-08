relist([],[]).
relist(List,ReverseList) :- List = [Head|Tail],
         relist(Tail, ReverseTail),
         append(ReverseTail,[Head],ReverseList).
