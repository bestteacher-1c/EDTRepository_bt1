Процедура Добавить() Экспорт
	
	Идентификатор = ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор;
	
	Ссылка = ПолучитьСсылку(Идентификатор);
	
	Объект = СоздатьЭлемент();
	
	Объект.Наименование = ПолноеИмяПользователя();
	
	Объект.УстановитьСсылкуНового(Ссылка);
	
	Объект.Записать();
	
КонецПроцедуры