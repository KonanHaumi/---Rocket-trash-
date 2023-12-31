--------оформление-------

--какать тут--
 

-------------------------
global {
    humanHP = 100;
    rocketHP = 100;
	cycle = 0;
}

stat { -- stat -- объект "статус"
	nam = 'статус';
	disp = function(s)
		pn ('Космонавты: ', humanHP)
		pn ('Ракета: ', rocketHP)
		pn ('Цикл: ', cycle)
	end
};

function init()
	take 'статус'
end


room {
	nam = "start10";
	disp = "Отладочная страница";
	dsc = 'Начало блока ПРОЦЕСС ПОЛЕТА / отладка';
	enter = function(s)
			lifeon(s);
	end;
	exit = function(s)
			lifeoff(s);
	end;
	life = function(s)
			if rnd(10) > 1 then
					p [[Я слышу какие-то шорохи!]]; -- изредка пугать игрока шорохами
			end
	end;
	way = {
		"Полет",
		"проснулся",
		"спать",
		"сновидение",
		"долгий_сон",
		"обслуживание_ракеты",
		"научная_деятельность",
		"аграрная_деятельноть",
		"GAMEOVER"
	}; -- навание кнопки, путь
}

room {
	nam = "Полет";
	disp = "Летим?";
	dsc = [[ Ты просыпаешься в уютной криокапсуле, ощущая себя совершенно одиноким на этом огромном корабле. ^
	Маячит странное желание разбудить красивую девушку в соседней капсуле...^^

	Ты слышишь легкий шум вентиляции и видишь перед собой монитор с множеством мигающих индикаторов, напоминающих сцену из космической оперы. ^
	Над монитором висит маленький плакат с надписью: "Не обосраться - ваша главная цель!"]];
	way = {path {'Начнем', "проснулся"}}; -- навание кнопки, путь
}

