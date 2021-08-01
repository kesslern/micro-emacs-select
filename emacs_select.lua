VERSION = "1.0.0"

local micro = import("micro")

local selecting = false

function emacsSelect(bp)
	if selecting then
		micro.InfoBar():Message("Ending emacs select mode")
  	bp.Cursor:ResetSelection()
		selecting = false
	else
		micro.InfoBar():Message("Starting emacs select mode")
		bp.Cursor:ResetSelection()
		bp.Cursor:SetSelectionStart(-bp.Cursor.Loc)
		bp.Cursor:SetSelectionEnd(-bp.Cursor.Loc)
		selecting = true
	end
end

function endEmacsSelect(bp, message)
	if selecting then
		selecting = false
		bp.Cursor:ResetSelection()
		if message then
			micro.InfoBar():Message("Ending emacs select mode")
		end
	end
end

function preCursorRight(bp)
	if selecting then
		bp:SelectRight()
		return false
	end
end

function preCursorLeft(bp)
	if selecting then
		bp:SelectLeft()
		return false
	end
end

function preCursorDown(bp)
	if selecting then
		bp:SelectDown()
		return false
	end
end

function preCursorUp(bp)
	if selecting then
		bp:SelectUp()
		return false
	end
end

function preCursorPageUp(bp)
	if selecting then
		bp:SelectPageUp()
		return false
	end
end

function preCursorPageDown(bp)
	if selecting then
		bp:SelectPageDown()
		return false
	end
end

function preStartOfText(bp)
	if selecting then
		bp:SelectToStartOfLine()
		return false
	end
end

function preEndOfLine(bp)
	if selecting then
		bp:SelectToEndOfLine()
		return false
	end
end

function preWordRight(bp)
	if selecting then
		bp:SelectWordRight()
		return false
	end
end

function preWordLeft(bp)
	if selecting then
		bp:SelectWordLeft()
		return false
	end
end

function preCursorStart(bp)
	if selecting then
		bp:SelectToStart()
		return false
	end
end

function preCursorEnd(bp)
	if selecting then
		bp:SelectToEnd()
		return false
	end
end

function onCopy(bp)
	endEmacsSelect(bp)
end

function onCut(bp)
	endEmacsSelect(bp)
end

function onEscape(bp)
	endEmacsSelect(bp, true)
end
