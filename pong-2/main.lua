push = require('push')
debug = require('debug')

WINDOW_WIDTH = 1280
WINDOW_HEIGHT= 720

V_WINDOW_WIDTH = 432
V_WINDOW_HEIGHT= 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(V_WINDOW_WIDTH, V_WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- 1. Import pixel font from a file
    pixel_font = love.graphics.newFont('font.ttf', 8)
end

function love.draw()
    push:apply('start')

    -- 2. Set background color to grey
    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    -- 3. Use font defined above
    love.graphics.setFont(pixel_font)

    -- 4. Draw 3 rectangles as paddles and a "ball"
    love.graphics.rectangle('fill', 10, 10, 5, 30)                                    -- First rectabgle near the left top corner
    love.graphics.rectangle('fill', V_WINDOW_WIDTH - 15, V_WINDOW_HEIGHT - 40, 5, 30) -- Second rectabgle in a mirrored position
    love.graphics.rectangle('fill', V_WINDOW_WIDTH / 2 - 2, V_WINDOW_HEIGHT / 2 - 2, 4, 4)

    love.graphics.printf("Hello world!", 0, V_WINDOW_HEIGHT / 3 - 6, V_WINDOW_WIDTH, 'center') -- Ball in the center

    push:apply('end')
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == '`' then
        debug.debug()
    end
end