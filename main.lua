--By whoopdeefuckindoo on discord, aka RedTheAnomaly

function love.load()

    ui_draw=true

    uil=-16

    love.mouse.setVisible(false)

    bgr=128
    bgg=255
    bgb=255

    version="v1.2.1 - The UI Update"

    airrender=false
    musicplay=true

    pixelart=true

    require "lib/funktions"

    g_s=3
    g_x=0
    g_y=0

    world={}

    player={x=60,y=60}

    draw={l=0,c=0}

    f:font("spr/8bitoperator.ttf",16)

    muspiano=f:lsfx("sound/pianoalright.mp3")

    ui1=f:lspr("spr/ui/ui1.png")
    ui2=f:lspr("spr/ui/ui2.png")
    slcspr=f:lspr("spr/ui/slc.png")

    void=f:lspr("spr/block/void.png")
    none=f:lspr("spr/block/none.png")
    out=f:lspr("spr/block/outl.png")
    outd=f:lspr("spr/block/outld.png")
    outg=f:lspr("spr/block/outlg.png")
    outm=f:lspr("spr/block/outlm.png")
    ukn=f:lspr("spr/block/unknown.png")
    outu=f:lspr("spr/block/outu.png")
    outmg=f:lspr("spr/block/outlmg.png")
    stn=f:lspr("spr/block/stone.png")
    drt=f:lspr("spr/block/dirt.png")
    grs=f:lspr("spr/block/grass.png")
    air=f:lspr("spr/block/air.png")
    cur=f:lspr("spr/block/cursor.png")
    cur2=f:lspr("spr/block/cursor2.png")
    bg=f:lspr("spr/block/bg.png")

    mga=f:lspr("spr/block/magma.png")
    mgag=f:lspr("spr/block/magmagrass.png")
    mga1=f:lspr("spr/block/magma1.png")
    mgag1=f:lspr("spr/block/magmagrass1.png")
    mga2=f:lspr("spr/block/magma2.png")
    mgag2=f:lspr("spr/block/magmagrass2.png")
    mga3=f:lspr("spr/block/magma3.png")
    mgag3=f:lspr("spr/block/magmagrass3.png")

    mgag_anim=mga
    mga_anim=mgag
    animstage=1

    slc=1

    winsz=384

    love.window.setMode(384,384)
    love.window.setTitle("16x16 Sandbox! "..version)
    love.window.setIcon(love.image.newImageData("spr/block/icon.png"))
    ba=5

    flc=0

    anim=0

    function bc(num)

        if(num==0)then return {0,255,0,"air",none,none} 
        elseif(num==1)then return {141,141,141,"Stone",stn,out} 
        elseif(num==2)then return {151,105,73,"Dirt",drt,outd} 
        elseif(num==3)then return {60,126,31,"Grass",grs,outg} 
        elseif(num==4)then return {248,87,0,"Magma stone",mga_anim,outm} 
        elseif(num==5)then return {255,89,0,"Fire grass",mgag_anim,outmg} 


        else return {255,0,255,"error",ukn,outu} end

    end

    function identify(xp,yp)
        return world.testchunk[xp+(yp*16)+1]
    end

    world.testchunk={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,
                     2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
                     2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,
                     1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
                    }

    amount={0,100,50,25,10,10}

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
            animstage=2
        elseif(animstage==2)then 
            mga_anim=mga2 
            mgag_anim=mgag2 
            animstage=3
        elseif(animstage==3)then 
            mga_anim=mga3 
            mgag_anim=mgag3 
            animstage=4
        elseif(animstage==4)then 
            mga_anim=mga 
            mgag_anim=mgag 
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
    

    i=1
    draw={l=0,c=0}

    f:rgb(bgr,bgg,bgb)
    f:draw(bg,0,0)
    f:rgb(255,255,255)

    while(i<257)do
        if(world.testchunk[i]==0)then if(airrender)then f:draw(air,draw.l*8,draw.c*8) end draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end end
        i=i+1
    end

    i=1
    draw={l=0,c=0}

    while(i<257)do
        
        --[[if(world.testchunk[i]==1)then f:draw(out,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==0)then draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==2)then f:draw(outd,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==3)then f:draw(outg,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==4)then f:draw(outm,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==5)then f:draw(outmg,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
            
        else f:draw(outu,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        end]]

        f:draw(bc(world.testchunk[i])[6],draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end

        i=i+1

    end

    i=1
    draw={l=0,c=0}

    while(i<257)do
        
        --[[if(world.testchunk[i]==1)then f:draw(stn,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==0)then if(airrender)then f:draw(air,draw.l*8,draw.c*8) end draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==2)then f:draw(drt,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==3)then f:draw(grs,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==4)then f:draw(mga,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==5)then f:draw(mgag,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
            
        else f:draw(ukn,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        end]]

        f:draw(bc(world.testchunk[i])[5],draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end

        i=i+1
    end
    f:rgb(255,math.cos(flc)*128+128,255)
    f:drawall(cur,mx*8+4,my*8+4,0,4,4,math.cos(flc)/4+1,math.cos(flc)/4+1)
    f:rgb(255,255,255)
    f:condraw(ui_draw,ui2,0,-16+uil)
    f:condraw(ui_draw,ui1,0,0)

    i=1
    while(i<=ba)do
        
        f:condraw(ui_draw,bc(i)[5],27+(10*i),-6+uil)
        if(i==slc)then
            f:condraw(ui_draw,slcspr,25+(10*i),-8+uil)
        end
        i=i+1
    end
    i=1
    while(i<=ba)do
        if(ui_draw)then
            f:rgb(0,0,0)
            love.graphics.print(amount[i+1],(32+(10*i))*g_s,(0+uil)*g_s)
            f:rgb(255,math.sin(flc)*128+128,255)
            love.graphics.print(amount[i+1],(33+(10*i))*g_s,(0+uil)*g_s)
        end
        i=i+1
    end
    --f:rgb(math.sin(flc)*128+128,128,0)
    f:rgb(255,math.sin(flc)*128+128,255)
    f:rgb(0,0,0)
    if(ui_draw)then
        love.graphics.print(bc(slc)[4],(21+uil)*g_s,0*g_s,0,2,2)
        love.graphics.print(amount[slc+1],8*g_s,20*g_s,0,2,2)
    end
    f:rgb(255,math.sin(flc)*128+128,255)
    if(ui_draw)then
        love.graphics.print(bc(slc)[4],(22+uil)*g_s,0*g_s,0,2,2)
        love.graphics.print(amount[slc+1],9*g_s,20*g_s,0,2,2)
    end
    f:rgb(255,255,255)
    if(ui_draw)then
    f:drawr(void,16,16,flc/2,5,5)
    f:drawr(bc(slc)[5],16,16,flc/2,4,4)
    end
    
    f:rgb(255,math.cos(flc)*128+128,255)
    f:drawr(cur2,love.mouse.getX()/3,love.mouse.getY()/3,flc,4,4)
    f:rgb(255,255,255)
    --if(my>2)then
    --f:rgb(bc(slc)[1],bc(slc)[2],bc(slc)[3])
    
    --end


    --f:rect2(0,0,8,8)

    f:rgb(255,255,255)

    --f:rgb(255,math.sin(flc)*128+128,255)
    --f:print(animstage..anim,0,0)

end