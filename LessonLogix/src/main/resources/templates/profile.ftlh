<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix</title>
</head>
<body>
<h1>Персональний кабінет</h1>
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
