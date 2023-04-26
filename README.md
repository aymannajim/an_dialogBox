# NUI Dialog Box for FiveM [Standalone]
> ****An immersive dialog box with sounds and a simple but beautiful UI. I created this because of the very few options available out there. Using this utility will open a whole world of possibilities for your server and make your FiveM scripting easier. This is intended for advanced users who know a bit about coding.****

[![Join my Discord](https://img.shields.io/discord/1100609827715166258?color=5865f2&label=Discord&logo=https%3A%2F%2Fi.imgur.com%2Ftt5au4m.png&style=for-the-badge)](https://discord.gg/KxdPzC5EeJ)
## [👋 Join my Discord for Support](https://discord.gg/KxdPzC5EeJ)

## Preview
![image](https://user-images.githubusercontent.com/36258300/181438042-ce64a8ed-9895-409f-a8ea-b1eec148d2dd.png)
![image](https://user-images.githubusercontent.com/36258300/181438116-264b29d1-1456-43a1-873c-2249a00d2fbf.png)


[![DEMO VIDEO](https://img.youtube.com/vi/jW9cdENUoxo/0.jpg)](https://youtu.be/jW9cdENUoxo "DEMO VIDEO")

## Installation
- Download this and put it inside your resources folder ( ⚠️ DO NOT CHANGE THE RESOURCE NAME )
- Add this to your server.cfg: **`start an_dialogBox`**

## Usage
**add this somewhere in your code where you wanna trigger the dialog box**:
```lua
exports['an_dialogBox']:showDialog(name, label, input, help, submitFunc, cancelFunc, textarea)
```
- **`name`** **[REQUIRED]** A unique name for your dialog, can also be used to prevent people from injecting stuff to the dialog box with the NUI Dev Tools
- **`label`** **[REQUIRED]** The text that's gonna be shown as the title of the dialog form
- **`input`** **[REQUIRED]** The default typed text inside the input ( can be empty )
- **`help`** **[REQUIRED]** A little hint text below the text area
- **`submitFunc()`** **[REQUIRED]** This is the function that runs once the OK button is clicked or when you click ENTER. It takes the input text typed into that form as an argument.
- **`cancelFunc()`** [OPTIONAL] This is the function that runs once the Cancel button is clicked or the form is canceled. doesn't take any arguments and can be the function that runs if the player closes or cancel the dialog Box
- **`textarea`** [OPTIONAL] [BOOLEAN] If this is set to true, the text area will become bigger and resizable ( Very useful for long input )

## Debug
- Set **`debugMode`** on Line 14 of **`client.lua`** to **`true`**
- Use **`/testdialog`** command to test the demo dialog

## Example Code ( Easy to configure / Plug and Play )
> You can put it on any script and it's gonna work
```lua
RegisterCommand('example', function(src, args)
		exports['an_dialogBox']:showDialog('example_dialog', 'Enter your name:', '0', 'This is a hint example', onSubmit, onCancel, true)
end)
function onSubmit(data)
		print('You submitted the following text: ^1'..data)
end
function onCancel()
		print('CANCELED')
end
```
