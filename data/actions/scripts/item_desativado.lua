function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
	local actionid = item:getActionId()
	if(actionid == 2500) then
		return false
	elseif(actionid == 2501) then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, "Essa porta est� trancada.")
	elseif(actionid == 2502) then
		return player:sendTextMessage(MESSAGE_INFO_DESCR, "Esse port�o est� trancado.")
	end
end