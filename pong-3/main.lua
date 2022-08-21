push = require('push')
debug = require('debug')

-- Window dimension constant
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
V_WINDOW_WIDTH = 432
V_WINDOW_HEIGHT = 243

-- Paddle dimensions and position constants
PADDLE_HEIGHT = 30
PADDLE_WIDTH = 5
PADDLE_XMARGIN = 10
PADDLE_YMARGIN = 10
PADDLE1_X = PADDLE_XMARGIN
PADDLE2_X = V_WINDOW_WIDTH - PADDLE_WIDTH - PADDLE_XMARGIN
PADDLE_SPEED = 100

-- Ball dimensions and start position constants
BALL_WIDTH = 6
BALL_HEIGHT = 6
BALL_XSTART = V_WINDOW_WIDTH / 2 - BALL_WIDTH / 2
BALL_YSTART = V_WINDOW_HEIGHT / 2 - BALL_HEIGHT / 2

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(V_WINDOW_WIDTH, V_WINDOW_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- Variables for tracking paddle position 
    paddle1_y = PADDLE_YMARGIN
    paddle2_y = V_WINDOW_HEIGHT - PADDLE_HEIGHT - PADDLE_XMARGIN

    -- Variables for tracking ball position
    ball_x = BALL_XSTART
    ball_y = BALL_YSTART

    -- Variables for tracking score
    score1 = 0
    score2 = 0

    small_font = love.graphics.newFont('font.ttf', 8)
    score_font = love.graphics.newFont('font.ttf', 32)
end

function love.draw()
    push:apply('start')

    love.graphics.setFont(small_font)
    love.graphics.printf("Welcome to pong!", 0, V_WINDOW_HEIGHT/6-2, V_WINDOW_WIDTH, 'center')

    love.graphics.rectangle('fill', PADDLE1_X, paddle1_y, PADDLE_WIDTH, PADDLE_HEIGHT)
    love.graphics.rectangle('fill', PADDLE2_X, paddle2_y, PADDLE_WIDTH, PADDLE_HEIGHT)
    
    love.graphics.rectangle('fill', ball_x, ball_y, BALL_WIDTH, BALL_HEIGHT)

    -- love.graphics.rectangle('fill', V_WINDOW_WIDTH/2 -1, 0, 2, V_WINDOW_HEIGHT)
    -- love.graphics.rectangle('fill', 0, V_WINDOW_HEIGHT/2 - 1, V_WINDOW_WIDTH, 2)


    love.graphics.setFont(score_font)
    love.graphics.print(tostring(score1), V_WINDOW_WIDTH / 2 - 8 - 50, V_WINDOW_HEIGHT / 3)
    love.graphics.print(tostring(score1), V_WINDOW_WIDTH / 2 - 8 + 50, V_WINDOW_HEIGHT / 3)
    
    push:apply('end')
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        paddle1_y = paddle1_y - PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        paddle1_y = paddle1_y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') then
        paddle2_y = paddle2_y - PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        paddle2_y = paddle2_y + PADDLE_SPEED * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == '`' then
        debug.debug()
    end
end