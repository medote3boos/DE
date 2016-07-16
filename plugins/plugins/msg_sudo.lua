do 

local function run(msg, matches) 
 local sudo = 94465349 
 local r = get_receiver(msg)
  send_large_msg(r, "تم ارسال رسالتك الى المطور ✅📝\n\n الرساله الى :@Th3_BOOS\n\n الرساله من @"..msg.from.username)
  send_large_msg("user#id"..sudo, "تم ارسال رساله من هذه المجموعة  > "..msg.to.title.." < '\n\n'المــــرســل > @"..msg.from.username.." < '\n\n'ايدي المجموعة > "..msg.to.id)
end 

return { 
  patterns = { 
     "^(@Th3_BOOS)$"
   
  }, 
  run = run, 
} 

end