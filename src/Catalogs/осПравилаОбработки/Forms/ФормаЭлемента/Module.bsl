//#Область ОписаниеПеременных

//&НаКлиенте
//Перем ИсходнаяОчередьПред;

//#КонецОбласти // ОписаниеПеременных


//#Область ОбработчикиСобытийФормы

//// На сервере:

//&НаСервере
//Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
//	
//	СостояниеШаблонаДействия = 2; 	
//	
//	Если ЗначениеЗаполнено(Объект.ШаблонПравилаФильтрации) Тогда 
//		СтруктураПравилаФильтрации = ПолучитьСтруктуруПравилаФильтрации(Объект.ШаблонПравилаФильтрации);	
//		
//		Объект.ТипПравилаФильтрации = СтруктураПравилаФильтрации.ТипПравила;		
//		ИдентификаторПравилаФильтрации = СтруктураПравилаФильтрации.Идентификатор;
//		
//		ЗначениеПравила = Объект.ЗначениеПравилаФильтрации; 		
//		
//		Если Объект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда 		
//			ИнициализироватьНастройкиКомпоновкиДанных(ЗначениеПравила);			
//			ЗагрузитьНастройкиКомпоновкиДанных();
//		ИначеЕсли Объект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПроизвольныйКод") Тогда	
//			ИнициализироватьНастройкиПроизвольногоКода();	
//			ЗагрузитьНастройкиПроизвольногоКода();
//		КонецЕсли;   		
//		
//		Если Объект.ИдентификаторПравилаФильтрации = ИдентификаторПравилаФильтрации Тогда 
//			СостояниеШаблонаДействия = 1;
//		Иначе
//			СостояниеШаблонаДействия = 0;
//		КонецЕсли;		
//	КонецЕсли;
//	
//	СостояниеШаблонаФильтра = 2;
//	
//	Если ЗначениеЗаполнено(Объект.ОчередьДействий) Тогда 
//		СтруктураШаблонаДействия = осСобытияСервер.ПолучитьСтруктуруШаблонаПараметровДействия(Объект.ОчередьДействий);
//		ПараметрыДействияШаблон = СтруктураШаблонаДействия.ПараметрыДействия; 		
//		ИдентификаторШаблонаДействия = СтруктураШаблонаДействия.Идентификатор;
//		
//		Если Объект.ХешШаблонаДействия = ИдентификаторШаблонаДействия Тогда 
//			СостояниеШаблонаФильтра = 1;
//		Иначе
//			СостояниеШаблонаФильтра = 0;
//		КонецЕсли;
//		
//		Если ЗначениеЗаполнено(Параметры.ЗначениеКопирования.Ссылка) Тогда
//			ПараметрыДействияЗначение = осСобытияСервер.ПолучитьПараметрыДействия(Параметры.ЗначениеКопирования.Ссылка);
//		Иначе	
//			ПараметрыДействияЗначение = осСобытияСервер.ПолучитьПараметрыДействия(Объект.Ссылка);
//		КонецЕсли;
//		
//		ЗагрузитьПараметрыДействия(ПараметрыДействияЗначение);
//	КонецЕсли;	
//	
//КонецПроцедуры

//&НаСервере
//Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
//	
//	Если ТекущийОбъект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда 
//		ТекущийОбъект.НастройкиПравилаФильтрации = Новый ХранилищеЗначения(НастройкиКомпоновкиДанных.Настройки);
//	ИначеЕсли ТекущийОбъект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПроизвольныйКод") Тогда
//		ТекущийОбъект.НастройкиПравилаФильтрации = Новый ХранилищеЗначения(НастройкиПроизвольногоКода.Выгрузить());
//	КонецЕсли;
//	
//	ТекущийОбъект.ПараметрыДействия = Новый ХранилищеЗначения(НастройкаПараметровДействия.Выгрузить());
//	
//КонецПроцедуры

//&НаСервере
//Процедура ДействиеПриИзмененииНаСервере()
//	
//	СтруктураШаблонаДействия = осСобытияСервер.ПолучитьСтруктуруШаблонаПараметровДействия(Объект.ОчередьДействий);
//	ПараметрыДействияШаблон = СтруктураШаблонаДействия.ПараметрыДействия;
//	Объект.ХешШаблонаДействия = СтруктураШаблонаДействия.Идентификатор;
//	ЗагрузитьШаблонПараметровДействия(ПараметрыДействияШаблон);
//	СостояниеШаблонаФильтра = 2;
//	
//КонецПроцедуры


