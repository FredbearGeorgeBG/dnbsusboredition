function onStartCountdown()
setProperty('health', 100)
end

function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/500)*(curBpm/60)
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end

    noteTweenY('defaultOpponentStrumY0', 0, defaultOpponentStrumY0 + 18 * math.sin((currentBeat+0 *0.25) * math.pi), 0.01)
    noteTweenY('defaultOpponentStrumY1', 1, defaultOpponentStrumY1 + 18 * math.sin((currentBeat+1 *0.25) * math.pi), 0.01)
    noteTweenY('defaultOpponentStrumY2', 2, defaultOpponentStrumY2 + 18 * math.sin((currentBeat+2 *0.25) * math.pi), 0.01)
    noteTweenY('defaultOpponentStrumY3', 3, defaultOpponentStrumY3 + 18 * math.sin((currentBeat+3 *0.25) * math.pi), 0.01)

    noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 + 18 * math.sin((currentBeat+4 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
    noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)

    noteTweenX('defaultOpponentStrumX0', 0, defaultOpponentStrumX0 + 18 * math.sin((currentBeat+0 *0.25) * math.pi), 0.01)
    noteTweenX('defaultOpponentStrumX1', 1, defaultOpponentStrumX1 + 18 * math.sin((currentBeat+1 *0.25) * math.pi), 0.01)
    noteTweenX('defaultOpponentStrumX2', 2, defaultOpponentStrumX2 + 18 * math.sin((currentBeat+2 *0.25) * math.pi), 0.01)
    noteTweenX('defaultOpponentStrumX3', 3, defaultOpponentStrumX3 + 18 * math.sin((currentBeat+3 *0.25) * math.pi), 0.01)

    noteTweenX('defaultPlayerStrumX0', 4, defaultPlayerStrumX0 + 18 * math.sin((currentBeat+4 *0.25) * math.pi), 0.01)
    noteTweenX('defaultPlayerStrumX1', 5, defaultPlayerStrumX1 + 18 * math.sin((currentBeat+5 *0.25) * math.pi), 0.01)
    noteTweenX('defaultPlayerStrumX2', 6, defaultPlayerStrumX2 + 18 * math.sin((currentBeat+6 *0.25) * math.pi), 0.01)
    noteTweenX('defaultPlayerStrumX3', 7, defaultPlayerStrumX3 + 18 * math.sin((currentBeat+7 *0.25) * math.pi), 0.01)

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.15)
cameraSetTarget('dad')
setProperty('health', getProperty('health') - 0.1 * ((getProperty('health')/22))/6)
characterPlayAnim('gf', 'scared', true)
doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
end
function goodNoteHit(id, direction, noteType, isSustainNote)
cameraSetTarget('boyfriend')
setProperty('health', getProperty('health') + 10 * ((getProperty('health')/22))/6)
end
end