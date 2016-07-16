--Coded By Sajad Aliraqe : @SasO_0
do

function run(msg, matches)
local reply_id = msg['id']
local text = 'الله وياك تاج راسي وراس عشيرتي  😍😍😍😍❤️ محروس باسم (الله و محمد و علي) @'..msg.from.username
if matches[1] == 'bye'then
    if is_sudo(msg) then
reply_msg(reply_id, text, ok_cb, false)
end
end 
end
return {
patterns = {
    "bye",
   
},
run = run
}
-- Coded By Sajad Aliraqe : @SasO_0
end