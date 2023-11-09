<!DOCTYPE html>
<html>
<head>
    <title>Редагування домашнього завдання</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            background-color: #0074d9;
            color: #fff;
            padding: 20px;
        }

        form {
            width: 80%;
            margin: 0 auto;
            text-align: left;
        }

        table {
            width: 100%;
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

        label {
            display: block;
            text-align: left;
            margin: 10px 0;
        }

        input[type="text"] {
            width: 100%;
            padding: 5px;
        }

        input[type="submit"] {
            background-color: #0074d9;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056a4;
        }
    </style>
</head>
<body>
<h1>Редагування домашнього завдання для предмета: ${lesson.name}</h1>
<form method="post" action="/save-updated-homework">
    <input type="hidden" name="id" value="${lesson.id}">
    <input type="hidden" name="dayOfWeek" value="${dayOfWeek}">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <table>
        <tr>
            <td><label for="homework">Нове домашнє завдання:</label></td>
        </tr>
        <tr>
            <td><input id="homework" name="homework" type="text" value="${lesson.homework!""}"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Зберегти зміни"></td>
        </tr>
    </table>
</form>
</body>
</html>
