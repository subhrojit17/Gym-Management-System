<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            background-color: #fff5f5; /* MistyRose */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            margin-top: 50px;
            animation: fadeIn 1.5s ease-in-out;
        }

        h2 {
            color: #ff0000; /* Red */
            margin-bottom: 20px;
            font-size: 2em;
            animation: shake 0.5s ease-in-out ;
        }

        p {
            color: #333;
            font-size: 1.2em;
        }

        a {
            color: #007bff; /* Blue */
            text-decoration: none;
            font-weight: bold;
            border-bottom: 2px solid transparent;
            transition: border-bottom 0.3s ease-in-out;
        }

        a:hover {
            border-bottom: 2px solid #007bff;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }
            10%, 30%, 50%, 70%, 90% {
                transform: translateX(-5px);
            }
            20%, 40%, 60%, 80% {
                transform: translateX(5px);
            }
        }
    </style>
</head>
<body>
    <h2>Error Processing Booking</h2>
    <p>There was an error processing your booking.</p>
    <p><a href="index.jsp">Back to Home</a></p>
</body>
</html>
