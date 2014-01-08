-module(xmerl_ex).
-include_lib("xmerl/include/xmerl.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([]).

%% ====================================================================
%% Internal functions
%% ====================================================================

%% shell rr(xmerl) aby zaimportować rekordy w shellu
%nowy rekord

Pika = {pokemon,[{nazwa,"Pikachu"},{typ,"elektryczny"},{generacja,"I"}],
[{zycie,["60"]},
{atak,["10"]},
{podatnosc,[{typ,"ogień"}],["x2"]},
{ewolucja,["jajko"]}]}

%nowy rekord z formatowaniem

PikaFormat = [#xmlText{value="\n"},
{pokemon,[{nazwa,"Pikachu"},{typ,"elektryczny"},{generacja,"I"}],
[#xmlText{value="\n"},
{zycie,["60"]},
#xmlText{value="\n"},
{atak,["10"]},
#xmlText{value="\n"},
{podatnosc,[{typ,"ogień"}],["x2"]},
#xmlText{value="\n"},
{ewolucja,["jajko"]},
#xmlText{value="\n"}]},
#xmlText{value="\n"}].

%otwieranie pliku
{File,Misc} = xmerl_scan:file("pokemony.xml",[{validation,true}]).

%zapisywanie pliku
XMLFile = xmerl:export_simple(PikaFormat, _).
XMLUNI = unicode:characters_to_binary(lists:flatten(XMLFILE)).
{ok,FH} = file:open("new_pokemony.xml",[write]).
io:format(FH,"~s~n",[XMLUNI])

%przeszukiwanie XPathem
Result = xmerl_xpath:string("/pokemony//*[@typ]", File).

%dodawanie do wyszukanego node'u
#xmlElement{content=C} = File.
NewC = C++[PikaFormat].
NewFile=File#xmlElement{content=NewC}.
%teraz wystarczy zapisać, to samo można oczywiście uzyskac XPathem





