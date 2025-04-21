--By whoopdeefuckindoo on discord, aka RedTheAnomaly

function love.load()

    require "const/const"
    require "const/worldgen"

end





























function love.update(dt)

    if(musicplay)then
        f:plays(muspiano)
    else
        f:stops()
    end


    if(anim==16)then

        if(animstage==1)then 
            mga_anim=mga1 
            mgag_anim=mgag1 
            irnanim=irn2
            animstage=2
        elseif(animstage==2)then 
            mga_anim=mga2 
            mgag_anim=mgag2 
            irnanim=irn3
            animstage=3
        elseif(animstage==3)then 
            mga_anim=mga3 
            mgag_anim=mgag3 
            irnanim=irn4
            animstage=4
        elseif(animstage==4)then 
            mga_anim=mga 
            mgag_anim=mgag 
            irnanim=irn1
            animstage=1
        end

        
    anim=0
    end
    anim=anim+1


    flc=flc+.05
    --while()

    mx=math.floor(love.mouse.getX()/24)
    my=math.floor(love.mouse.getY()/24)



    if(my>3)then
        if(uil>-16)then
            uil=uil-2
        end
    else
        if(uil<16)then
            uil=uil+2
        end
    end
 
    if(f:key("1"))then
        g_s=g_s-0.02
    end
    if(f:key("2"))then
        g_s=g_s+0.02
    end
    if(f:key("6"))then
        bgr=bgr+1
    end
    if(f:key("7"))then
        bgg=bgg+1
    end
    if(f:key("8"))then
        bgb=bgb+1
    end
    if(bgr>255)then
        bgr=-4
    end
    if(bgg>255)then
        bgg=-4
    end
    if(bgb>255)then
        bgb=-4
    end
    if(f:key("3"))then
        g_s=3
    end
    if(f:key("9"))then
        winsz=winsz+16
        love.window.setMode(winsz,winsz)

    end
    if(f:key("0"))then
        winsz=384
        love.window.setMode(winsz,winsz)
    end
    if(f:key("m"))then
        i=1
        while(i<=(ba+1))do
            amount[i]=999
            i=i+1
        end
        i=1
    end
    if(f:key("tab"))then
        ui_draw=false
    else
        ui_draw=true
    end



    function love.keyreleased(key)
        if(key=="q")then
            slc=slc-1
        end
        if(key=="e")then
            slc=slc+1
        end

        if(slc<1)then slc=ba end
        if(slc>ba)then slc=1 end

        if(key=="4")then
            if(airrender==false)then
                airrender=true
            else
                airrender=false
            end
        end
        if(key=="5")then
            if(musicplay==false)then
                musicplay=true
            else
                musicplay=false
            end
        end
     end

    if(love.mouse.isDown(1))then
        if(amount[slc+1]>0)then
            if(world.testchunk[mx+(my*16)+1]==0)then
                world.testchunk[mx+(my*16)+1]=slc
                amount[slc+1]=amount[slc+1]-1
            end
        end
    end

    if(love.mouse.isDown(2))then
        if(world.testchunk[mx+(my*16)+1]~=0)then
            amount[world.testchunk[mx+(my*16)+1]+1]=amount[world.testchunk[mx+(my*16)+1]+1]+1
            world.testchunk[mx+(my*16)+1]=0
        end
    end


end


































function love.draw()
    --j=1
    --draw a chunk (will be changed later to draw multiple chunks)


        render_chunk(world.testchunk, 0, 0)



    --draw block selection cursor (the big square one)
        f:rgb(255,math.cos(flc)*128+128,255)
        f:drawall(cur,mx*8+4,my*8+4,0,4,4,math.cos( flc)/4+1,math.cos(flc)/4+1)

    --draw ui, only if not pressing tab
        render_ui()

    --draw the cursor for everything other than block selection 
        f:rgb(255,math.cos(flc)*128+128,255)
        f:drawr(cur2,love.mouse.getX()/3,love.mouse.getY()/3,flc,4,4)

end