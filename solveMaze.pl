%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% @irstavr
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Given a complex maze, we want to be able to
% find a path between two points and calculate
% this distance.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the Knowledge base
% Give a large maze

% Edges of the graph:
edge(1,2).
edge(3,4).
edge(5,6).
edge(7,8).
edge(9,10).
edge(12,13).
edge(13,14).
edge(15,16).
edge(17,18).
edge(19,20).
edge(4,1).
edge(6,3).
edge(4,7).
edge(6,11).
edge(14,9).
edge(11,15).
edge(16,12).
edge(14,17).
edge(16,19).

% Predicates 

% Find the path from X to Y:
% Get from point X to point Y by chaining 
% together an arbitrary num of 'edge' relations
path(X, Y) :-
	( edge(X,Y) ; edge(Y,X) ),
	X \= Y .
path(X, Y) :- 
	edge(X, Z),	
	path(Z, Y),
	X \= Y.

% Compute the distance between the edges of two points
% Same as 'path' rule, but stores distance in D variable
distance(X, Y , 1) :-
	edge(X, Y).
distance(X, Y, D) :- 
	edge(X, Z), 
	distance(Z, Y, T), 
	D is T + 1.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Print output rules
% Just for testing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This is a loop that prints all mothers.
print_paths :-
		nl, nl, tab(10),
        write(' PATHS LIST'),
        nl, tab(10),  
        write('==================='),
        nl, nl, 
        print_all_paths.

print_all_paths :-
        path(X,Y),
        write(X),
		write(' is connected with '),
		write(Y),
        nl, fail.
print_all_paths.


% This is a loop that prints all mothers.
print_distances:-
		nl, nl, tab(10),
        write(' DISTANCE PATHS LIST'),
        nl, tab(10),  
        write('==================='),
        nl, nl, 
        print_all_distances.

print_all_distances :-
        distance(X,Y,D),
        write(X),
		write(' to '),
		write(Y),
		write(' has distance: '),
		write(D),
        nl, fail.
print_all_distances.
