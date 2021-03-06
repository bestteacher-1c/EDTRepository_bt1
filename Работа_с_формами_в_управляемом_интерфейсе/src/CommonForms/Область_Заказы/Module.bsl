&НаКлиенте
Процедура СписокПеретаскивание(Элемент, ПараметрыПеретаскивания,
		СтандартнаяОбработка, Строка, Поле)

	ПараметрыФормы = Новый Структура("ЗначенияЗаполнения", 
	ПараметрыПеретаскивания.Значение);

	ОткрытьФорму("Документ.ЗаказКлиента.ФормаОбъекта", ПараметрыФормы,,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);

КонецПроцедуры

&НаКлиенте
Процедура СписокПриАктивизацииСтроки(Элемент)
	ТекущиеДанные = Элементы.Список.ТекущиеДанные;
	
	Если (ТекущиеДанные = Неопределено) Тогда
		ПредставлениеЗаказа = "";
	Иначе
		ПредставлениеЗаказа = "№ " + Число(ТекущиеДанные.Номер) + " от "
		 + Формат(ТекущиеДанные.Дата, "ДФ=dd.MM.yyyy;") + " (" + ТекущиеДанные.Менеджер + ")";
	КонецЕсли;
КонецПроцедуры


&НаКлиенте
Процедура СписокПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, ЭтоГруппа, Параметр)
	Отказ = Истина;
	
	ПоказатьВопрос(Новый ОписаниеОповещения("СоздатьЗаказ", Действие), "Хотите использовать автозаполнение заказа?", РежимДиалогаВопрос.ДаНет,15,КодВозвратаДиалога.Нет, "Автозаполнение заказа");
	
КонецПроцедуры

