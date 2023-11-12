<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LessonLogix</title>
    <style>
        body {
            font-family: 'Verdana', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h4 {
            color: #333;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        b {
            color: #555;
        }

        h2 {
            color: #FF0000;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h4>Користувач: ${user.name}</h4>
<b>Номер телефону: </b>${user.phoneNumber}<br>
<b>Ел. пошта: </b>${user.email}<br>
<b>Дата створення акаунту: </b>${user.dateOfCreated}<br>
<#if errorMessage??>
    <h2>${errorMessage}</h2>
</#if>
</body>
</html>
