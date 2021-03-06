Процедура ОбработкаПолученияФормы(ВидФормы, Параметры, ВыбраннаяФорма,
		ДополнительнаяИнформация, СтандартнаяОбработка)

	НадоОпределитьПараметрСостав = Ложь;

	Если (ВидФормы = "ФормаОбъекта"
			И Параметры.Свойство("ЗначенияЗаполнения") = Истина
			И Параметры.ЗначенияЗаполнения.Свойство("Номенклатура")) Тогда
		НадоОпределитьПараметрСостав = Истина;

	КонецЕсли;

	Если (НадоОпределитьПараметрСостав = Истина) Тогда
		Параметры.ЗначенияЗаполнения.Вставить("Состав", Новый ТаблицаЗначений());
		Параметры.ЗначенияЗаполнения.Состав.Колонки.Добавить("Номенклатура");

		Для Каждого Номенклатура Из Параметры.ЗначенияЗаполнения.Номенклатура Цикл
			ДанныеСостава = Параметры.ЗначенияЗаполнения.Состав.Добавить();
			ДанныеСостава.Номенклатура = Номенклатура;
		КонецЦикла;

		Параметры.ЗначенияЗаполнения.Удалить("Номенклатура");
	КонецЕсли;

	Если (ВидФормы = "ФормаОбъекта"
			И Параметры.Свойство("ЗначенияЗаполнения") = Истина
			И Параметры.ЗначенияЗаполнения.Свойство("Состав")
			И Параметры.ЗначенияЗаполнения.Состав = Неопределено) Тогда
		
		Параметры.ЗначенияЗаполнения.Состав = ДанныеОбластиНоменклатура(Параметры.ЗначенияЗаполнения.Клиент)
		
	КонецЕсли;

КонецПроцедуры

Функция ДанныеОбластиНоменклатура(Клиент)

	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
		|	СтрокаВыбора.Номенклатура,
		|	СтрокаВыбора.Количество
		|ИЗ
		|	РегистрСведений.СтрокаВыбора КАК СтрокаВыбора
		|ГДЕ
		|	СтрокаВыбора.Клиент = &Клиент";

	Запрос.УстановитьПараметр("Клиент", Клиент);

	Возврат Запрос.Выполнить().Выгрузить();

КонецФункции
