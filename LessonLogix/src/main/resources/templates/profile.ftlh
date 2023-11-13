<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LessonLogix</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
        }

        h4 {
            color: #555;
        }

        form {
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 10px;
        }

        .spaceDown {
            margin-bottom: 20px;
        }

        b {
            color: #333;
        }

        h2 {
            color: #FF0000;
        }
    </style>
</head>
<body>
<h1>Персональний кабінет</h1>
<img src="/static/images/profile.png" alt="Профіль" border="1" style="width: 100px; height: 100px; border-radius: 50%">
<h4>Користувач: ${user.name}</h4>
<form>
    <#if user.isAdmin()>
        <a href="/admin">Панель адміністратора</a>
    </#if>
    <div class="spaceDown"></div>
</form>
<b>Номер телефону: </b>${user.phoneNumber}<br>
<b>Ел. пошта: </b>${user.email}<br>
<#if errorMessage??>
    <h2>${errorMessage}</h2>
</#if>
</body>
</html>
