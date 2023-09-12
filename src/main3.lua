-- $Name: Самая интересная игра!$
-- $Version: 0.5$
-- $Author: Анонимный любитель текстовых приключений$
-- $Info: Это ремейк старой игры\nС ZX specturm$

require "fmt" -- некоторые функции форматирования
fmt.para = true -- включить режим параграфов (отступы)

game.act = 'Не работает.';
game.use = 'Это не поможет.';
game.inv = 'Зачем мне это?';



room {
	nam = 'main';
	disp = "Начало игры";
	dsc = [[тут что-то про начало игры]];
	way = {path {'Начать', "start10"} };
}

--include "launchpad"
--include "ship"
--include "flight"
--include "landing"
include "flightProcess-10"


