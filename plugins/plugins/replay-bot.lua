do 

local function run(msg, matches) 

if ( msg.text ) then

  if ( msg.to.type == "user" ) then

return "للتحدث مع المطور 🔰اضغط على المعرف التالي🌐👇🏽  \n                              👉🏽 @Th3_BOOSbot 👈🏽 \n\n 📛من فضلك تابع القناة 🌺 @dev_Th3_BOOS  "     
  end 
   
end 

-- #DEV @Th3_BOOS

end 

return { 
  patterns = { 
       "(.*)$"
  }, 
  run = run, 
} 

end 
-- By @Th3_BOOS
