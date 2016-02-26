
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 2

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- design resolution
CONFIG_SCREEN_WIDTH  = 1280
CONFIG_SCREEN_HEIGHT = 720

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_HEIGHT"

-- use framework, will disable all deprecated API, false - use legacy API
CC_USE_FRAMEWORK = true

-- show FPS on screen
CC_SHOW_FPS = true

-- disable create unexpected global variable
CC_DISABLE_GLOBAL = false

-- for module display
CC_DESIGN_RESOLUTION = {
    width = 720,
    height = 1280,
    autoscale = "FIXED_HEIGHT",
    callback = function(framesize)
        local ratio = framesize.width / framesize.height
        if ratio <= 1.34 then
            -- iPad 768*1024(1536*2048) is 4:3 screen
            return {autoscale = "FIXED_WIDTH"}
        end
    end
}

config = config or {};

config.Game = {
    Host = "",
    Name = "",
    Version = ""
    
}

config.AppState = {
    Main = 1,
    Game = 2
}

config.SocketEventType = {
    OnConnect = 0,
    OnMessage = 1,
    OnClose = 2
}

config.ButtonPlayPath = "Sound/ButtonClick.mp3";

config.StoreData = "store.data";

--性别
config.Sex = {
    Common = "Common",
    Male   = "Male", --男
    Female = "Female"  --女
}