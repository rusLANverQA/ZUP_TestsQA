﻿#language: ru

@tree

Функционал: создание документа Поступление товаров

Как Менеджер по закупкам я хочу проверить
создание документа поступление товаров
чтобы поставить товар на учет

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий
// Комментарий

Сценарий: создание документа поступление товаров
* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	Когда В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров и услуг'
	Тогда открылось окно 'Поступления товаров и услуг'
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Поступление товаров и услуг (создание)'
* Заполнение документа
	И я нажимаю кнопку выбора у поля с именем "Partner"
	Тогда открылось окно 'Партнеры'
	И я нажимаю на кнопку с именем 'FormList'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Поступление товаров и услуг (создание) *'
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	И я нажимаю на кнопку "Записать"
* Номер
	И я запоминаю значение поля "Номер" как "$Номер$"
* Проведение документа
	И я нажимаю на кнопку с именем 'FormPostAndClose'
	И я жду закрытия окна 'Поступление товаров и услуг (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "List" содержит строки :
		| 'Номер' |
		| '$Номер$' |