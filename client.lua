-- Copyright 2022 © aymannajim (AN Services)
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

----- Made By https://a-n.tebex.io/
----- For Support, Join my Discord: https://discord.gg/KxdPzC5EeJ

-------------------------------------------------------------------------------
------------------------------- CONFIGURATION ---------------------------------
-------------------------------------------------------------------------------

local debugMode = true -- Enables a command " /testdialog " to test the script

-------------------------------------------------------------------------------
-------------------------------- DO NOT TOUCH ---------------------------------
-------------------------------------------------------------------------------

local dialogOpen = false
local currDialog = nil
local currFS = {}
local currFC = {}

function showDialog(name, label, input, help, submitFunc, cancelFunc, textarea)
	if not dialogOpen then
		currDialog = name
		currFS = submitFunc
		currFC = cancelFunc
		SetNuiFocus(true,true)
		if textarea == nil then
			textarea = false
		end
		SendNUIMessage({
			action = "showDialog",
			menuAction = name,
			label = label,
			defaultInput = input,
			helpText = help,
			textarea = textarea,
		})
		dialogOpen = true
	else
		print('^1dialog box already open!')
	end
end

RegisterNUICallback('exit', function(data)
    SetNuiFocus(false,false)
	if currFC ~= nil then
		currFC()
	end
	currDialog = nil
	currFS = nil
	currFC = nil
	dialogOpen = false
end)

RegisterNUICallback('submit', function(data)
	SetNuiFocus(false,false)
	dialogOpen = false
	if data.currMA == currDialog then -- This is to avoid the script being triggered by someone using FiveM's NUI Dev Tools
		local doSubmitFunction = currFS
		currDialog = nil
		currFS = nil
		currFC = nil
		doSubmitFunction(data.text)
	else
		-- add something here to warn admins about potential cheaters
	end
end)

-------------------------------------------------------------------------------
------------------------------ DEBUG AND TESTING ------------------------------
-------------------------------------------------------------------------------

if debugMode then
	RegisterCommand('testdialog', function(src, args)
		showDialog('unique_dialog_name', 'Enter amount of cash:', '0', 'Hint!', testFuncSubmit, testFuncCancel, true)
	end)
	function testFuncSubmit(data)
		print('You submitted the following text: ^1'..data)
	end
	function testFuncCancel()
		print('CANCELED')
	end
end

------------------------------

----- Made By https://a-n.tebex.io/
----- For Support, Join my Discord: https://discord.gg/KxdPzC5EeJ
