<!DOCTYPE html>
<html>
<head>
    <title>Редагування профілю</title>
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

        input[type="text"], input[type="email"], input[type="password"] {
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
<h1>Редагування профілю</h1>
<form method="post" action="/update-profile" enctype="multipart/form-data">
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <table>
        <tr>
            <td><label for="name">Ім'я:</label></td>
            <td><input id="name" name="name" type="text" value="${user.name!""}"></td>
        </tr>
        <tr>
            <td><label for="phoneNumber">Номер телефону:</label></td>
            <td><input id="phoneNumber" name="phoneNumber" type="text" value="${user.phoneNumber!""}"></td>
        </tr>
        <tr>
            <td><label for="email">Ел. пошта:</label></td>
            <td><input id="email" name="email" type="email" value="${user.email!""}"></td>
        </tr>
        <tr>
            <td><label for="avatarFile">Аватар:</label></td>
            <td><input id="avatarFile" name="avatarFile" type="file"></td>
        </tr>
        <tr>
            <td><label for="password">Пароль:</label></td>
            <td><input id="password" name="password" type="password"></td>
        </tr>
        <tr>
            <td><input type="hidden" name="_csrf" value="${_csrf.token}"></td>
            <td><input type="submit" value="Зберегти зміни"></td>
        </tr>
    </table>
</form>
</body>
</html>
