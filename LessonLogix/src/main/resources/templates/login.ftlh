<!DOCTYPE html>
<html>
<head>
    <title>LessonLogix</title>
    <style>
        body {
            text-align: center;
            background-color: #f7f7f7;
        }
        h1 {
            color: #333;
        }
        h4 {
            margin-top: 20px;
            font-size: 24px;
            color: #333;
        }
        form {
            width: 300px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 90%;
            padding: 10px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
    </style>
</head>
<body>
<h1>LessonLogix</h1>
<h4>Авторизація</h4>
<form action="/login" method="post">
    Ел. пошта:
    <input type="email" name="username" value="<#if username??>${username}</#if>" required><br>
    <span style="color: red;"><#if usernameError??>${usernameError}</#if></span><br>

    Пароль:
    <input type="password" name="password" required><br>
    <span style="color: red;"><#if passwordError??>${passwordError}</#if></span><br>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вхід">
    <div style="text-align: center; margin-top: 10px"><a href="/registration">Зареєструватися</a></div>
</form>
</body>
</html>
