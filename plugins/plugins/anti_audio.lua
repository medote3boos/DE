antiaudio = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then --Ignore mods,owner,admins
    return
  end
local data = load_data(_config.moderation.data)
if data[tostring(msg.to.id)]['settings']['lock_audio'] then
if data[tostring(msg.to.id)]['settings']['lock_audio'] == 'yes' then
if antiaudio[msg.from.id] == true then
delete_msg(msg.id, ok_cb, true)
return
end
delete_msg(msg.id, ok_cb, true)
send_large_msg("channel#id"..msg.to.id, ' ممنوع ارسار البصمه هنا يا @'..msg.from.username.. ' !') 
antiaudio[msg.from.id] = true
end
end
end
local function cron()
antichat = {} -- by @Th3_BOOS
end
return {
patterns = {
"%[(audio)%]",
},
run = run,
cron = cron
}
end