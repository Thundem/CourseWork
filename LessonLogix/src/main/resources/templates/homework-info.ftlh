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

        h1 {
            background-color: #0074d9;
            color: #fff;
            text-align: center;
            padding: 20px;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #0074d9;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #e0e0e0;
        }

        form {
            display: inline;
        }
    </style>
</head>
<body>
<h1>Домашнє завдання для дня тижня: ${dayOfWeek}</h1>
<table>
    <tr>
        <th>Назва предмета</th>
        <th>Домашнє завдання</th>
        <th>Дія</th>
    </tr>
    <#list lessons as lesson>
        <#if lesson.dayOfWeek == dayOfWeek>
            <tr>
                <td>${lesson.name}</td>
                <#if lesson.homework?has_content>
                    <td>${lesson.homework}</td>
                <#else>
                    <td>-</td>
                </#if>
                <td>
                    <form method="post" action="/homework-edit">
                        <input type="hidden" name="id" value="${lesson.id}">
                        <input type="hidden" name="dayOfWeek" value="${dayOfWeek}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Змінити">
                    </form>
                </td>
            </tr>
        </#if>
    </#list>
</table>
</body>
</html>
