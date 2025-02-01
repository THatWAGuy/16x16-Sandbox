--By whoopdeefuckindoo on discord, aka RedTheAnomaly

function love.load()


    version="v1.0"


    pixelart=true

    require "lib/funktions"

    g_s=3
    g_x=0
    g_y=0

    world={}

    draw={l=0,c=0}

    f:font("spr/8bitoperator.ttf",16)

    muspiano=f:lsfx("sound/pianoalright.mp3")

    void=f:lspr("spr/block/void.png")
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
    mga=f:lspr("spr/block/magma.png")
    mgag=f:lspr("spr/block/magmagrass.png")
    air=f:lspr("spr/block/air.png")
    cur=f:lspr("spr/block/cursor.png")
    cur2=f:lspr("spr/block/cursor2.png")
    bg=f:lspr("spr/block/bg.png")

    slc=1

    winsz=384

    love.window.setMode(384,384)
    love.window.setTitle("16x16 Sandbox! "..version)
    love.window.setIcon(love.image.newImageData("spr/block/icon.png"))


    flc=0

    function bc(num)

        if(num==0)then return {0,255,0,"air",air} 
        elseif(num==1)then return {141,141,141,"stone",stn} 
        elseif(num==2)then return {151,105,73,"dirt",drt} 
        elseif(num==3)then return {60,126,31,"grass",grs} 
        elseif(num==4)then return {248,87,0,"magmite",mga} 
        elseif(num==5)then return {255,89,0,"fire grass",mgag} 


        else return {255,0,255,"error",ukn} end

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

end


function love.update()


    f:plays(muspiano)


    flc=flc+.05
    --while()

    mx=math.floor(love.mouse.getX()/24)
    my=math.floor(love.mouse.getY()/24)

    if(f:key("1"))then
        g_s=g_s-0.02
    end
    if(f:key("2"))then
        g_s=g_s+0.02
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


    function love.keyreleased(key)
        if(key=="-")then
            slc=slc-1
        end
        if(key=="=")then
            slc=slc+1
        end
     end

    if(love.mouse.isDown(1))then

        --flc=flc-.04

        --[[if(mx==0 and my==0)then]] 
        
        if(my==0)then world.testchunk[mx+1]=slc end
        if(my==1)then world.testchunk[mx+1+16]=slc end
        if(my==2)then world.testchunk[mx+1+32]=slc end
        if(my==3)then world.testchunk[mx+1+48]=slc end
        if(my==4)then world.testchunk[mx+1+64]=slc end
        if(my==5)then world.testchunk[mx+1+80]=slc end
        if(my==6)then world.testchunk[mx+1+96]=slc end
        if(my==7)then world.testchunk[mx+1+112]=slc end
        if(my==8)then world.testchunk[mx+1+128]=slc end
        if(my==9)then world.testchunk[mx+1+144]=slc end
        if(my==10)then world.testchunk[mx+1+160]=slc end
        if(my==11)then world.testchunk[mx+1+176]=slc end
        if(my==12)then world.testchunk[mx+1+192]=slc end
        if(my==13)then world.testchunk[mx+1+208]=slc end
        if(my==14)then world.testchunk[mx+1+224]=slc end
        if(my==15)then world.testchunk[mx+1+240]=slc end


        --[[elseif(mx==1 and my==0)then world.testchunk[2]=1 
        elseif(mx==2 and my==0)then world.testchunk[3]=1 
        elseif(mx==3 and my==0)then world.testchunk[4]=1 
        elseif(mx==4 and my==0)then world.testchunk[5]=1 
        elseif(mx==5 and my==0)then world.testchunk[6]=1 
        elseif(mx==6 and my==0)then world.testchunk[7]=1 
        elseif(mx==7 and my==0)then world.testchunk[8]=1 
        elseif(mx==8 and my==0)then world.testchunk[9]=1 
        elseif(mx==9 and my==0)then world.testchunk[10]=1 
        elseif(mx==10 and my==0)then world.testchunk[11]=1 
        elseif(mx==11 and my==0)then world.testchunk[12]=1 
        elseif(mx==12 and my==0)then world.testchunk[13]=1 
        elseif(mx==13 and my==0)then world.testchunk[14]=1 
        elseif(mx==14 and my==0)then world.testchunk[15]=1 
        elseif(mx==15 and my==0)then world.testchunk[16]=1 

        end]]

    end

    if(love.mouse.isDown(2))then
        --flc=flc-.04
        if(my==0)then world.testchunk[mx+1]=0 end
        if(my==1)then world.testchunk[mx+1+16]=0 end
        if(my==2)then world.testchunk[mx+1+32]=0 end
        if(my==3)then world.testchunk[mx+1+48]=0 end
        if(my==4)then world.testchunk[mx+1+64]=0 end
        if(my==5)then world.testchunk[mx+1+80]=0 end
        if(my==6)then world.testchunk[mx+1+96]=0 end
        if(my==7)then world.testchunk[mx+1+112]=0 end
        if(my==8)then world.testchunk[mx+1+128]=0 end
        if(my==9)then world.testchunk[mx+1+144]=0 end
        if(my==10)then world.testchunk[mx+1+160]=0 end
        if(my==11)then world.testchunk[mx+1+176]=0 end
        if(my==12)then world.testchunk[mx+1+192]=0 end
        if(my==13)then world.testchunk[mx+1+208]=0 end
        if(my==14)then world.testchunk[mx+1+224]=0 end
        if(my==15)then world.testchunk[mx+1+240]=0 end
    end


end

function love.draw()
    

    i=1
    draw={l=0,c=0}

    f:draw(bg,0,0)

    while(i<257)do
        
        if(world.testchunk[i]==1)then f:draw(out,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==0)then --[[f:draw(air,draw.l*8,draw.c*8)]] draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==2)then f:draw(outd,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==3)then f:draw(outg,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==4)then f:draw(outm,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==5)then f:draw(outmg,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
            
        else f:draw(outu,draw.l*8-2,draw.c*8-2) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        end

        i=i+1

    end

    i=1
    draw={l=0,c=0}

    while(i<257)do
        
        if(world.testchunk[i]==1)then f:draw(stn,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==0)then  draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==2)then f:draw(drt,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==3)then f:draw(grs,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==4)then f:draw(mga,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        elseif(world.testchunk[i]==5)then f:draw(mgag,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
            
        else f:draw(ukn,draw.l*8,draw.c*8) draw.l=draw.l+1 if(draw.l==16)then draw.l=0 draw.c=draw.c+1 end
        end

        i=i+1

    end

    f:rgb(255,math.sin(flc)*128+128,255)
    f:drawr(cur2,love.mouse.getX()/3,love.mouse.getY()/3,flc,4,4)
    f:drawall(cur,mx*8+4,my*8+4,0,4,4,math.cos(flc)/4+1,math.cos(flc)/4+1)

    --f:rgb(bc(slc)[1],bc(slc)[2],bc(slc)[3])
    f:rgb(0,0,0)
    f:print(slc..bc(slc)[4],10,0)
    f:rgb(255,math.sin(flc)*128+128,255)
    f:print(slc..bc(slc)[4],11,0)
    f:rgb(255,255,255)

    f:drawr(void,5,7,flc/2,5,5)
    f:drawr(bc(slc)[5],5,7,flc/2,4,4)


    --f:rect2(0,0,8,8)

    f:rgb(255,255,255)


end