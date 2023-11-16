<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LessonLogix</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            text-align: center;
            color: #343a40;
            position: relative;
        }

        header {
            position: absolute;
            top: 0;
            right: 0;
            padding: 10px;
        }

        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }

        img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            margin: 20px;
            border: 3px solid #007bff;
            box-shadow: 0 0 10px rgba(0, 123, 255, 0.3);
        }

        h4 {
            color: #007bff;
            margin-top: 10px;
        }

        form {
            margin-top: 20px;
        }

        a {
            text-decoration: none;
            color: #28a745;
            font-weight: bold;
            border: 2px solid #28a745;
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #28a745;
            color: #fff;
        }

        .spaceDown {
            margin-bottom: 20px;
        }

        b {
            color: #343a40;
        }

        #errorMessage {
            color: #dc3545;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <form>
        <#if user.isAdmin()>
            <a href="/admin">Панель адміністратора</a>
        </#if>
    </form>
</header>
<h1>Персональний кабінет</h1>
<#if user.avatar??>
    <img src="/images/${user.avatar.id}" alt="Профіль">
<#else>
    <img src="/static/images/profile.png" alt="Профіль">
</#if>
<h4>Користувач: ${user.name}</h4>
<form>
    <div class="spaceDown"></div>
</form>
<b>Номер телефону: </b>${user.phoneNumber}<br>
<b>Ел. пошта: </b>${user.email}<br>
<#if errorMessage??>
    <h2 id="errorMessage">${errorMessage}</h2>
</#if>
</body>
</html>