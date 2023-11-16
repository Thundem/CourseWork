<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        .icon-container {
            text-align: center;
        }

        .icon-container img {
            width: 100px; /* Розмір іконки */
            height: 100px;
        }

        h1 {
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            margin: 0;
        }

        h1 a {
            color: white;
            text-decoration: none;
        }

        .profile-button {
            float: left;
            font-size: 18px;
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #0074d9; /* Колір фону */
            color: #fff; /* Колір тексту */
            border: none; /* Видалити рамку кнопки */
            border-radius: 5px; /* Закруглені кути */
            cursor: pointer; /* Змінити вигляд курсору при наведенні */
            transition: background-color 0.3s; /* Плавна анімація зміни кольору фону */

            /* Змінюємо кольор фону при наведенні миші */
            &:hover {
                background-color: #0056b3;
            }
        }

        .logout-button {
            float: right;
            font-size: 18px;
            padding: 10px 20px;
            margin-right: 10px;
            margin-top: -35px;
            background-color: #0074d9; /* Колір фону */
            color: #fff; /* Колір тексту */
            border: none; /* Видалити рамку кнопки */
            border-radius: 5px; /* Закруглені кути */
            cursor: pointer; /* Змінити вигляд курсору при наведенні */
            transition: background-color 0.3s; /* Плавна анімація зміни кольору фону */

            /* Змінюємо кольор фону при наведенні миші */
            &:hover {
                background-color: #0056b3;
            }
        }

        .login-button {
            float: right;
            font-size: 18px;
            padding: 10px 20px;
            margin-right: 10px;
            margin-top: -35px;
            background-color: #0074d9; /* Колір фону */
            color: #fff; /* Колір тексту */
            border: none; /* Видалити рамку кнопки */
            border-radius: 5px; /* Закруглені кути */
            cursor: pointer; /* Змінити вигляд курсору при наведенні */
            transition: background-color 0.3s; /* Плавна анімація зміни кольору фону */

            /* Змінюємо кольор фону при наведенні миші */
            &:hover {
                background-color: #0056b3;
            }
        }


        .days-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px;
        }

        .day {
            flex: 0 0 calc(30% - 20px);
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            box-sizing: border-box;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .day h3 {
            font-size: 18px;
            margin: 0;
            text-align: center;
        }

        .day a {
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .space {
            flex: 0 0 20px;
        }

        .spaceDown {
            margin-bottom: 15px;
        }

        .form-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }

        .form {
            flex: 0 0 calc(50% - 20px);
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            box-sizing: border-box;
            border-radius: 5px;
            margin: 0 10px; /* Add margin to create space between the two forms */
        }

        .form h3 {
            font-size: 18px;
            margin: 0 0 10px;
        }

        .form label {
            display: block;
            font-weight: bold;
            margin: 10px 0;
        }

        .form input[type="text"],
        .form select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        .form input[type="submit"]:hover {
            background-color: #45a049;
        }

        @media (max-width: 768px) {
            .day {
                flex: 0 0 calc(50% - 20px);
            }

            .form-container {
                flex-direction: column;
            }

            .form {
                flex: 0 0 100%;
                margin: 0 0 20px; /* Add margin to create space between the two forms on smaller screens */
            }
        }
    </style>
</head>
<body>
<h1>Щоденник

    <#if user.email??>
        <a href="/profile">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Профіль" class="profile-button">
        </a>

        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Вийти" class="logout-button">
        </form>
    <#else>
        <form action="/login" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Ввійти" class="login-button">
        </form>
    </#if>
</h1>

<div class="days-row">
    <#list lessonsByDay as dayOfWeek, lessons>
        <div class="day">
            <h3><a href="/homework-info/${dayOfWeek}">${dayOfWeek}</a></h3>
            <table>
                <tr>
                    <th>Назва предмета</th>
                    <th>Дія</th>
                </tr>
                <#if user.email??>
                <#list lessons as lesson>
                    <tr>
                        <td>${lesson.name}</td>
                        <td>
                            <#if user.email??>
                                <form action="/lesson/delete/one" method="post">
                                    <input type="hidden" name="id" value="${lesson.id}">
                                    <input type="hidden" name="dayOfWeek" value="${dayOfWeek}">
                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                    <input type="submit" value="Видалити">
                                </form>
                                <#else>
                                    <form action="/login" method="post">
                                        <input type="hidden" name="id" value="${lesson.id}">
                                        <input type="hidden" name="dayOfWeek" value="${dayOfWeek}">
                                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                                        <input type="submit" value="Видалити">
                                    </form>
                            </#if>
                        </td>
                    </tr>
                </#list>
                </#if>
            </table>
        </div>
        <div class="space"></div>
    </#list>
</div>

<#if user.email??>
<div class="form-container">
    <form class="form" action="/lesson/add" method="post">
        <h3>Додати предмет</h3>
        <label for="name">Введіть предмет:</label>
        <input type="text" name="name">
        <label for="homework">Введіть домашнє завдання:</label>
        <input type="text" name="homework">
        <label for="dayOfWeek">Виберіть день:</label>
        <select name="dayOfWeek">
            <#list lessonsByDay?keys as dayOfWeek>
                <option value="${dayOfWeek}">${dayOfWeek}</option>
            </#list>
        </select>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Додати">
    </form>

    <form class="form" action="/lesson/delete/all" method="post">
        <h3>Видалити всі дані</h3>
        <label for="dayOfWeek">Виберіть день:</label>
        <select name="dayOfWeek">
            <#list lessonsByDay?keys as dayOfWeek>
                <option value="${dayOfWeek}">${dayOfWeek}</option>
            </#list>
        </select>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Очистити">
    </form>
</div>
</#if>
</body>
</html>
