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

    require "../lib/funktions"

    require "../const/assets"

    require "../const/draw/renderblock"
    require "../const/draw/ui"

    g_s=3
    g_x=0
    g_y=0

    world={}

    player={x=60,y=60}

    draw={l=0,c=0}

    

    mgag_anim=mga
    mga_anim=mgag
    animstage=1

    slc=1

    winsz=384

    love.window.setMode(384,384)
    love.window.setTitle("16x16 Sandbox! "..version)
    love.window.setIcon(love.image.newImageData("spr/block/icon.png"))
    ba=10

    flc=0

    anim=0

    function no_interaction(x,y,w) --[[do nothing]] end

    function bc(num)
        --                    | color |name | sprites |inter| function to do              |
        if(num==0)then     return {0,255,0,"air",none,none,false, no_interaction()} 
        elseif(num==1)then return {141,141,141,"Stone",stn,out,false, no_interaction()} 
        elseif(num==2)then return {151,105,73,"Dirt",drt,outd,false, no_interaction()} 
        elseif(num==3)then return {60,126,31,"Grass",grs,outg,false, no_interaction()} 
        elseif(num==4)then return {248,87,0,"Magma stone",mga_anim,outm,false, no_interaction()} 
        elseif(num==5)then return {255,89,0,"Fire grass",mgag_anim,outmg,false, no_interaction()} 
        elseif(num==6)then return {255,89,0,"Planks",plk,plku,false, no_interaction()} 
        elseif(num==7)then return {255,89,0,"Bricks",brk,brku,false, no_interaction()} 
        elseif(num==8)then return {255,89,0,"Glass",gls,none,false, no_interaction()} 
        elseif(num==9)then return {255,89,0,"Iron",irnanim,irnu,false, no_interaction()} 
        elseif(num==10)then return {255,89,0,"Magma dirt",mgad,mgadu,false, no_interaction()} 


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

    amount={0,100,50,25,10,10,50,50,50,10,20}