//// На клиенте:

//&НаКлиенте
//Процедура ПриОткрытии(Отказ)
//	УстановитьПараметрыЭлементовПоТипуПравилаФильтрации();
//	ПравилаФильтрацииДляОчереди = ПолучитьПравилаФильтрацииДляОчереди(Объект.ОчередьСобытий);
//	Если ПравилаФильтрацииДляОчереди = Неопределено Тогда 
//		Возврат;	
//	КонецЕсли;	
//	Элементы.ПравилоФильтрации.СписокВыбора.ЗагрузитьЗначения(ПравилаФильтрацииДляОчереди);
//	Объект.ШаблонПравилаФильтрации = Объект.ШаблонПравилаФильтрации;
//КонецПроцедуры

//&НаКлиенте
//Процедура ОчередьНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
//	ИсходнаяОчередьПред = Объект.ОчередьСобытий;
//КонецПроцедуры

//&НаКлиенте
//Процедура ОчередьПриИзменении(Элемент)
//	
//	Если ПолучитьТипОчереди(Объект.ОчередьСобытий) <> ПредопределенноеЗначение("Перечисление.осТипыОчередей.РегистрацияСобытий") Тогда 
//		Сообщение = Новый СообщениеПользователю;
//		Сообщение.Текст = "Неверный тип очереди";
//		Сообщение.Поле = "Объект.ИсходнаяОчередь";
//		Сообщение.Сообщить();
//		Объект.ОчередьСобытий = ИсходнаяОчередьПред;
//		Возврат;
//	КонецЕсли;		
//	
//	ПравилаФильтрацииДляОчереди = ПолучитьПравилаФильтрацииДляОчереди(Объект.ОчередьСобытий);
//	Если ПравилаФильтрацииДляОчереди = Неопределено Тогда 
//		Возврат;	
//	КонецЕсли;
//	
//	Элементы.ПравилоФильтрации.СписокВыбора.ЗагрузитьЗначения(ПравилаФильтрацииДляОчереди);
//	
//КонецПроцедуры  

//&НаКлиенте
//Процедура ПравилоФильтрацииПриИзменении(Элемент)
//	ОбработкаИзмененияПравилаФильтрации();
//	УстановитьПараметрыЭлементовПоТипуПравилаФильтрации();	
//КонецПроцедуры  

//&НаКлиенте
//Процедура ДействиеПриИзменении(Элемент)
//	ДействиеПриИзмененииНаСервере();
//КонецПроцедуры        

//#КонецОбласти // ОбработчикиСобытийФормы


//#Область СлужебныеПроцедурыИФункции

//// На сервере без контекста:

//&НаСервереБезКонтекста
//Функция ПолучитьСтруктуруПравилаФильтрации(ШаблонПравилаСсылка)
//	
//	Результат = Новый Структура("ТипПравила,ЗначениеПравила,Идентификатор");
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//		"ВЫБРАТЬ
//		|	осШаблоныФильтров.Значение КАК ЗначениеПравила,
//		|	осШаблоныФильтров.ТипПравила КАК ТипПравила,
//		|	осШаблоныФильтров.Идентификатор КАК Идентификатор
//		|ИЗ
//		|	Справочник.осШаблоныФильтров КАК осШаблоныФильтров
//		|ГДЕ
//		|	осШаблоныФильтров.Ссылка = &Ссылка";
//	
//	Запрос.УстановитьПараметр("Ссылка", ШаблонПравилаСсылка);	
//	РезультатЗапроса = Запрос.Выполнить();
//	Если РезультатЗапроса.Пустой() Тогда 
//		Возврат Результат;
//	КонецЕсли;
//	
//	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();	
//	ВыборкаДетальныеЗаписи.Следующий();
//	
//	ЗаполнитьЗначенияСвойств(Результат, ВыборкаДетальныеЗаписи);
//	
//	Возврат Результат;
//	
//КонецФункции	

