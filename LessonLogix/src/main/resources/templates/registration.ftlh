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

        .file-input-container {
            position: relative;
            width: 100%; /* Adjust the width as needed */
            margin: 10px 0;
            text-align: center; /* Center the content */
        }

        .file-input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
        }

        .file-label {
            display: inline-block;
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border-radius: 3px;
            cursor: pointer;
        }

        .file-label:hover {
            background-color: #0056b3;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        input[type="submit"] {
            width: 100%;
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
        h2 {
            color: red;
        }
    </style>
    <script>
        function updateFileLabelColor() {
            var fileInput = document.getElementById('avatarFile');
            var fileLabel = document.getElementById('fileLabel');

            if (fileInput.files.length > 0) {
                fileLabel.style.backgroundColor = '#28a745'; // Change to green color
            } else {
                fileLabel.style.backgroundColor = '#007BFF'; // Default color when no file is selected
            }
        }
    </script>
</head>
<body>
<h1>LessonLogix</h1>
<h4>Реєстрація</h4>
<form action="/registration" method="post" enctype="multipart/form-data">
    Ім'я користувача: <input type="text" name="name"><br><br>
    Ел. пошта: <input type="email" name="email"><br><br>
    <div class="file-input-container">
        Аватар:
        <label for="avatarFile" class="file-label" id="fileLabel">Обрати файл</label>
        <input type="file" name="avatarFile" id="avatarFile" class="file-input" onchange="updateFileLabelColor()">
    </div>
    Номер телефону: <input type="text" name="phoneNumber"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Зареєструватися">
</form>
<#if errorMessage??>
    <h2>${errorMessage}</h2>
</#if>
</body>
</html>
