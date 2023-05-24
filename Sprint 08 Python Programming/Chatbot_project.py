# Python Project: chatbot to order pizza
def chat_bot():
    boxchat = []
    price = 0
    while True:
        print("What kind of pizza do you want?")
        boxchat_input = int(input("1:Seafood pizza 400 bath \n2:Tom Yum Pizza 350 ฺbath \n3:Hawaiian Pizza 300 bath \n4:Choose your own pizza \n5: exit \n"))
        if boxchat_input == 5:
            result = f"{boxchat} total price {price} bath"
            return result
        elif boxchat_input == 1:
            boxchat.append("Seafood pizza 400 bath")
            price += 400
            
        elif boxchat_input == 2:
            boxchat.append("Tom Yum Pizza 350 ฺbath")
            price += 350
            
        elif boxchat_input == 3:
            boxchat.append("Hawaiian Pizza 300 bath")
            price += 300
            
        elif boxchat_input == 4:
                print("You can choose only three!:")
                your_own = []
                price_o = 0
                for i in range(3):
                    pizza_input = int(input("1:shrimp 150 bath \n2:pineapple 50 ฺbath \n3:chicken 100 bath "))
                    if pizza_input == 1:
                        your_own.append("shrimp")
                        price_o += 150
                        
                    elif pizza_input == 2:
                        your_own.append("pineapple")
                        price_o += 50
                        #return your_own, price
                    elif pizza_input == 3:
                        your_own.append("chicken")
                        price_o += 100
                        
                tt = f"pizza {your_own} price {price_o} bath"
                price += price_o
                boxchat.append(tt)
