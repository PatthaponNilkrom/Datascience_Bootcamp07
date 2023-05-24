# R Project: Chatbot KEN
ken_bot <- function() {
  print("สวัสดีผมเคน bot แนะนำนิดนึงหากคุณไม่อยากคุยต่อโปรดพิมพ์ 'exit'")
  chat_k = readline("a: คุยกับผม , b:เล่นเกมกับผม:  ")
  if (chat_k == "a") {
  while(TRUE) {
    text = readline("คุณชื่ออะไร:")
  if (text == "exit") {
    print("ขอบคุณไว้มาคุยกันใหม่")
    break
  } else if ((text == "bonut") | (text =="Bonut") | (text=="BONUT") | (text=="โบนัส")) { 
    print("คุณชื่อเหมือนคนที่ผมชอบเลย แต่ผมก็ไม่รู้ว่าเขาชอบผมไหม!?")
    h = readline("คุณชอบคนสูงเท่าไรหรอ?:")
    if (h == 170) {
      print(paste("ผมสูง", h,"เซนติเมตรพอดีเลย"))
      print("สงสัยเนื้อคู่ :)")
  
    } else {
      print("เสียดายที่ผมอาจจะสูงไม่เท่าที่คุณต้องการ")
      print("แต่ผมมีใจมากกว่าแน่นอน <3")
    }
  }
    else {
     print(paste("สวัสดี",text))
      ages = readline("คุณอายุเท่าไร?:")
      print(paste("โอเค", ages, "ปีสินะ ผมรู้จักอายุคุณแล้ว!"))
      print("นั่นคือทั้งหมดที่ผมอยากรู้จากคุณ")
      print("ถ้าคุณมีชื่อเดียวกับคนที่ผมชอบผมอาจจะอยากคุยกับคุณมากกว่านี้")
      print("Bye ไว้เจอกันใหม่")
      }
    }
  } else if (chat_k == "b") {
      game_ken()
  } else {
      print("โอเคงั้นผมไม่กวนแล้วบาย")
      break
      } 
}