//&НаСервереБезКонтекста
//Функция ПолучитьСтруктуруШаблонаДействия(ПравилоСсылка)
//	
//	Результат = Новый Структура("ПараметрыДействия,Идентификатор");
//	
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//		"ВЫБРАТЬ
//		|	осПравилаОбработкиСобытий.ПараметрыДействия КАК ПараметрыДействия
//		|ИЗ
//		|	Справочник.осПравилаОбработкиСобытий КАК осПравилаОбработкиСобытий
//		|ГДЕ
//		|	осПравилаОбработкиСобытий.Ссылка = &ПравилоСсылка";
//	
//	Запрос.УстановитьПараметр("ПравилоСсылка", ПравилоСсылка); 	
//	РезультатЗапроса = Запрос.Выполнить();
//	
//	Если РезультатЗапроса.Пустой() Тогда 
//		Возврат Результат;
//	КонецЕсли;
//	
//	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();	
//	ВыборкаДетальныеЗаписи.Следующий();
//	
//	ЗаполнитьЗначенияСвойств(Результат, ВыборкаДетальныеЗаписи);
//	
//	Возврат Результат;
//	
//КонецФункции

//&НаСервереБезКонтекста
//Функция ПолучитьНастройкиПравилаФильтрации(ПравилоСсылка)
//	
//	Если Не ЗначениеЗаполнено(ПравилоСсылка) Тогда 
//		Возврат Неопределено;
//	КонецЕсли;	
//	
//	ОписаниеПравилаФильтрации = осСобытияСервер.ПолучитьОписаниеПравилаФильтрации(ПравилоСсылка);	
//	Возврат ОписаниеПравилаФильтрации.НастройкиПравила;
//	
//КонецФункции	

//&НаСервереБезКонтекста
//Функция ПолучитьПравилаФильтрацииДляОчереди(ОчередьСсылка)	
//	
//	Если Не ЗначениеЗаполнено(ОчередьСсылка) Тогда 
//		Возврат Неопределено;
//	КонецЕсли;
//	
//	Запрос = Новый Запрос;
//	Запрос.Текст = 
//		"ВЫБРАТЬ РАЗЛИЧНЫЕ
//		|	осПрименимостьПравилФильтрацииДляОчередейСообщений.ШаблонПравилаФильтрации КАК ПравилоФильтрации
//		|ИЗ
//		|	РегистрСведений.осПрименимостьПравилФильтрацииДляОчередейСообщений КАК осПрименимостьПравилФильтрацииДляОчередейСообщений
//		|ГДЕ
//		|	осПрименимостьПравилФильтрацииДляОчередейСообщений.Очередь = &ОчередьСсылка";
//	
//	Запрос.УстановитьПараметр("ОчередьСсылка", ОчередьСсылка); 	
//	РезультатЗапроса = Запрос.Выполнить();
//	
//	Если РезультатЗапроса.Пустой() Тогда 
//		Возврат Неопределено;
//	КонецЕсли;
//	
//	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выгрузить();
//	Возврат ВыборкаДетальныеЗаписи.ВыгрузитьКолонку("ПравилоФильтрации");
//	
//КонецФункции	

//&НаСервереБезКонтекста
//Функция ПолучитьТипОчереди(ОчередьСсылка) 	
//	Возврат	Справочники.осОчередиСообщений.ПолучитьТипОчереди(ОчередьСсылка); 		
//КонецФункции

//// На сервере:

//#Область СлужебныеПроцедурыИФункции_ПравилаФильтрации

//&НаСервере
//Процедура ОбработкаИзмененияПравилаФильтрации()	
//	
//	СтруктураПравилаФильтрации = ПолучитьСтруктуруПравилаФильтрации(Объект.ШаблонПравилаФильтрации);
//	
//	Если СтруктураПравилаФильтрации.ТипПравила = Неопределено Тогда 
//		Объект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПустаяСсылка")
//	КонецЕсли;   	
//	  	
//	ТипПравила = СтруктураПравилаФильтрации.ТипПравила;	
//	ЗначениеПравила = СтруктураПравилаФильтрации.ЗначениеПравила;
//	ИдентификаторПравилаФильтрации = СтруктураПравилаФильтрации.Идентификатор;
//	
//	Объект.ЗначениеПравилаФильтрации = ЗначениеПравила;	 		
//	СостояниеШаблонаДействия = 2;
//		
//	Объект.ИдентификаторПравилаФильтрации = ИдентификаторПравилаФильтрации;
//	Объект.ЗначениеПравилаФильтрации = ЗначениеПравила;
//	
//	Если ТипПравила = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда 		
//		ИнициализироватьНастройкиКомпоновкиДанных(ЗначениеПравила);
//	ИначеЕсли ТипПравила = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПроизвольныйКод") Тогда	
//		ИнициализироватьНастройкиПроизвольногоКода();	
//		ОпределитьНастройкиПроизвольногоКода();
//	КонецЕсли;
//	
//	Объект.ТипПравилаФильтрации = ТипПравила;
//	
//КонецПроцедуры

