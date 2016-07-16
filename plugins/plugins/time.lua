local function remind(msg)
  local hash = 'saving_remind'
  local data = redis:hgetall(hash)
  local chat_id = data.id
  local time = data.time
  vardump(os.time())
  vardump(data)
  if data.stage == 'two' then
    if tonumber(os.time()) > tonumber(time) then
      local text = data.text
      send_large_msg('channel#id'..chat_id, 'Time is up !!!\n'..text) 
      send_large_msg('chat#id'..chat_id, 'Time is up !!!\n'..text) 
      redis:hset(hash, 'stage', 'off')
    end
  end
  if data.stage == 'off' then
    return
  else
    postpone(remind, false, 2) 
  end
end
local function pre_process(msg)
  local hash = 'saving_remind'
  local base = redis:hgetall(hash)
  if msg.text then
    if msg.service then 
      return msg
    end
    if msg.text == '/pass' or msg.text == '!pass' then
      return msg
    end
    vardump(base)
    if tonumber(base.user) == tonumber(msg.from.id) then
      if base.stage == 'one' then
        redis:hset(hash, 'text', msg.text)
        redis:hset(hash, 'stage', 'two')
        local time = base.temp
        redis:hset(hash, 'time', time)
        send_large_msg(get_receiver(msg), 'Done \nRemind started.')
        remind(msg)
      end
    end
  end
  return msg
end
local function run(msg, matches) 
  local hash = 'saving_remind'
  local base = redis:hgetall(hash)
  if matches[1] == 'demind' and matches[2] then
    local gap = tonumber(matches[2]) 
    local sec = gap % 60 
    local min = 0 
    local hrs = 0
    if gap > 8000 then
      return 'Error invalid input\n1 - 8000 is the max range'
    end
    if gap > 59 then 
      min = ((gap - sec) /60) %60 
      if gap > 3599 then 
        hrs = (gap - sec - (min * 60)) / 3600 
      end 
    end
    redis:hset(hash, 'id', msg.to.id) 
    redis:hset(hash, 'temp', tonumber(os.time()) + gap)
    redis:hset(hash, 'stage', 'one')
    redis:hset(hash, 'user', msg.from.id)
    send_large_msg(get_receiver(msg), 'Remind will be set for '..hrs..' hrs and '..min..' mins and '..sec..' secs\nSend a text for the remind or type  /pass')
  end
  if matches[1]:lower() == 'pass' then
    if base.stage == 'one' then
      redis:hset(hash, 'stage', 'two')
      redis:hset(hash, 'text', '')
      remind(msg)
      return 'Done'
    end
  end
end 
return { 
  patterns = { 
    "^(demind) (.*)$", 
    "^([Pp]ass)$",
    }, 
  run = run,
  pre_process = pre_process
}