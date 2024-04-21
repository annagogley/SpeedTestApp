# UNO Speed test <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/AppIcon.png" width="50"> 

iOS приложение, вычисляющее скорость подключения к интернету.

## Стек
Использованы фреймворки: SwiftUI, Alamofire.
Применена архитектура MVVM.
Переход между экранами реализован с помощью кастомного TabBar

### Speed test view

Состоит из кнопки и данных о скорости загрузки и отдачи.
Скорость загрузки вычисляется по формуле:
СкоростьЗагрузки = ОбъемТестовогоФайла / ЗатраченноеВремяНаЗагрузку

<p float="left">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/1.PNG" width="200">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/2.PNG" width="200">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/3.PNG" width="200">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/4.PNG" width="200">
</p>

### SettingsView

Лист настроек:
- Пикер для смены темы
- 2 текстфилда для задания URLов
- 2 тоггла-опций для теста

<p float="left">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/5.PNG" width="200">
    <img src="https://github.com/annagogley/SpeedTestApp/blob/main/screenshots/6.PNG" width="200">
</p>