//&НаСервере
//Процедура ИнициализироватьНастройкиКомпоновкиДанных(ТекстМакета)
//	
//	ЧтениеXML = Новый ЧтениеXML;
//	ЧтениеXML.УстановитьСтроку(ТекстМакета);
//	СКД = СериализаторXDTO.ПрочитатьXML(ЧтениеXML, Тип("СхемаКомпоновкиДанных"));
//	
//	АдресСКД = ПоместитьВоВременноеХранилище(СКД, УникальныйИдентификатор);
//	
//	НастройкиКомпоновкиДанных.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСКД));  	
//	НастройкиКомпоновкиДанных.ЗагрузитьНастройки(СКД.НастройкиПоУмолчанию);
//	НастройкиКомпоновкиДанных.Восстановить();
//	
//КонецПроцедуры	

//&НаСервере
//Процедура ИнициализироватьНастройкиПроизвольногоКода()
//	НастройкиПроизвольногоКода.Очистить();	
//КонецПроцедуры

//&НаСервере
//Процедура ЗагрузитьНастройкиКомпоновкиДанных()
//	
//	Если ЗначениеЗаполнено(Параметры.ЗначениеКопирования.Ссылка) Тогда 
//		НастройкиКомпоновщика =	ПолучитьНастройкиПравилаФильтрации(Параметры.ЗначениеКопирования.Ссылка);
//	Иначе	
//		НастройкиКомпоновщика =	ПолучитьНастройкиПравилаФильтрации(Объект.Ссылка);
//	КонецЕсли;
//	
//	Если НастройкиКомпоновщика = Неопределено Тогда 
//		Возврат;
//	КонецЕсли;
//		
//	НастройкиКомпоновкиДанных.ЗагрузитьНастройки(НастройкиКомпоновщика);
//	НастройкиКомпоновкиДанных.Восстановить();
//	
//КонецПроцедуры

//&НаСервере
//Процедура ЗагрузитьНастройкиПроизвольногоКода()
//	
//	Если ЗначениеЗаполнено(Параметры.ЗначениеКопирования.Ссылка) Тогда
//		ТЗНастройки = ПолучитьНастройкиПравилаФильтрации(Параметры.ЗначениеКопирования.Ссылка);
//	Иначе 		
//		ТЗНастройки = ПолучитьНастройкиПравилаФильтрации(Объект.Ссылка);
//	КонецЕсли;
//	
//	Если ТЗНастройки = Неопределено Тогда 
//		Возврат;
//	КонецЕсли;
//	
//	НастройкиПроизвольногоКода.Загрузить(ТЗНастройки);  	
//	
//КонецПроцедуры

//&НаСервере
//Процедура ОпределитьНастройкиПроизвольногоКода()
//	
//	ВидСравненияПоУмолчанию = ВидСравнения.Равно;
//	ТЗ = НастройкиПроизвольногоКода.Выгрузить();
//	ТЗ.Очистить();
//	
//	СтрокаЗначения = Объект.ЗначениеПравилаФильтрации;
//	ПозицияНачалаНастроек = СтрНайти(СтрокаЗначения, "//--СЕКЦИЯ_НАСТРОЕК_НАЧАЛО");
//	Если ПозицияНачалаНастроек = 0 Тогда
//		Возврат;
//	КонецЕсли;
//	
//	ПозицияОкончанияНастроек = СтрНайти(СтрокаЗначения, "//--СЕКЦИЯ_НАСТРОЕК_КОНЕЦ");
//	Если ПозицияОкончанияНастроек = 0 Тогда
//		Возврат;
//	КонецЕсли;
//	
//	СтрокаНастроек = Сред(СтрокаЗначения,ПозицияНачалаНастроек,ПозицияОкончанияНастроек-ПозицияНачалаНастроек);
//	СтрокаНастроек = СтрЗаменить(СтрокаНастроек, "//--СЕКЦИЯ_НАСТРОЕК_НАЧАЛО", "");
//	СтрокаНастроек = СокрЛП(СтрЗаменить(СтрокаНастроек, "//", ""));	
//	МассивНастроек = СтрРазделить(СтрокаНастроек,Символы.ПС,Ложь);
//	
//	Для Каждого СтрокаНастройки Из МассивНастроек Цикл 
//		СтрокаНастройки = СокрЛП(СтрокаНастройки);
//		МассивНастройки = СтрРазделить(СтрокаНастройки,";",Ложь);
//		Если МассивНастройки.Количество() < 2 Или МассивНастройки.Количество() > 3 Тогда 
//			Возврат;
//		КонецЕсли;
//		СтрокаТЗ = ТЗ.Добавить();
//		СтрокаТЗ.ИмяПоля = СокрЛП(МассивНастройки[0]);
//		СтрокаТЗ.ВидСравнения = ВидСравненияПоУмолчанию;
//		СтрокаТЗ.Использование = Истина;
//		ОписаниеТипов = Новый ОписаниеТипов(СокрЛП(МассивНастройки[1]));
//		СтрокаТЗ.Значение = ОписаниеТипов.ПривестиЗначение(?(МассивНастройки.Количество()=3,СокрЛП(МассивНастройки[2]),Неопределено));
//	КонецЦикла;	
//	
//	НастройкиПроизвольногоКода.Загрузить(ТЗ);          
//	
//КонецПроцедуры

