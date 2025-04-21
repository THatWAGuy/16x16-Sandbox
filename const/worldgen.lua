function testgen()


    height={}
    h=1
    pha=0
    nha=0
    
    while(h<511)do
    
        nha=pha+math.floor(love.math.random(-1,1))
    
        if(nha<pha and love.math.random()>0.5)then
            nha=nha+1
        elseif(nha>pha and love.math.random()>0.5)then
            nha=nha-1
        elseif(nha==pha)then end
    
        height[h]=nha
    
        pha=nha

        h=h+1
    
    end

    
end