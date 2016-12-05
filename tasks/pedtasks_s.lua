
-- setPedAimedAt (ped,x,y,z)
-- clearPedAimedAt (ped)
-- makePedWalkTo (ped,x,y,z,speed)
-- 

pedTasksT = {}

function pedTasksT.setPedAimedAt(ped,x,y,z)
setElementData(ped, "story.pedTasks.aimingAt", true)
setElementData(ped, "story.pedTasks.aimingAt.x", x)
setElementData(ped, "story.pedTasks.aimingAt.y", y)
setElementData(ped, "story.pedTasks.aimingAt.z", z)
end

function pedTasksT.clearPedAimedAt(ped)
setElementData(ped, "story.pedTasks.aimingAt", false)
setElementData(ped, "story.pedTasks.aimingAt.x", nil)
setElementData(ped, "story.pedTasks.aimingAt.y", nil)
setElementData(ped, "story.pedTasks.aimingAt.z", nil)
end

function pedTasksT.makePedWalkTo(ped,x,y,z,speed)
setElementData(ped, "story.pedTasks.walkingTo", true)
setElementData(ped, "story.pedTasks.walkingTo.x", x)
setElementData(ped, "story.pedTasks.walkingTo.y", y)
setElementData(ped, "story.pedTasks.walkingTo.z", z)
setElementData(ped, "story.pedTasks.walkingTo.speed", speed) -- 0-walk, 1-run, 2-sprint
end

function pedTasksT.clearPedWalkTo(ped) -- used to sync client-side finishing of walking
setElementData(ped, "story.pedTasks.walkingTo", false)
setElementData(ped, "story.pedTasks.walkingTo.x", nil)
setElementData(ped, "story.pedTasks.walkingTo.y", nil)
setElementData(ped, "story.pedTasks.walkingTo.z", nil)
setElementData(ped, "story.pedTasks.walkingTo.speed", nil) -- 0-walk, 1-run, 2-sprint
end

function pedTasksT.debug()
pedTasksT.debugPed = createPed( 0, 0,10,3 )
pedTasksT.makePedWalkTo(pedTasksT.debugPed,-5,23,3,1)
end

--addCommandHandler( "debug", pedTasksT.debug )

addEvent("story.pedTasks.clearPedWalkTo",true)
addEventHandler("story.pedTasks.clearPedWalkTo",root,pedTasksT.clearPedWalkTo)