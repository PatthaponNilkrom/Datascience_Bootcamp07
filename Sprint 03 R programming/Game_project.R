# R Project: Pao Ying Chub
game_ken <- function() {
  win <- 0
  lose <- 0
  tie <- 0
  while (TRUE) {
    print ("คุณพร้อมเล่นแล้วใช่ไหม!!")
    options <- c("rock", "scissors","paper")
    print(options)
  
    user_select <- readline("Choose one'rock,scissors,paper':")
    bot_select <- sample(options,1)
    

    if(user_select == bot_select){
      print(paste("ken_Bot Choose",bot_select))
      print("เสมอ!! ใจตรงกันสุดๆ") 
      tie <- tie+1
      
    } else if(user_select == 'rock' & bot_select == 'scissors'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("คุณชนะ!! เหลือจะเชื่อ!! กรรไกรฉันเสียหมดเลย") 
      win <- win+1
    } else if(user_select == 'paper' & bot_select == 'rock'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("คุณชนะ!! เหลือจะเชื่อ!! ค้อนต้องทุบกระดาษสิ") 
      win <- win+1
    } else if(user_select == 'scissors' & bot_select == 'paper'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("คุณชนะ!! เหลือจะเชื่อ!! กระดาษขาดหมดเลย") 
      win <- win+1
      
    } else if(user_select == 'rock' & bot_select == 'paper'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("ง่าาา คุณแพ้ มาเอาใหม่ได้พร้อม!!") 
      lose <- lose+1
    } else if(user_select == 'paper' & bot_select == 'scissors'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("เหลือจะเชื่อ ฉันชนะ คุณควรแก้มือหน่อยนะ!!") 
      lose <- lose+1
    } else if(user_select == 'scissors' & bot_select == 'rock'){
      print(paste("ken_Bot Choose >>",bot_select))
      print("กรรไกรจะชนะค้อนได้ไงล่ะ ฉันชนะ!!") 
      lose <- lose+1
    }
    else if(user_select == "exit") {
      
      print ("see ya! your point")
      print(paste("you win",win))
      print(paste("you lose",lose))
      print(paste("you tie",tie))
      break
    }else{
      print("ที่คุณเลือกไม่อยู่ในเงื่อนไขโปรดเลือกใหม่")
      
    }
  }
}
