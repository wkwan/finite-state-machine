local StateMachine = {}


function StateMachine:new(entity, currentState, previousState)
	--only entity and currentState required
	local stateMachine = {}
	stateMachine.curState = currentState
	stateMachine.prevState = previousState
	
	local states = {}

	states[currentState.name] = currentState
	if previousState then
		states[previousState.name] = previousState
	end
	function stateMachine:update()
		self.curState.execute(entity)
		-- print(self.curState.name)
	end

	function stateMachine:addState(newState)
		states[newState.name] = newState
	end

	function stateMachine:changeState(newStateName)
		self.prevState = self.curState
		self.curState.exit(entity)
		self.curState = states[newStateName]
		self.curState.enter(entity)
	end

	function stateMachine:revertState()
		self:changeState(self.prevState.name)
	end

	function stateMachine:isInState(stateName)
		return stateName == self.curState.name
	end

	return stateMachine

end

return StateMachine