do

local function run(msg)
 local reply_id = msg['id']
if is_sudo(msg) and msg.text == "تخليني" then
   return "اي 😍💋 فديتك بس علكيفك لئن يوجع 😍❤️💋"




elseif not is_sudo(msg) and msg.text == "تخليني" then
local  info = ' لا 😒 خطيه فشلته 😹😹🙌 كبر لفك'
reply_msg(reply_id, info, ok_cb, false)
end 
end


return {  
  patterns = {
       "^تخليني$",
  },
  run = run,
}

end