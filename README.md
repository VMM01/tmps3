# tmps3
В данной лабораторной работе показано применение 5 шаблонов проектирования (TEMPLATE, STATE, STRATEGY, MEMENTO, ITERATOR) на примере форматирования обычного текста в отчёт в виде HTML кода и в отчёт со структурированным текстом.

# Шаблон Template
Создан класс Report, являющийся шаблонным который наследут классы HTMLReport и PlainTextReport. Текст класса Report по разному форматируется переписанными методами классов HTMLReport и PlainTextReport.

Описан в файлах : Template+Report.swift, Template+HTMLReport.swift, Template+PlainReport.swift

# Шаблон MEMENTO 
Форматированный текст запоминается локально на устройстве, при следующем запуске будет отображен текст сохраненный из последней сессии приложения.

Описан в файле ViewController.swift ( lines 31-38 )

# Шаблон ITERRATOR
Создана структура Reports и ReportsIterrator для возможности создания цикла forEach объектов типа Report.

Описан в файле Template+Report.swift ( lines 13-36 )
Реализация в файле ViewController.swift ( lines 40-44 )

# Шаблон STRATEGY
Создан класс ReportPrinter и интерфейс PrintReportStrategy для печати отчёта заглавными буквами или маленькими в зависимости от стратегии ( LowerCaseStrategy, UpperCaseStrategy )

Описан в файле Strategy.swift
Реализация в файле ViewController.swift ( lines 46-49 )

# Шаблон STATE 
В классе Report создан enum ReportState ( case raw, submitted, published ) для определения состояния отчёта. Действие на кнопках изменяет состояние объекта типа Report и не может быть изменено на изначальное. 
Состояние отчёта бывает : 
1. Сырым ( когда отчёт находится на стадии подготовки для отправки )
2. Отправленным на проверку
3. Опубликованным ( когда отчёт прошёл проверку)

Описан в файле Template+Report.swift
Реализация в файле ViewController.swift ( lines 52-59 )
