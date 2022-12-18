# Black Beard Burguer Admin App

This is an delivery app built to improve my flutter skils at beginning. this app has no commercial porpouses, only for study. That's my first application built in Flutter and helped me a lot to understand how it all works! you can check restaurant_app release section to download the app for Android devices! you can download the admin app for windows too in the restaurant_admin repository. The admin app receive orders from delivery apps, update menu, add and remove items from menu, and close/open the restaurant!. Black Beard Burguer is a restaurant next to my house and I decided to use their logos and burgers to feel creating a real project!



![Screenshot (11)](https://user-images.githubusercontent.com/86686024/208314704-48c4535b-f8ec-4fdf-a3a0-ed53636517d2.png)
![Screenshot (10)](https://user-images.githubusercontent.com/86686024/208314708-97a0167f-6142-4518-a9cd-47edc35f0f68.png)



# Database

I decided to use firebase to this project 'cause the flutter and firebase works good together, and firebase has a good and easy to implement database. And the best, firebase has a good free tier, where you can do almost anything.

# API 
When I was building the app for Windows, I realized Firebase doesn't support windows :( so I built an API to have communication between Delivery App and Admin app.  I watched some videos on youtube and created an API in node.js, which I now almost nothing! but you can check that API on Restaurant_API repo

# Functions

In this app you can create an account, log-in on an existing account, add your address, add some burguer to your cart and buy them! when the API confirm the payment, your cart items and your address to receive, go directly to restaurant app (Restaurant_admin).

# Payment

I Also implemented some payment forms, the most interesting payment that I implemented, is PIX, a common payment used in Brazil. To implement this, I used the Mercado Pago API

# Notes

If you gonna test the app, the payments in PIX gonna generate a copy and paste key with R$ 0.01 to test the payment!

You only can do orders if the store is open, you can open/close store in the admin app
