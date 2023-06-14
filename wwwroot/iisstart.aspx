<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>hello.net</title>
    <style>
        .scrolling-text {
            animation: marquee 30s linear infinite;
        }
        
        @keyframes marquee {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }
    </style>
</head>
<body>
    <h1>hello-dot-net-vm</h1>
    <div class="scrolling-text">
        <p>This is a sample demo hello world project.</p>
    </div>
    <p>Revision Number: <%= System.Environment.GetEnvironmentVariable("REVISION") %></p>
</body>
</html>

