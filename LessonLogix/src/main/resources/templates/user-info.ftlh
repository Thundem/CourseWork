<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix</title>
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
