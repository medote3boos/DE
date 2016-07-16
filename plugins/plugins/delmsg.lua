local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'من الرسائل ✉️تم مسحها 📛من المجموعه👥🌺"', ok_cb, false)
  else
    send_msg(extra.chatid, '  تم ✅مسح 📛جميع رسائل المجموعه 👥 ', ok_cb, false)
  end
end
local function iDev1(msg, matches)
  if matches[1] == 'مسح' and is_momod(msg) then
    if msg.to.type == 'channel' then
      if tonumber(matches[2]) > 1000000 or tonumber(matches[2]) < 1 then
        return "#عذرا🌺 \n\n  لا ❌يمكنك مسح هذا العدد من الرسائل 🗞يمكنك مسح من 1⃣ الى 1⃣ مليون💠"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "📛للمشرفين فقط✋ الرجاء عدم❌ العبث🌺"
    end
  else
    return "📛للمشرفين فقط✋ الرجاء عدم❌ العبث🌺"
  end
end

return {
    patterns = {
        '^(مسح) (%d*)$'
    },
    run = iDev1
}