&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
Если (РольДоступна("МенеджерПоПродажам") = Ложь) Тогда
	Список.ПроизвольныйЗапрос = Ложь;
	Элементы.Выбрано.Видимость = Ложь;
КонецЕсли;

КонецПроцедуры

&НаКлиенте
Процедура СписокНачалоПеретаскивания(Элемент, ПараметрыПеретаскивания,
		Выполнение)
	ПараметрыПеретаскивания.Значение = Новый Структура("Номенклатура, Клиент"
	, ПараметрыПеретаскивания.Значение, ТекущийКлиент);
КонецПроцедуры



&НаКлиенте
Процедура СписокВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	Если (Поле.Имя = "Выбрано") Тогда
		СтандартнаяОбработка = Ложь;
		ПоказатьВводЧисла(Новый ОписаниеОповещения("ИзменитьКоличество"
		, ЭтотОбъект, Новый Структура("Номенклатура", Элементы.Список.ТекущаяСтрока)), , , 10, 3);
	КонецЕсли;
	
	Элементы.Список.Обновить();

КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	Если (ИмяСобытия = "ВыбранКлиент") Тогда
		ТекущийКлиент = Параметр;
		Список.Параметры.УстановитьЗначениеПараметра("ВыбранныйКлиент", ТекущийКлиент);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ИзменитьКоличество(Количество, ДополнительныеПараметры) Экспорт
	Если (Количество = Неопределено) Тогда
		Возврат;
	КонецЕсли;
	ИзменитьВыбранноеКоличество(ДополнительныеПараметры.Номенклатура, ТекущийКлиент, Количество);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ИзменитьВыбранноеКоличество(Знач Номенклатура, Знач Клиент, Знач Количество)
	РегистрыСведений.СтрокаВыбора.Изменить(Номенклатура, Клиент, Количество);
КонецПроцедуры


