cuse([],Visited,Colors,V):- member(V,Colors).

cuse([P1|Rest], Visited,Colors,V):-
	member(V, Colors),
	not(member(P1/V,Visited)),
	cuse(Rest,Visited,Colors,V). 

% This would color Jamaica 
%color_area([['Hanover', 'Westmoreland','St. James'],['Westmoreland', 'Hanover','St. James','St. Elizabeth'],['St. James', 'Hanover','Westmoreland','St. Elizabeth','Trelawny'],['St. Elizabeth', 'Westmoreland','St. James','Trelawny','Manchester'],['Trelawny', 'St. James','St. Elizabeth','Manchester','St. Ann','Clarendon'],['Manchester', 'St. Elizabeth','Trelawny','St. Ann','Clarendon'],['St. Ann', 'Trelawny','Manchester','Clarendon','St. Catherine','St. Mary'],['Clarendon', 'Trelawny','Manchester','St. Ann','St. Catherine'],['St. Catherine', 'St. Ann','Clarendon','St. Mary','St. Andrew'],['St. Mary', 'St. Ann','St. Catherine','Portland','St. Andrew'],['St. Andrew', 'St. Catherine','St. Mary','Kingston','Portland','St. Thomas'],['Kingston', 'St. Andrew'],['Portland', 'St. Mary','St. Thomas','St. Andrew'],['St. Thomas', 'St. Andrew','Portland']],[blue,red,green,purple],[]).

% This would color Jamaica with an extra parish named 'The best Parish'
%color_area([['Hanover', 'Westmoreland','St. James'],['The best Parish','Trelawny','St. Ann','St. Mary'],['Westmoreland', 'Hanover','St. James','St. Elizabeth'],['St. James', 'Hanover','Westmoreland','St. Elizabeth','Trelawny'],['St. Elizabeth', 'Westmoreland','St. James','Trelawny','Manchester'],['Trelawny', 'St. James','St. Elizabeth','Manchester','St. Ann','Clarendon','The best Parish'],['Manchester', 'St. Elizabeth','Trelawny','St. Ann','Clarendon'],['St. Ann', 'Trelawny','Manchester','Clarendon','St. Catherine','St. Mary','The best Parish'],['Clarendon', 'Trelawny','Manchester','St. Ann','St. Catherine'],['St. Catherine', 'St. Ann','Clarendon','St. Mary','St. Andrew'],['St. Mary', 'St. Ann','St. Catherine','Portland','St. Andrew','The best Parish'],['St. Andrew', 'St. Catherine','St. Mary','Kingston','Portland','St. Thomas'],['Kingston', 'St. Andrew'],['Portland', 'St. Mary','St. Thomas','St. Andrew'],['St. Thomas', 'St. Andrew','Portland']],[blue,red,green,purple],[]).

% This would color Cuba
%color_area([['Pinar del Rio', 'La Habana'], ['La Habana', 'Pinar del Rio', 'Mantanzas'], ['Mantanzas', 'La Habana', 'Cienfuegos', 'Villa Clara'], ['Cienfuegos', 'Mantanzas', 'Villa Clara', 'Sancti Spiritus'], ['Villa Clara', 'Mantanzas', 'Cienfuegos', 'Sancti Spiritus'], ['Sancti Spiritus', 'Villa Clara', 'Cienfuegos', 'Ciego de Avila'], ['Ciego de Avila', 'Sancti Spiritus', 'Camaguey'], ['Camaguey', 'Ciego de Avila', 'Las Tunas'], ['Las Tunas', 'Camaguey', 'Holguin', 'Granma'], ['Granma', 'Las Tunas', 'Holguin', 'Santiago de Cuba'], ['Holguin', 'Las Tunas', 'Granma', 'Santiago de Cuba', 'Guantanamo'], ['Santiago de Cuba', 'Holguin', 'Granma', 'Guantanamo'], ['Guantanamo', 'Holguin', 'Santiago'], ['Isla de Juventud']], [blue, red, green], []).

color_area([],Colors,Visited).

color_area([[AreaHead|AdjacentAreas]|Rest],Colors,Visited):-
	cuse(AdjacentAreas,Visited,Colors,Color),!,
	write(AreaHead),
	write("-"),
	write_ln(Color),  % assign a color to parish at the front of list
	append(Visited,[AreaHead/Color],Correct),
	color_area(Rest,Colors,Correct). 

