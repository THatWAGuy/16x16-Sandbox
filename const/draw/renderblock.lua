function render_chunk(chunk,off_x,off_y)
    --render one 16*16 chunk of blocks, offset by off_x and off_y


    --set initial values
    i=1
    draw={l=0,c=0}

    --draw background
    f:rgb(bgr,bgg,bgb)
    f:draw(bg,off_x,off_y)

    --set color back to default
    f:rgb(255,255,255)

    --draw air (only if drawing air is enabled)
    while(i<257)do

        if(chunk[i]==0)then if(airrender)then f:draw(air,(draw.l*8)+off_x,(draw.c*8)+off_y) end draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end end

        i=i+1

    end

    --reset initial values
    i=1
    draw={l=0,c=0}

    --draw outlines
    while(i<257)do

        f:draw(bc(chunk[i])[6],(draw.l*8-2)+off_x,(draw.c*8-2)+off_y) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end

        i=i+1

    end

    --reset initial values
    i=1
    draw={l=0,c=0}

    --draw blocks
    while(i<257)do

        f:draw(bc(chunk[i])[5],(draw.l*8)+off_x,(draw.c*8)+off_y) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end

        i=i+1

    end


end