&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)

	ПараметрыФормы = Новый Структура("Ключ", Пользователь.Профиль());

	ОткрытьФорму("Справочник.ПрофилиПользователей.ФормаОбъекта", ПараметрыФормы, ПараметрыВыполненияКоманды.Источник, ПараметрыВыполненияКоманды.Уникальность, ПараметрыВыполненияКоманды.Окно, ПараметрыВыполненияКоманды.НавигационнаяСсылка, , );
	//	ОткрытьФорму("Справочник.ПрофилиПользователей.ФормаОбъекта", ПараметрыФормы,,,,,,РежимОткрытияОкнаФормы.БлокироватьВеcьИнтерфейс);
КонецПроцедуры