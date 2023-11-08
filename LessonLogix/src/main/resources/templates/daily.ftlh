<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix</title>
    <style>
        .days-row {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .day {
            flex: 0 0 calc(25% - 20px);
            border: 1px solid black;
            padding: 10px;
            box-sizing: border-box;
        }

        .space {
            flex: 0;
            width: 20px; /* Розмір пропуску між таблицями */
            margin: 20px; /* Забрати внутрішній відступ */
            padding: 10px; /* Забрати внутрішній відступ */
        }

        .form{}

        .logout-button {
            float: right;
            font-size: 30px;
        }

        @media (max-width: 768px) {
            .day {
                flex: 0 0 calc(50% - 20px);
            }



            .form {
                flex: 0 0 calc(50% - 20px);
            }
        }

    </style>
</head>
<body>
<h1>Щоденник
    <#if user.email??>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Вийти">
        </form>
    <#else>
        |
        <a href="login"> Ввійти</a>
    </#if>
</h1>

<div class="days-row">
    <#list lessonsByDay as dayOfWeek, lessons>
        <div class="day">
            <h3><a href="/homework-info/${dayOfWeek}">${dayOfWeek}</a></h3>
            <table>
                <tr>
                    <th>Назва предмета</th>
<#--                    <th>Домашнє завдання</th>-->
<#--                    <th>Дії</th>-->
                </tr>
                <#list lessons as lesson>
                    <tr>
                        <td>${lesson.name}</td>
<#--                        <td>${lesson.homework}</td>-->
                        <td>
                            <form action="/lesson/delete/one" method="post">
                                <input type="hidden" name="id" value="${lesson.id}">
                                <input type="hidden" name="dayOfWeek" value="${dayOfWeek}">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" value="Видалити">
                            </form>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>
        <div class="space"></div>
    </#list>
</div>

<#if user.email??>
<form class="form" action="/lesson/add" method="post">
    <h3>Додати предмет</h3>
    <label for="dayOfWeek">Введіть предмет:</label>
    <input type="text" name="name">
    <div>
        <div>
            <label for="dayOfWeek">Введіть домашнє завдання:</label>
            <input type="text" name="homework">
        </div>
        <label for="dayOfWeek">Виберіть день:</label>
    <select name="dayOfWeek">
        <#list lessonsByDay?keys as dayOfWeek>
            <option value="${dayOfWeek}">${dayOfWeek}</option>
        </#list>
    </select>
    </div>
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
</#if>
</body>
</html>
