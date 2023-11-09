<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            background-color: #333;
            color: #fff;
            padding: 20px;
            margin: 0;
        }
        h3 {
            background-color: #444;
            color: #fff;
            padding: 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        td {
            background-color: #fff;
        }
        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }
        .ban-button, .delete-button, .edit-link, .info-link {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #333;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
        }
        .ban-button:hover, .delete-button:hover, .edit-link:hover, .info-link:hover {
            background-color: #555;
        }
        .no-users-message {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
<h1>LessonLogix Admin Panel</h1>

<table border="1">
    <tr>
        <th>Ел. пошта</th>
        <th>Номер телефона</th>
        <th>Активність</th>
        <th>Роль</th>
        <th>Бан</th>
        <th>Видалити користувача</th>
        <th>Редагування</th>
        <th>Детальна інформація</th>
    </tr>

    <#list users as user>
        <tr>
            <td>${user.email}</td>
            <td>${user.phoneNumber}</td>
            <td><#if user.active>true<#else>false</#if></td>
            <td><#list user.roles as role>${role}</#list></td>
            <td>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан" class="ban-button">
                </form>
            </td>
            <td>
                <form action="/admin/user/delete/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Видалити" class="delete-button">
                </form>
            </td>
            <td><a href="/admin/user/edit/${user.id}" class="edit-link">Редагування</a></td>
            <td><a href="/user/${user.id}" class="info-link">Детальна інформація</a></td>
        </tr>
    <#else>
        <tr>
            <td colspan="8" class="no-users-message">Користувачів немає</td>
        </tr>
    </#list>
</table>
</body>
</html>