room {
	nam = "проснулся";
	dsc = [[Из динамика в углу раздается громкое: "Эй, ты наконец-то проснулся. Ты же пытался улететь на другую планету, да? Пора на работу!" ^^

	Опять работать((]];
	enter = function(s)
		if cycle >= 9 then --------------------- кол-во циклов до выхода из блока полета
			walk('WIN', false, false)
			return
		end
		cycle = cycle + 1;
	end;
	way = {path {'На работу', "выбор_работы"}}; -- навание кнопки, путь
}

room { 
	nam = 'выбор_работы';
	disp = "Выбор работы";
	dsc = [[ Пора выбрать чем ты сегодня займешься ^^
	От твоей работы зависит успешность вашей миссии.^^

	Хотя тебя одолевают сомнения....^
	С одной стороны, нужно пойти поработать, но с другой, ведь можно пойти и дальше спать?]];

	way = {
		path {'Обслуживание систем ракеты', 'обслуживание_ракеты' },
		path { 'Научная деятельность', 'научная_деятельность' },
		path { 'Космо-аграрная деятельность', 'аграрная_деятельноть' },
		path { 'Пойти спать дальше', 'проспать работу' },
	}
}

room {
	nam = "проспать работу";
	disp = "...";
	dsc = [[Возможно поспать еще цикл не так уж и плохо. ^^
	Работа не волк...^
	      ...волк это ходить.]];
	enter = function(s)
		humanHP = humanHP - 5;
		rocketHP = rocketHP - 5;
		p [[Хоть вы и выспитесь. Но кто будет выполнять вашу работу?]];
		walk('спать', false, false)
	end
}

room {
	nam = "спать";
	disp = "В комнате с криокамерами";
	dsc = 'С чувством выполненного долга вы возвращаетесь в криокамеру.';
	way = {
		path {'Спать до следующего цикла', "сновидение"},
		path {'Спать до начала посадки', "долгий_сон"},
	}; -- навание кнопки, путь
}

room {
	nam = "обслуживание_ракеты";
	disp = "Обслуживание систем ракеты";
	dsc = [[Ты проводишь проверку показателей ракеты, убеждаясь, что каждая система находится в идеальном рабочем состоянии. ^
	Твоя решительность и профессионализм наполняют кабину уверенностью, что миссия будет выполнена успешно.]];
	way = {path {'Пора спать', "спать"}}; -- навание кнопки, путь
}

room {
	nam = "научная_деятельность";
	disp = "Научная деятельность";
	dsc = [[Ты пришел на работу в свою лабораторию^^
	Лаборатория представляет собой просторное помещение, оснащенное современным оборудованием и приборами для проведения научных исследований. Стены лаборатории покрыты мониторами и экранами, на которых отображается информация о текущих экспериментах и результаты предыдущих исследований.^
	В самом центре лаборатории находится большая круглая столешница из нержавеющей стали, на которой расположены различные приборы и образцы для анализа. Вокруг стола стоят высокие стеллажи, на полках которых размещены книги, журналы и другие научные издания. Рядом с каждым стеллажом находятся маленькие рабочие столы с компьютерами и лабораторными принадлежностями.^^
	Освещение в лаборатории обеспечивается яркими светодиодными лампами, что создает комфортную и рабочую атмосферу. На стенах висят фотографии космических объектов и миссий, которые служат вдохновением для космонавта в его научной деятельности.^
	Ты чувствуешь атмосферу научного исследования, наполненного возможностями и открытиями. Ты готов погрузиться в работу и внести свой вклад в развитие науки и космических исследований.]];
	way = {path {'Пора спать', "спать"}}; -- навание кнопки, путь
}

room {
	nam = "аграрная_деятельноть";
	disp = "Космо-аграрная деятельность";
	dsc = [[Аграрная деятельность на космическом корабле представляет собой фантастический опыт. В роли космонавта, я вовлечен в выращивание растений и производство пищевых продуктов в невесомости космического пространства. Это невероятное путешествие, где я становлюсь садовником в космосе.^
	Каждый день, подобно земному фермеру, я заботлюсь о моих растениях. Наблюдая, как они растут и процветают в искусственной среде, я испытываю огромное удовлетворение. Мои растения получают необходимые питательные вещества из специально разработанных растворов без почвы.^
	Весь процесс аграрной деятельности на космическом корабле требует моей постоянной заботы. Я контролирую освещение, влажность и температуру, чтобы создать оптимальные условия для роста растений. Каждый день я проверяю состояние растений, подкармливаю их и удаляю любые больные или поврежденные части.]];
	way = {path {'Пора спать', "спать"}}; -- навание кнопки, путь
}


room {
	nam = 'сон';
	dsc = [[Тебе снится сон...^^
	... о чём же этот сон?...]];
	way = {path {'Проснуться', "проснулся"}};
}:with {
	obj {
		nam = 'Мокрое постельное белье';
		dsc = [[Незнакомый коридор... ^^
		...Вдалеке темноты ты видишь странную комнату, хорек ^^
		...хорек зазывает тебя поговорить с ним... ^^
		он... она? Предлагает устроиться на работу прогать на прологе.^^
		Отвратительный сон, пора {проснуться!}]];
		tak = 'Вы проснулись в поту от пережитого кошмара, нафиг такие сны';
		act = function(s)
			take(s)	
		end
	};
}

room {
	nam = "сновидение";
	disp = "Сон";
	dsc = [[Тебе снится сон...^^
	...]];
	way = {
		path {'Проснуться', "проснулся"}}; -- навание кнопки, путь
}:with {
	obj {
		--nam = 'абобки';
		nam = 'abobki';
		
		{ -- не сохранять массив lf
			lf = {
				[1] = [[Незнакомый коридор... ^^
				...Вдалеке темноты ты видишь странную комнату, хорек ^^
				...хорек зазывает тебя поговорить с ним... ^^
				он... она? Предлагает устроиться на работу прогать на прологе.^^
				Вы неожиданно проснулись.]],
				[2] = [[описание сна 2^^
				Вы проснулись]],
				[3] = [[описание сна 3^^
				Вы проснулись]],
				[4] = [[описание сна 4^^
				Вы проснулись]],
				[5] = [[описание сна 5^^
				Вы проснулись]],
				[6] = [[описание сна 6^^
				Вы проснулись]],
			};
		};
		act = function(s)
			local r = rnd(5);
			r = rnd(1,#s.lf); -- символ # -- число элементов в массиве
			p(s.lf[r]); -- выводим одно из 6 состояний Барсика
			--p [[qweqweqwe]]
			walk('проснулся', false, false) 
		end;
		dsc = "... о чём же этот {сон}?...";
	};
	
}

room {
	nam = "долгий_сон";
	disp = "Долгий сон";
	dsc = 'Вы решили забить на свои обязанности и проспать до самого начала посадки.';
	enter = function(s)
		local r = rnd(20);
		if r > 19 then
			p [[Какой-то дебил прикрутил сюда бросок кубика d20. Выпало: ]]
			p (r)
			p[[^^]]
			p [[Вам повезло и ваш безрассудный поступок не навредил ни экипажу, ни ракете (СЮДА ПЕРЕХОД НА СЛЕДУЮЩИЙ БЛОК)]]; 
			walk('проснулся', false, false) ------------- (СЮДА ПЕРЕХОД НА СЛЕДУЮЩИЙ БЛОК)
		elseif r <= 19 and r > 5 then
			p [[Какой-то дебил прикрутил сюда бросок кубика d20. Выпало: ]]
			p (r)
			p[[^^]]
			p [[Не сказать, что вам повезло, но вы хотяб проснулись после такого.^^
			Ваши коллеги не справились со своими задачами, и разбудили тебя ^^
			Показатели экипажа и ракеты значительно упали. ]]; 
			
			humanHP = humanHP - 50;
			rocketHP = rocketHP - 50;
			cycle = cycle + 5;
			walk('проснулся', false, false) ------------- СЮДА ПЕРЕХОД НА СЛЕДУЮЩИЙ БЛОК!
		else
			p [[Какой-то дебил прикрутил сюда бросок кубика d20. Выпало: ]]
			p (r)
			p[[^^]]
			walk('GAMEOVER', false, false) 
		end
	end;
}

room {
	nam = "GAMEOVER";
	disp = "Вы проиграли";
	dsc = [[Какие-то из ваших решений привели с глобальному обсёру^^
	Congratulations!]];
	pic = '10-img/game_over.gif';
}

room {
	nam = "WIN";
	disp = "Ура, победа!";
	dsc = [[Вы смогли продержаться на протяжении этого долгого полета^
	Впереди тебя ждет процесс посадки, удачи!^^
	Congratulations!]];
	pic = '10-img/game_over.gif';
}