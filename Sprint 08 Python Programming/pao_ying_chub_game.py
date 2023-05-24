# Python Project: pao ying chub
from random import sample
def game_bot():
    win = 0
    lose = 0
    tie = 0
    while True:
        options = [1,2,3]
        user_select = int(input("Choose one \n1:rock \n2:scissors \n3:paper \n4: exit \n"))
        bot_select = sample(options,1)
        bot_select = bot_select[0]
        if user_select == bot_select:
                print(f"Bot choose == {bot_select}")
                print("เสมอ!! ใจตรงกันสุดๆ") 
                tie += 1
    
        elif user_select == 1 and bot_select == 2:
                print(f"Bot Choose ++ {bot_select}")
                print("คุณชนะ!! เหลือจะเชื่อ!! กรรไกรฉันเสียหมดเลย") 
                win += 1
            
        elif user_select == 3 and bot_select == 1:
                print(f"Bot Choose ++ {bot_select}")
                print("คุณชนะ!! เหลือจะเชื่อ!! ค้อนต้องทุบกระดาษสิ") 
                win += 1
            
        elif user_select ==2 and bot_select == 3:
                print(f"Bot Choose ++ {bot_select}")
                print("คุณชนะ!! เหลือจะเชื่อ!! กระดาษขาดหมดเลย") 
                win += 1
            
        elif user_select == 1 and bot_select == 3:
                print(f"Bot Choose -- {bot_select}")
                print("ง่าาา คุณแพ้ มาเอาใหม่ได้พร้อม!!") 
                lose += 1
            
        elif user_select == 3 and bot_select == 2:
                print(f"Bot Choose -- {bot_select}")
                print("เหลือจะเชื่อ ฉันชนะ คุณควรแก้มือหน่อยนะ!!") 
                lose += 1
            
        elif user_select == 2 and bot_select == 1:
                print(f"Bot Choose -- {bot_select}")
                print("กรรไกรจะชนะค้อนได้ไงล่ะ ฉันชนะ!!") 
                lose += 1
            
        elif user_select == 4:
                        
                print ("see ya! your point")
                print(f"you win {win}")
                print(f"you lose {lose}")
                print(f"you tie {tie}")
                break
        else:
                  print("ที่คุณเลือกไม่อยู่ในเงื่อนไขโปรดเลือกใหม่")
