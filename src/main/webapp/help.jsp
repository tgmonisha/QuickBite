<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Help - QuickBite</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #fbc2eb, #a6c1ee);
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .faq {
            margin-top: 20px;
        }

        .faq h3 {
            margin-bottom: 8px;
            color: #d35400;
        }

        .faq p {
            margin-top: 0;
            color: #555;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .btn-container {
            margin-top: 30px;
            text-align: center;
        }

        .back-btn {
            text-decoration: none;
            padding: 12px 24px;
            background-color: #27ae60;
            color: white;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #1e8449;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>💬 Help & Support - QuickBite</h1>
        
        <div class="faq">
            <h3>🍴 How do I place an order?</h3>
            <p>Browse restaurants, view menus, add food items to your cart, and proceed to checkout.</p>

            <h3>🕒 How do I track my order?</h3>
            <p>Visit the "My Orders" page from your profile to see live status updates.</p>

            <h3>💳 I had a payment issue. What do I do?</h3>
            <p>Contact our support at <b>support@quickbite.com</b> with your order ID.</p>

            <h3>❌ Can I cancel an order?</h3>
            <p>You can cancel within 2 minutes after placing the order by visiting "My Orders".</p>
        </div>

        <div class="btn-container">
            <a class="back-btn" href="restaurant.jsp">← Back to Home</a>
        </div>
    </div>
</body>
</html>
