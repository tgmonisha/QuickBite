<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Exclusive Offers - QuickBite</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 30px;
        }
        h1 {
            color: #d62828;
            text-align: center;
            margin-bottom: 30px;
        }
        .offers-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .offer-card {
            background-color: #fff;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            width: 280px;
            padding: 20px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .offer-card:hover {
            transform: scale(1.05);
        }
        .offer-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        .offer-desc {
            font-size: 15px;
            color: #555;
        }
        .back-btn {
            display: inline-block;
            margin-top: 40px;
            padding: 10px 20px;
            background-color: #2a9d8f;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .back-btn:hover {
            background-color: #21867a;
        }
        .center-btn {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>🔥 Today's Hot Offers at QuickBite</h1>

    <div class="offers-container">
        <div class="offer-card">
            <div class="offer-title">🍕 30% Off on Pizzas</div>
            <div class="offer-desc">Get 30% off on all pizza orders above ₹299. Use code <b>PIZZA30</b>.</div>
        </div>
        <div class="offer-card">
            <div class="offer-title">🛵 Free Delivery</div>
            <div class="offer-desc">Enjoy free delivery on your first 3 orders. No minimum order value required!</div>
        </div>
        <div class="offer-card">
            <div class="offer-title">🍔 Combo Mania</div>
            <div class="offer-desc">Buy 1 Burger + Fries Combo and get a Coke free! Limited time only.</div>
        </div>
        <div class="offer-card">
            <div class="offer-title">🎉 Weekend Feast</div>
            <div class="offer-desc">Flat ₹150 off on weekend orders above ₹499. Use code <b>WEEKEND150</b>.</div>
        </div>
        <div class="offer-card">
            <div class="offer-title">💳 20% Cashback</div>
            <div class="offer-desc">Pay with UPI and get 20% cashback up to ₹50. T&C apply.</div>
        </div>
    </div>

    <div class="center-btn">
        <a href="restaurant.jsp" class="back-btn">← Back to Home</a>
    </div>
</body>
</html>
