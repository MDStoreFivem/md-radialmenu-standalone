Config = {}
Config.Keybind = 'F1' -- Change this to whatever key you want to use to open the menu
Config.DefaultMenu = {
    [1] = {
        id = 'general',
        title = 'General',
        icon = 'user',
        items = {
            {
                id = 'id_card',
                title = 'ID Card',
                icon = 'id-card',
                items = {
                    {
                        id = 'show_id',
                        title = 'Show ID',
                        icon = 'id-card',
                        items = {
                            {
                                id = 'show_id',
                                title = 'Show ID',
                                icon = 'id-card',
                                type = 'client',
                                event = 'qb-idcard:client:showID',
                                shouldClose = true
                            },
                            {
                                id = 'show_id2',
                                title = 'Show ID2',
                                icon = 'id-card',
                                items = {
                                    {
                                        id = 'test',
                                        title = 'test',
                                        icon = 'id-card',
                                        type = 'client',
                                        event = 'qb-idcard:client:showID2',
                                        shouldClose = true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    },
    [2] = {
        id = 'test2',
        title = 'test2',
        icon = 'car',
        event = 'qb-radialmenu:client:openMenusfegeg',
        shouldClose = false

    }
}