//&НаСервере
//Процедура ЗагрузитьШаблонПараметровДействия(ПараметрыДействияШаблон) 	
//	
//	Если ТипЗнч(ПараметрыДействияШаблон) <> Тип("ТаблицаЗначений") Тогда 
//		Возврат;
//	КонецЕсли;
//	
//	Если ПараметрыДействияШаблон.Колонки.Найти("ИмяПараметра") = Неопределено Тогда 
//		Возврат;
//	КонецЕсли;	
//	
//	Если ПараметрыДействияШаблон.Колонки.Найти("ТипЗначенияПараметра") = Неопределено Тогда 
//		Возврат;
//	КонецЕсли;
//	
//	ТЗ = НастройкаПараметровДействия.Выгрузить();
//	ТЗ.Очистить();
//	
//	Попытка
//		Для Каждого СтрокаТЗШаблон Из ПараметрыДействияШаблон Цикл 
//			СтрокаТЗ = ТЗ.Добавить();
//			СтрокаТЗ.Имя = СтрокаТЗШаблон.ИмяПараметра;
//			ОписаниеТипов = Новый ОписаниеТипов(СокрЛП(СтрокаТЗШаблон.ТипЗначенияПараметра));
//			СтрокаТЗ.Значение = ОписаниеТипов.ПривестиЗначение();
//		КонецЦикла;
//	Исключение
//		Сообщение = Новый СообщениеПользователю;
//		Сообщение.Текст = ОписаниеОшибки();
//		Сообщение.Поле = "ПараметрыДействия";
//		Сообщение.Сообщить();
//		Возврат;		
//	КонецПопытки;
//	
//	НастройкаПараметровДействия.Загрузить(ТЗ);	
//	
//КонецПроцедуры

//&НаСервере
//Процедура ЗагрузитьПараметрыДействия(ПараметрыДействияЗначение)	
//	
//	Если ТипЗнч(ПараметрыДействияЗначение) <> Тип("ТаблицаЗначений") Тогда 
//		Возврат;
//	КонецЕсли;
//	
//	НастройкаПараметровДействия.Загрузить(ПараметрыДействияЗначение);
//	
//КонецПроцедуры

//#КонецОбласти // СлужебныеПроцедурыИФункции_ПравилаФильтрации


//// На клиенте:  

