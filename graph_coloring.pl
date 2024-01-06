%Question 7
edge(a,b).
edge(a,c).
edge(a,d).
edge(a,e).
edge(a,f).

edge(b,a).
edge(b,c).
edge(b,e).

edge(c,a).
edge(c,b).
edge(c,d).
edge(c,e).

edge(d,a).
edge(d,c).
edge(d,e).
edge(d,f).

edge(e,a).
edge(e,b).
edge(e,c).
edge(e,d).
edge(e,f).


edge(f,a).
edge(f,d).
edge(f,e).

vertex(a).
vertex(b).
vertex(c).
vertex(d).
vertex(e).
vertex(f).

color(red).
color(blue).
color(green).
color(yellow).

color_map(L) :- color([], L).

color(Map, L) :- 
    vertex(Vertex),                         
    \+ member([Vertex, _], Map),            
    color(Color),                          
    maplist(validColor(Vertex, Color), Map),
    append(Map, [[Vertex, Color]], Map2),   
    color(Map2, L).                         

color(Map, L) :-  
    findall(_, vertex(_), TargetMap),
    length(TargetMap, NumberOfVertices),
    length(Map, NumberOfVerticesColored),
    NumberOfVertices = NumberOfVerticesColored,
    L = Map.

validColor(X, _, [Y, _]) :- \+ edge(X, Y).
validColor(_, C1, [_, C2]) :- C1 \= C2.