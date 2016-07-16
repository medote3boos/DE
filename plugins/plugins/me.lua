--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    BY Th3_BOOS                   ▀▄ ▄▀ 
▀▄ ▄▀     BY Th3_BOOS (@Th3_BOOS)    ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY Th3_BOOS          ▀▄ ▄▀   
▀▄ ▄▀     ME BOT  : شنو اني                ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
do

local function run(msg, matches)
  if matches[1] == 'شنو اني' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "انَـَY̷ ̜̩O̷ ̜̩U̷ ̜̩ـَتَ🌹  المطور 🔰مال  أإنۣۜہٰـஓℳ̯͡ℜـٍّيٍّ❥  فديتك فدي  من البطرون للبدي😻🌺"
    elseif is_admin1(msg) then
    send_document(get_receiver(msg), "./files/me/support.webp", ok_cb, false)
      return "انَـَY̷ ̜̩O̷ ̜̩U̷ ̜̩ـَتَ  اداري بالكـgяθυρـٍْـْْروب😍 فدوه🙊"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "./files/me/owner.webp", ok_cb, false)
      return "انَـَY̷ ̜̩O̷ ̜̩U̷ ̜̩ـَتَ  مدير الكـgяθυρـٍْـْْروب👥  تاج راسي😻"  
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return "انَـَY̷ ̜̩O̷ ̜̩U̷ ̜̩ـَتَ  ادمن الكـgяθυρـٍْـْْروب ☺️🙈"
    else
    send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "انَـَY̷ ̜̩O̷ ̜̩U̷ ̜̩ـَتَ  عضو😍 حــмуℓσνєـبًيِ  امــہـ😘😚😘😚😘ــہــواااااح ❤️"
    end
  end
end

return {
  patterns = {
    "^(شنو اني)$",
    "^(شنو اني)$"
    },
  run = run
}
end
