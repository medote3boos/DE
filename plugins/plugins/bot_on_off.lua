--[[ 
▀▄ ▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀▄▀▄▄▀▀▄▄▀▀▄▄▀▀▄▄▀▀          
▀▄ ▄▀                                      ▀▄ ▄▀ 
▀▄ ▄▀    BY Th3_BOOS                   ▀▄ ▄▀ 
▀▄ ▄▀     BY Th3_BOOS (@Th3_BOOS)    ▀▄ ▄▀ 
▀▄ ▄▀ JUST WRITED BY Th3_BOOS          ▀▄ ▄▀   
▀▄ ▄▀disable chat: تعطيل تفعيل دردشه محدد  ▀▄ ▄▀ 
▀▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀▄▄▀▀▄▄▀▄▄▀▀
--]]
local function is_channel_disabled( receiver )
	if not _config.disabled_channels then
		return false
	end

	if _config.disabled_channels[receiver] == nil then
		return false
	end

  return _config.disabled_channels[receiver]
end

local function enable_channel(receiver)
	if not _config.disabled_channels then
	   _config.disabled_channels = {}
	end

	if _config.disabled_channels[receiver] == nil then
	return "البوت🤖 بالتاكيد تم ✅تشغيله في المجموعه👥"
	end
	
	_config.disabled_channels[receiver] = false

	save_config()
	return "💠#ملاحظه ⁉️\n\nتم ✅تشغيل♻️ البوت🤖 {✔️}\n\n#Bot_has_enable_In_Group"
end

local function disable_channel( receiver )
	if not _config.disabled_channels then
       _config.disabled_channels = {}
	end
	
	_config.disabled_channels[receiver] = true

	save_config()
	return "📛#انتباه⁉️\n\n📛تم ايقاف 🚷تشغيل البوت 🤖{❌}\n\n#Bot_has_disable_In_Group"
end

local function pre_process(msg)
	local receiver = get_receiver(msg)
	
	-- If sender is moderator then re-enable the channel
	--if is_sudo(msg) then
	if is_momod(msg) then
	  if msg.text == "تشغيل البوت" then
	    enable_channel(receiver)
	  end
	end

  if is_channel_disabled(receiver) then
  	msg.text = "البوت🤖 بالتاكيد تم ✅اطفاء❌ في المجموعه👥"
  end

	return msg
end

local function run(msg, matches)
	local receiver = get_receiver(msg)
	-- Enable a channel
	if matches[1] == 'تشغيل البوت' then
		return enable_channel(receiver)
	end
	-- Disable a channel
	if matches[1] == 'ايقاف البوت' then
		return disable_channel(receiver)
	end
end

return {
	description = "Plugin to manage Bot.", 
	usage = {
		"Bot on: enable BOT In a Group",
		"Bot off: disable Bot In a Group" },
	patterns = {
		"^(تشغيل البوت)",
		"^(ايقاف البوت)" }, 
	run = run,
	privileged = true,
	--moderated = true,
	pre_process = pre_process
}
