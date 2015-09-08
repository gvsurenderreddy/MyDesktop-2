sortlist([],[]).
sortlist(List,SortedList) :- List = [Head|Tail],
    sortlist(Tail,SortedTail),
    mergelist(Head,SortedTail,SortedList).

mergelist(E,[],[E]).
mergelist(E1,SortedTail,MergedList) :- SortedTail = [E2|Tail],
    (E1 < E2 ->
        append([E1],SortedTail,MergedList);
        mergelist(E1,Tail,MergedTail),
        append([E2],MergedTail,MergedList)
    ).
