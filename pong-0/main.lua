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
    love.graphics.printf(
        "Hello World!",
        0,                      -- x to 0, because we'll use alignment
        WINDOW_HEIGHT / 2 - 6,  -- -6, because 12 is the default font size
        WINDOW_WIDTH,           -- setting area for alignment
        'center')               -- applying alignment to center
end