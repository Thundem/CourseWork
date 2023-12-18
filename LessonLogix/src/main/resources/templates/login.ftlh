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
        .alert {
            padding: 15px;
            margin: 20px auto 20px;
            border-radius: 8px;
            font-weight: bold;
            text-align: center;
            transition: 0.3s;
            width: 80%;
            max-width: 600px;
        }

        .success {
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
        }
        .error {
            color: #721c24;
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
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
    <input type="email" name="username" value="<#if username??>${username}</#if>" required><br><br>

    Пароль:
    <input type="password" name="password" required><br><br>

    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вхід">
    <div style="text-align: center; margin-top: 10px"><a href="/registration">Зареєструватися</a></div>
</form>

<#if (successMessage?has_content)>
    <div class="alert success">${successMessage}</div>
</#if>
<#if (errorLogin?has_content)>
    <div class="alert error">${errorLogin}</div>
</#if>

</body>
</html>
