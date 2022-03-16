# NUI Dialog Box for FiveM [Standalone]
> ****An immersive dialog box with sounds and a simple but beautiful UI. I created this because of the very few options available out there. Using this utility will open a whole world of possibilities for your server and make your FiveM scripting easier. This is intended for advanced users who know a bit about coding.****

## [👋 Join my Discord for Support](https://discord.gg/f2Nbv9Ebf5)

## Preview
![image](https://user-images.githubusercontent.com/36258300/158611318-ddf9ba50-c036-45cb-baf4-11840e731a23.png)

[![DEMO VIDEO](https://img.youtube.com/vi/jW9cdENUoxo/0.jpg)](https://youtu.be/jW9cdENUoxo "DEMO VIDEO")

## Installation
- Download this and put it inside your resources folder ( ⚠️ DO NOT CHANGE THE RESOURCE NAME )
- Add this to your server.cfg: **`start an_dialogBox`**

## Usage
**add this somewhere in your code where you wanna trigger the dialog box**:
```lua
exports['an_dialogBox']:showDialog(name, label, input, help, submitFunc, cancelFunc)
```
- **`name`** **[REQUIRED]** A unique name for your dialog, can also be used to prevent people from injecting stuff to the dialog box with the NUI Dev Tools
- **`label`** **[REQUIRED]** The text that's gonna be shown as the title of the dialog form
- **`input`** **[REQUIRED]** The default typed text inside the input ( can be empty )
- **`help`** **[REQUIRED]** A little hint text below the text area
- **`submitFunc()`** **[REQUIRED]** This is the function that runs once the OK button is clicked or when you click ENTER. It takes the input text typed into that form as an argument.
- **`cancelFunc()`** [OPTIONAL] This is the function that runs once the Cancel button is clicked or the form is canceled. doesn't take any arguments and can be the function that runs if the player closes or cancel the dialog Box

## Debug
- Set **`debugMode`** on Line 14 of **`client.lua`** to **`true`**
- Use **`/testdialog`** command to test the demo dialog

## Example Code ( Easy to configure / Plug and Play )
> You can put it on any script and it's gonna work
```lua
RegisterCommand('example', function(src, args)
		exports['an_dialogBox']:showDialog('example_dialog', 'Enter your name:', '0', 'This is a hint example', onSubmit, onCancel)
end)
function onSubmit(data)
		print('You submitted the following text: ^1'..data)
end
function onCancel()
		print('CANCELED')
end
```
