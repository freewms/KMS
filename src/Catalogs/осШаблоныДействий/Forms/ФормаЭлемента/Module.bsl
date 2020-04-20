
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Ключ.Пустая() Тогда
		Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыДействий.Пользовательский");		
	КонецЕсли;
	
	Если Объект.Тип = ПредопределенноеЗначение("Перечисление.осТипыДействий.Предопределенный") Тогда
		ЭтаФорма.ТолькоПросмотр = Истина;
		
		ОбъектЗначение = РеквизитФормыВЗначение("Объект");
		ПараметрыМетода = ОбъектЗначение.ОписаниеПараметров.Получить();
		Если ТипЗнч(ПараметрыМетода) = Тип("ТаблицаЗначений") Тогда
			ТаблицаПараметров.Загрузить(ПараметрыМетода);
			Элементы.ГруппаСтраницы.ТекущаяСтраница = Элементы.СтраницаПараметры;
		Иначе
			Элементы.ДекорациОписаниеПричиныОтсутствияПараметров.Заголовок = "
																			 |Не определены";
		КонецЕсли;
	Иначе
		Элементы.ДекорациОписаниеПричиныОтсутствияПараметров.Заголовок = "
																		 |Использование возможно только для предопределенных методов";
	КонецЕсли;
	
КонецПроцедуры

