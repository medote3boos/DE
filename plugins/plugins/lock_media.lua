--[[
#
#ـــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
#:((
# For More Information ....! 
# Developer : Aziz < @TH3_GHOST > 
# our channel: @DevPointTeam
# Version: 1.1
#:))
#ــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــــ
#
]]
local function DevPoint(msg, matches)
    if is_momod(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['audio'] then
                lock_audio = data[tostring(msg.to.id)]['settings']['audio']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_audio == "yes" then
       delete_msg(msg.id, ok_cb, true)
       send_large_msg(get_receiver(msg), 'عزيزي " '..msg.from.first_name..' "\n " ممنوع نشر صور "  👮\n#Username : @'..msg.from.username)
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['document'] then
                lock_document = data[tostring(msg.to.id)]['settings']['document']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_document == "yes" then
       delete_msg(msg.id, ok_cb, true)
       send_large_msg(get_receiver(msg), 'عزيزي " '..msg.from.first_name..' "\nممنوع ملفات  ا "  👮\n#Username : @'..msg.from.username)
    end
        local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['media'] then
                lock_media = data[tostring(msg.to.id)]['settings']['media']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_media == "yes" then
       delete_msg(msg.id, ok_cb, true)
       send_large_msg(get_receiver(msg), 'عزيزي " '..msg.from.first_name..' "\nممنوع ملفات  ا "  👮\n#Username : @'..msg.from.username)
    end
end

return {
  patterns = {
"%[(photo)%]",
"%[(document)%]",
"%[(video)%]",
"%[(audio)%]",
"%[(gif)%]",
"%[(sticker)%]",
  },
  run = DevPoint
}