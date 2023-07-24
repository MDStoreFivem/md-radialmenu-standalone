# md-radialmenu
## Features
Standalone version of md-radial menu
- Check config for more details
- Exports used to add dynamic items to radial menu is AddOption to add a new option and RemoveOption to remove an option
- Deafult options can be added in the config
- The menu can be opened with the keybind set in the config
- this can run on any framework but you have to set config correctly
- Supports unlimited submenus

## MD STORE
- Discord: https://disocrd.gg/d9S2rS8ejy
- Tebex: https://mdstore.tebex.io/

## Usage
- AddOption example:
```lua
    exports['md-radialmenu']:AddOption(
        id = 'test', -- unique id of the option
        title = 'Test', -- title of the option
        icon = 'atom', -- icon of the option
        event = 'test', -- event to trigger when option is selected
        type = 'client', -- type of event (client/server/command)
        shouldClose = true, -- should the menu close when option is selected
    )
```
- RemoveOption example:
```lua
    exports['md-radialmenu']:RemoveOption('test') -- id of the option to remove
```

- AddOptions with submenu
```lua
    exports['md-radialmenu']:AddOption(
        id = 'test', -- unique id of the option
        title = 'Test', -- title of the option
        icon = 'atom', -- icon of the option
        event = 'test', -- event to trigger when option is selected
        type = 'client', -- type of event (client/server/command)
        shouldClose = true, -- should the menu close when option is selected
        items = {
            {
                id = 'test2', -- unique id of the option
                title = 'Test2', -- title of the option
                icon = 'atom', -- icon of the option
                event = 'test2', -- event to trigger when option is selected
                type = 'client', -- type of event (client/server/command)
                shouldClose = true, -- should the menu close when option is selected
            },
            {
                id = 'test3', -- unique id of the option
                title = 'Test3', -- title of the option
                icon = 'atom', -- icon of the option
                items = {
                    {
                        id = 'test4', -- unique id of the option
                        title = 'Test4', -- title of the option
                        icon = 'atom', -- icon of the option
                        event = 'test4', -- event to trigger when option is selected
                        type = 'client', -- type of event (client/server/command)
                        shouldClose = true, -- should the menu close when option is selected
                    },
                    {
                        id = 'test5', -- unique id of the option
                        title = 'Test5', -- title of the option
                        icon = 'atom', -- icon of the option
                        items = {
                            {
                                id = 'test6', -- unique id of the option
                                title = 'Test6', -- title of the option
                                icon = 'atom', -- icon of the option
                                event = 'test6', -- event to trigger when option is selected
                                type = 'client', -- type of event (client/server/command)
                                shouldClose = true, -- should the menu close when option is selected
                            },
                        },
                    },
                }
            }
        }
    )

```