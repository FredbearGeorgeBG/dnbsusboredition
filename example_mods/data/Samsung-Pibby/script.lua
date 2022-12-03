 local windowX = 0;
 local windowY = 0;
 local windowXPerm = 0;
 local windowYPerm = 0;
 local windowXscale
 local windowYscale
 local windowXscalePerm
 local windowYscalePerm

function onCreate()
  windowXPerm = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowYPerm = getPropertyFromClass('openfl.Lib', 'application.window.y')
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')


  windowXscalePerm = 1280
  windowYscalePerm = 720
  windowXscale = 1280
  windowYscale = 720

 local switch = false;
 local switchScale = false;
 local switchScaleY = false;
end

function windowMove()
        if windowXPerm - 200 > windowX then
        switch = true
        end
        if windowXPerm + 200 < windowX then 
        switch = false
        end
        if switch == false then
        windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
        setPropertyFromClass('openfl.Lib','application.window.x',windowX - 4)
        end
        if switch == true then
        windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
        setPropertyFromClass('openfl.Lib','application.window.x',windowX + 4)
        end
        
end

function windowZooming()
    if windowXscalePerm - 300 > windowXscale then
        switchScale = true
        end
        if windowXscalePerm + 300 < windowXscale then 
        switchScale = false
        end
        if windowYscalePerm - 300 > windowYscale then
        switchScaleY = true
        end
        if windowYscalePerm + 300 < windowYscale then 
        switchScaleY = false
        end

        
        if switchScale == false then
        windowXscale = windowXscale - 3
        end
        if switchScale == true then
        windowXscale = windowXscale + 3
        end
        if switchScaleY == false then
        windowYscale = windowYscale - 3
        end
        if switchScaleY == true then
        windowYscale = windowYscale + 3
        end

        resizeWindow(windowXscale, windowYscale)
end

function windowShake()
  windowX = getPropertyFromClass('openfl.Lib', 'application.window.x')
  windowY = getPropertyFromClass('openfl.Lib', 'application.window.y')
  setPropertyFromClass('openfl.Lib','application.window.x',windowX + math.random(-5,5))
  setPropertyFromClass('openfl.Lib','application.window.y',windowY + math.random(-5,5))
end


function onUpdate(elapsed)
  if(getPropertyFromClass('ClientPrefs', 'windowMove')) then
  --windowMove();
  --windowZooming();
  end

function opponentNoteHit()
   if(getPropertyFromClass('ClientPrefs', 'windowMove')) then
      windowShake()
    end
  end
end