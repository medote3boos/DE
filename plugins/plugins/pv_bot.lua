do 
local function run(msg, matches) 
if msg.text then
  if  msg.to.type == "user" then
  --by @JALAL_ALDON
 fwd_msg('user#id'..94465349,msg.id, ok_cb, false)
   
    return " "
  end 
  end
end

return { 
  patterns = { 
     "(.*)$" 
  }, 
  run = run 
} 

end
--by @JALAL_ALDON