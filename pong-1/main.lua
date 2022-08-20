--[[
1. Require push and debug
2. Initialize virtual window size variables
3. Set min and mag texture filtering to nearest neighbour
4. Set virtual window using push
5. Use push to draw in virtual window mode
6. Create exit and debug keybinding
]]

-- 1. Require push and debug
push = require('push')
debug = require('debug')


WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

-- 2. Initialize virtual window size variables
V_WINDOW_WIDTH = 432
V_WINDOW_HEIGHT = 243

function love.load()
    
    -- 3. Set min and mag texture filtering to nearest neighbour
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- 4. Set virtual window using push
    push:setupScreen(V_WINDOW_WIDTH, V_WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.draw()
    -- 5. Use push to draw in virtual window mode
    push:apply('start') -- Start virtual mode

    love.graphics.printf("Hello world!", 0, V_WINDOW_HEIGHT / 2 - 6, V_WINDOW_WIDTH, 'center')

    push:apply('end')   -- Exit virtual mode
end

-- 6. Create exit and debug keybinding
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == '`' then
        debug.debug()
    end
end
