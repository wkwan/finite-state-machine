local State = {}

function State:new(name, enter, execute, exit)
	local state = {}
	state.name = name

	--param: entity
	state.enter = enter
	state.execute = execute
	state.exit = exit

	return state

end


return State