-- Initialize window width, height variables
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


-- Override love initializer funtction
function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    fullscreen = false,
    resizable = false,
    vsync = true
    })
end

function love.draw()
    love.graphics.printf("Hello World!", 0, WINDOW_HEIGHT / 2 - 6, WINDOW_WIDTH, 'center')
end