//&НаКлиенте
//Процедура УстановитьПараметрыЭлементовПоТипуПравилаФильтрации()
//	
//	Если Объект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.СКД") Тогда 
//		Элементы.ГруппаТипыПравил.ТекущаяСтраница = Элементы.ГруппаТипПравилаСКД;
//	ИначеЕсли Объект.ТипПравилаФильтрации = ПредопределенноеЗначение("Перечисление.осТипыПравилФильтрации.ПроизвольныйКод") Тогда
//		Элементы.ГруппаТипыПравил.ТекущаяСтраница = Элементы.ГруппаТипПравилаПроизвольныйКод;
//	Иначе
//		Элементы.ГруппаТипыПравил.ТекущаяСтраница = Элементы.ГруппаТипПравилаПравилоНеВыбрано;	
//	КонецЕсли;
//	
//КонецПроцедуры	 
//	
//#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Ключ.Пустая() Тогда
		РежимОбработки = Перечисления.осРежимыОбработки.Фильтрация;
		Объект.ТипОбработчика = Перечисления.осТипыФильтров.ПроизвольныйКод;
	КонецЕсли;
	
	Если ТипЗнч(Объект.ТипОбработчика) = Тип("ПеречислениеСсылка.осТипыДействий") Тогда
		РежимОбработки = Перечисления.осРежимыОбработки.Действие;
	Иначе
		РежимОбработки = Перечисления.осРежимыОбработки.Фильтрация;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ВосстановитьЗначениеОбработчика();
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура РежимОбработкиПриИзменении(Элемент)
	
	Если РежимОбработки = ПредопределенноеЗначение("Перечисление.осРежимыОбработки.Действие") Тогда
		Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыДействий.ПроизвольныйКод");
	Иначе
		Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыФильтров.ПроизвольныйКод");
	КонецЕсли;
	
	ЗаполнитьПравило(Объект.ТипОбработчика);
	
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыИМЯТАБЛИЦЫ
// Код процедур и функций
#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ЗагрузитьФильтрИзШаблона(Команда)
			
	ОткрытьФорму("Справочник.осШаблоныФильтров.ФормаВыбора",
				,
				ЭтаФорма,
				,
				,
				,
				Новый ОписаниеОповещения("ОбработатьВыборФильтраИзШаблона",ЭтаФорма),
				РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры
			
&НаКлиенте
Процедура ЗагрузитьДействиеИзШаблона(Команда)
			
	ОткрытьФорму("Справочник.осШаблоныДействий.ФормаВыбора",
				,
				ЭтаФорма,
				,
				,
				,
				Новый ОписаниеОповещения("ОбработатьВыборФильтраИзШаблона",ЭтаФорма),
				РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры			
			  
&НаКлиенте
Процедура ОписатьФильтрПроизвольнымКодом(Команда)
	
	ЗаполнитьПравило(ПредопределенноеЗначение("Перечисление.осТипыФильтров.ПроизвольныйКод"));
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры			

&НаКлиенте
Процедура ОписатьФильтрНеФильтровать(Команда)
	
	ЗаполнитьПравило(ПредопределенноеЗначение("Перечисление.осТипыФильтров.НеФильтровать"));
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

&НаКлиенте
Процедура ОписатьДействиеПроизвольнымКодом(Команда)
	
	ЗаполнитьПравило(ПредопределенноеЗначение("Перечисление.осТипыДействий.ПроизвольныйКод"));
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	СохранитьЗначениеОбработчика(ТекущийОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьВидимостьДоступностьЭлементовФормы()
	
	ПодключитьОбработчикОжидания("ОбновитьОписаниеШаблона",0.1,Истина);
	
	Если РежимОбработки = ПредопределенноеЗначение("Перечисление.осРежимыОбработки.Фильтрация") Тогда
		Элементы.СтраницыВыбораТиповОбработки.ТекущаяСтраница = Элементы.СтраницаТиповФильтрации;
	Иначе
		Элементы.СтраницыВыбораТиповОбработки.ТекущаяСтраница = Элементы.СтраницаТиповДействий;
	КонецЕсли;
		
	Если Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыФильтров.ПроизвольныйКод") Тогда
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаФильтрацииПроизводнымКодом;
	ИначеЕсли Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыФильтров.СКД") Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаФильтрацииСКД;
	ИначеЕсли Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыФильтров.НеФильтровать") Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаФильтрацииНеФильтровать;
	ИначеЕсли  Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыДействий.ПроизвольныйКод") Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаДействиеПроизвольнымКодом;
	ИначеЕсли  Объект.ТипОбработчика = ПредопределенноеЗначение("Перечисление.осТипыДействий.Шаблон") Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаДействиеПредопределеннымМетодом;
	КонецЕсли;
		
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьОписаниеШаблона()
		
	ОбновитьОписаниеШаблонаНаСервере();
	Элементы.СостояниеШаблонаДействияПредопределенныйМетод.Видимость = Истина;
	Элементы.СостояниеШаблонаДействияПроизвольныйКод.Видимость = Истина;
	Элементы.СостояниеШаблонаФильтраПроизвольныйКод.Видимость = Истина;
	Элементы.СостояниеШаблонаФильтраСКД.Видимость = Истина;
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьОписаниеШаблонаНаСервере()
	
	//Запрос = Новый Запрос;
	//Запрос.Текст = "ВЫБРАТЬ
	//               |	осШаблоныФильтров.Наименование КАК Наименование
	//               |ИЗ
	//               |	Справочник.осШаблоныФильтров КАК осШаблоныФильтров
	//               |ГДЕ
	//               |	осШаблоныФильтров.Хеш = &Хеш";
	//Запрос.УстановитьПараметр("Хеш",Объект.ХешШаблонаФильтра);
	//Выборка = Запрос.Выполнить().Выбрать();
	//Если Выборка.Следующий() Тогда
	//	//СостояниеШаблонаФильтра = 1;
	//	ТекстНадписи = "Используемый шаблон: %1";
	//	НаименованиеШаблона = СтрШаблон(ТекстНадписи, Выборка.Наименование);
	//Иначе
	//	//СостояниеШаблонаФильтра = 0;
	//	НаименованиеШаблона = "Шаблон не используется или был изменен";
	//КонецЕсли;
	
КонецПроцедуры

&НаКлиенте 
Процедура ОбработатьВыборФильтраИзШаблона(РезультатЗакрытия, ДопПараметры) Экспорт
	
	Если Не ЗначениеЗаполнено(РезультатЗакрытия) Тогда
		Возврат;
	КонецЕсли;
	
	ОбработатьВыборФильтраИзШаблонаНаСервере(РезультатЗакрытия);
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

&НаСервере
Процедура ОбработатьВыборФильтраИзШаблонаНаСервере(РезультатЗакрытия)
	
	ОписаниеФильтра = осОчередиСообщенийСервер.ПолучитьОписаниеФильтраПоСсылке(РезультатЗакрытия);
	ЗаполнитьПравило(ОписаниеФильтра);
		
КонецПроцедуры

&НаКлиенте 
Процедура ОбработатьВыборДействияИзШаблона(РезультатЗакрытия, ДопПараметры) Экспорт
	
	Если Не ЗначениеЗаполнено(РезультатЗакрытия) Тогда
		Возврат;
	КонецЕсли;
	
	ОбработатьВыборДействияИзШаблонаНаСервере(РезультатЗакрытия);
	ОбновитьВидимостьДоступностьЭлементовФормы();
	
КонецПроцедуры

&НаСервере
Процедура ОбработатьВыборДействияИзШаблонаНаСервере(РезультатЗакрытия)
	
	ОписаниеФильтра = осОчередиСообщенийСервер.ПолучитьОписаниеДействияПоСсылке(РезультатЗакрытия);
	ЗаполнитьПравило(ОписаниеФильтра);
		
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьПравило(ТипОбработчика)
	
 	Объект.ТипОбработчика = ТипОбработчика;
	Объект.ХешОбработчика = "";
	
	Если ТипОбработчика = Перечисления.осТипыФильтров.ПроизвольныйКод Тогда
		ПроизвольныйКод = осОчередиСообщенийСервер.ТекстНовогоПроизвольногоКодаФильтра();
	ИначеЕсли ТипОбработчика = Перечисления.осТипыФильтров.СКД Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаФильтрацииСКД;
	ИначеЕсли ТипОбработчика = Перечисления.осТипыФильтров.НеФильтровать Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаФильтрацииНеФильтровать;
	ИначеЕсли ТипОбработчика = Перечисления.осТипыДействий.ПроизвольныйКод Тогда 
		ПроизвольныйКод = осОчередиСообщенийСервер.ТекстНовогоПроизвольногоКодаДействия();
	ИначеЕсли ТипОбработчика = Перечисления.осТипыДействий.Шаблон Тогда 
		Элементы.СтраницыОбработчика.ТекущаяСтраница = Элементы.СтраницаДействиеПредопределеннымМетодом;
	КонецЕсли;
		
КонецПроцедуры

//&НаСервере
//Процедура ЗаполнитьАлгоритмОтбора(текСхемаКомпоновкиДанных)
//	
//	Если текСхемаКомпоновкиДанных = Неопределено Тогда 
//		
//		ПустаяСхемаКомпоновкиДанных = Новый СхемаКомпоновкиДанных;
//		
//		АдресСхемыКомпоновкиДанных = ПоместитьВоВременноеХранилище(ПустаяСхемаКомпоновкиДанных, УникальныйИдентификатор);
//		КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемыКомпоновкиДанных));
//		КомпоновщикНастроек.ЗагрузитьНастройки(ПустаяСхемаКомпоновкиДанных.НастройкиПоУмолчанию);
//		
//		АдресСхемыКомпоновкиДанных = Неопределено;
//				
//		Возврат;
//	КонецЕсли;
//				
//	АдресСхемыКомпоновкиДанных = ПоместитьВоВременноеХранилище(текСхемаКомпоновкиДанных, УникальныйИдентификатор);
//	
//	КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемыКомпоновкиДанных));
//	КомпоновщикНастроек.ЗагрузитьНастройки(текСхемаКомпоновкиДанных.НастройкиПоУмолчанию);
//	КомпоновщикНастроек.Восстановить();
//		
//КонецПроцедуры

//&НаСервере
//Процедура СохранитьАлгоритмОтбора(ТекущийОбъект)
//	
//	КомпоновщикНастроек.Восстановить();
//	
//	Если ЗначениеЗаполнено(АдресСхемыКомпоновкиДанных) Тогда 
//		СхемаКомпоновкиДанных = ПолучитьИзВременногоХранилища(АдресСхемыКомпоновкиДанных);
//		
//		усУправлениеСкладомСервер.ОчиститьНастройкиКомпоновкиДанных(СхемаКомпоновкиДанных.НастройкиПоУмолчанию);
//		усУправлениеСкладомСервер.СкопироватьНастройкиКомпоновкиДанных(СхемаКомпоновкиДанных.НастройкиПоУмолчанию, КомпоновщикНастроек.ПолучитьНастройки());
//	Иначе
//		ТекущийОбъект.СхемаКомпоновкиДанных = Новый ХранилищеЗначения(СхемаКомпоновкиДанных);
//		Возврат;
//	КонецЕсли;

//	ТекущийОбъект.АлгоритмОтбора = Новый ХранилищеЗначения(СхемаКомпоновкиДанных);
//	
//КонецПроцедуры

//&НаСервере
//Процедура ВосстановитьЗначенияАлгоритмаОтбора();
//	
//	//#TODO Технический рефакторинг по получению ссылок - оптимизация
//	СхемаКомпоновкиДанных = Объект.Ссылка.АлгоритмОтбора.Получить();
//	АдресСхемыКомпоновкиДанных = ПоместитьВоВременноеХранилище(СхемаКомпоновкиДанных, УникальныйИдентификатор);
//		
//	Если СхемаКомпоновкиДанных <> Неопределено Тогда 
//		КомпоновщикНастроек.Инициализировать(Новый ИсточникДоступныхНастроекКомпоновкиДанных(АдресСхемыКомпоновкиДанных));
//		КомпоновщикНастроек.ЗагрузитьНастройки(СхемаКомпоновкиДанных.НастройкиПоУмолчанию);
//		КомпоновщикНастроек.Восстановить();
//	КонецЕсли;
//	
//КонецПроцедуры
&НаСервере
Процедура СохранитьЗначениеОбработчика(ТекущийОбъект)
	  
	 Обработчик = осОчередиСообщенийСервер.ПолучитьОписаниеОбработчика();
	 ЗаполнитьЗначенияСвойств(Обработчик,ЭтаФорма); 
	 
	 Обработчик.НастройкаПараметровДействия = НастройкаПараметровДействия.Выгрузить();
	 Обработчик.НастройкиКомпоновкиДанных = Неопределено;
	 Обработчик.ПроизвольныйКод = ПроизвольныйКод;
		 	 
	 ТекущийОбъект.Обработчик = Новый ХранилищеЗначения(Обработчик);
		
КонецПроцедуры

&НаСервере
Процедура ВосстановитьЗначениеОбработчика()
		
	ХранилищеОбработчика = Объект.Ссылка.Обработчик;
	Обработчик = ХранилищеОбработчика.Получить();
	
	Если Обработчик = Неопределено Тогда
	 Возврат;
 	КонецЕсли;
 
 	//Обработчик.НастройкаПараметровДействия = НастройкаПараметровДействия.Выгрузить();
	//Обработчик.НастройкиКомпоновкиДанных = Неопределено;
	ПроизвольныйКод = Обработчик.ПроизвольныйКод;
		
КонецПроцедуры

#КонецОбласти







