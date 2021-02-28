﻿--coisas que eu preciso carregar antes de mostrar no jogo
function love.load()
  	love.window.setTitle('Explosive Balloon')
  
    pontos = 0
    balaoestado = 0
    nivel= 200
    velo_bg= 200
    x = 380 
	  y = 300
    --butao do menu
    ximg=300
    yimg=300
	  
    velo = 350
  	menustates=0
    gambiarra = 0
  	fundo = love.graphics.setBackgroundColor(87,194,221)
    font1 = love.graphics.newFont("fontes/HARNGTON.TTF", 35 )
  	font2 = love.graphics.newFont("fontes/HARNGTON.TTF", 48 )
  	--bg = love.graphics.newImage("imagens/nuvem_BG.png")
  	balao = love.graphics.newImage("imagens/balao_ver.png")
  	balaobaixo = love.graphics.newImage("imagens/balao_bai.png")
  	balaodir = love.graphics.newImage("imagens/balao_dir.png")
  	balaoesq = love.graphics.newImage("imagens/balao_esq.png")
  	espinho = love.graphics.newImage("imagens/espinhos.png")
  	fogo = love.graphics.newImage("imagens/fogo.png")
  	nuvens = love.graphics.newImage("imagens/cloud.png")
  	butao = love.graphics.newImage("menu/start.png")
    butao2 = love.graphics.newImage("menu/restart.png")
    --MUSICA DO JOGO
  	musicmenu = love.audio.newSource("audio/badass.mp3")
    xablau = love.audio.newSource("audio/balaosom.wav")
  	music= love.audio.newSource("audio/musica.wav")

  	nux1 = math.random( 0,200)
  	nux2 = math.random( 200,500)
  	nux3 = math.random( 500,700)
  	nux4 = math.random( 0,700 )
  	nuy1 = math.random(-400,-100 - nuvens:getWidth())
  	nuy2 = math.random(-300,-100 - nuvens:getWidth())
  	nuy3 = math.random(-200,-100 - nuvens:getWidth())
  	nuy4 = math.random(-500,-100 - nuvens:getWidth())
  	
  	espinhoy4 = math.random(-10,-300)
  	espinhoy3 = math.random(-10,-200)
  	espinhoy2 = math.random(-10,-100) 
  	espinhoy1 = math.random(-10,-100) 
  	espinhox1 = math.random(0,800 - espinho:getWidth())
  	espinhox2 = math.random(0,800 - espinho:getWidth())
  	espinhox3 = math.random(0,800 - espinho:getWidth())
  	espinhox4 = math.random(0,800 - espinho:getWidth())
    mouse = {}
    mouse.x = 0
    mouse.y = 0
end
 --tudo que quero que apareça na tela
function love.draw()
  if menustates==0 then
    love.graphics.getBackgroundColor(fundo)
    love.graphics.draw(nuvens ,nux1 , nuy1)
    love.graphics.draw(nuvens ,nux2 , nuy2)
    love.graphics.draw(nuvens ,nux3 , nuy3)
    love.graphics.draw(nuvens ,nux4 , nuy4)
    love.graphics.draw(butao,ximg,yimg)
    love.graphics.setColor(0,0,0)
    love.graphics.setFont(font2)
    love.graphics.print("press start ", 280,200)
    balao = love.graphics.newImage("imagens/balao_ver.png")
  else
	--love.graphics.print(balaoestado, 400,300)
  	love.graphics.getBackgroundColor(fundo)
  	love.graphics.draw(nuvens ,nux1 , nuy1)
  	love.graphics.draw(nuvens ,nux2 , nuy2)
  	love.graphics.draw(nuvens ,nux3 , nuy3)
  	love.graphics.draw(nuvens ,nux4 , nuy4)

  	if (balaoestado == 0) then
    	love.graphics.draw(balao , x , y)
	  end
	  if (balaoestado == 1) then
    	love.graphics.draw(balaodir, x, y)
	  end
	  if (balaoestado == 2) then
    	love.graphics.draw(balaoesq, x, y)
	  end
	  if (balaoestado == 3) then
		  love.graphics.draw(balaobaixo, x, y)
	  end
	    love.graphics.draw(espinho, espinhox1, espinhoy1)
      love.graphics.draw(espinho, espinhox2, espinhoy2)
      love.graphics.draw(espinho, espinhox3, espinhoy3)
      love.graphics.draw(espinho, espinhox4, espinhoy4)
	--fontes e pontos
	  if  balao ~= fogo and balaodir ~= fogo and balaoesq ~= fogo then
    	love.graphics.setColor(0,0,0)
      love.graphics.setFont(font1)
    	love.graphics.print('pontos : '.. pontos, 10, 560)
    else
      if gambiarra ~= 0 then
    	  love.graphics.setColor(0,0,0)
        love.graphics.setFont(font2)
    	  love.graphics.print('você fez '.. pontos.. ' pontos ',200,130)
        love.graphics.print("press space to restart",180,200)
      end
	  end
	  if pontos>= 60 then
  		love.graphics.setBackgroundColor(87,194 - 40,221)
	  end
	  if pontos>= 80 then
  		love.graphics.setColor(255,0,0)
      love.graphics.print('BALLOON MUST DIE!', 180,80)
  		love.graphics.setBackgroundColor(41,27,171)	
    end
    --love.graphics.print( nivel, 400, 300)   
  end
--coisas que  mudam com o passar do tempo
end
function love.update(dt)
    love.graphics.setColor(255,255,255)
  if menustates == 0 then
      love.audio.play(musicmenu)

      if mouse.x>= 300 and mouse.x<=500 and mouse.y>=300 and mouse.y<= 375 then
        menustates = 1
      end
      nuy1 = nuy1 + velo_bg*dt
      nuy2 = nuy2 + velo_bg*dt
      nuy3 = nuy3 + velo_bg*dt
      nuy4 = nuy4 + velo_bg*dt

      if nuy1 >= 600 then
        nuy1= math.random(-300,-100)
        nux1= math.random(0,200)
      end
      if nuy2 >= 600 then
        nuy2= math.random(-500,-300)
        nux2= math.random(200,500)
      end
      if nuy3 >= 600 then
        nuy3= math.random(-600,-500)
        nux3= math.random(500,700)
      end
      if nuy4 >= 600 then
        nuy4= math.random(-800,-600)
        nux4= math.random(0,750)
      end
  else
    --musica 
  	  love.audio.pause(musicmenu)
    if balao~=fogo or balaodir~=fogo or balaoesq~= fogo then
      love.audio.play(music)
  	else
    	love.audio.pause(music)
    	gambiarra= gambiarra +1
  	end
  	-- som da explosao(gambiarra serve pra explodir  so uma vez)
  	if balao==fogo and balaodir==fogo and balaoesq== fogo and gambiarra < 2 then
    	love.audio.play(xablau)
  	end
  	--velocidade das nuvens
  	if  balao ~= fogo and balaodir ~= fogo and balaoesq ~= fogo then
    	nuy1 = nuy1 + velo_bg*dt
    	nuy2 = nuy2 + velo_bg*dt
    	nuy3 = nuy3 + velo_bg*dt
    	nuy4 = nuy4 + velo_bg*dt
  	end
  	--velocidade  dos espinhos
  	if  gambiarra == 0 then
    	espinhoy1 = espinhoy1 + nivel*dt
    	espinhoy2 = espinhoy2 + nivel*dt
    	espinhoy3 = espinhoy3 + nivel*dt
    	espinhoy4 = espinhoy4 + nivel*dt
  	end
   	--looping de espinhos
    
  	if espinhoy1 >= 600 then
    	espinhoy1 = math.random(-100,-300)
    	espinhox1 = math.random(0,266)
    	pontos = pontos+1
      nivel= nivel+2
  	end
  	if espinhoy2 >= 600 then
    	espinhoy2 = math.random(-100,-300)
    	espinhox2 = math.random(266,532)
    	pontos = pontos+1
      nivel= nivel+2
  	end
  	if espinhoy3 >= 600 then
    	espinhoy3 = math.random(-100,-500)
    	espinhox3 = math.random(532,600)
    	pontos = pontos+1
      nivel= nivel+2
  	end
  	if espinhoy4 >= 600 then
    	espinhoy4 = math.random(-100,-500)
    	espinhox4 = math.random(0,700)
    	pontos = pontos+1
      nivel= nivel+2
  	end
  	--looping das nuvens
  	if nuy1 >= 600 then
    	nuy1= math.random(-300,-100)
    	nux1= math.random(0,200)
  	end
  	if nuy2 >= 600 then
    	nuy2= math.random(-500,-300)
    	nux2= math.random(200,500)
  	end
  	if nuy3 >= 600 then
    	nuy3= math.random(-600,-500)
    	nux3= math.random(500,700)
  	end
  	if nuy4 >= 600 then
    	nuy4= math.random(-800,-600)
    	nux4= math.random(0,750)
  	end
  
 	-- Colisao
 
 	  if  x >= (espinhox1-52) 
 	    and x <= (espinhox1 + espinho:getWidth()) 
  	  and y <= (espinhoy1 + espinho:getHeight()) 
 	    and y > espinhoy1 - espinho:getHeight() then
		    balao = fogo
    	  balaodir = fogo
	      balaoesq = fogo
        balaobaixo = fogo
	  end
  	if  x >= (espinhox2-52) 
  	  and x <= (espinhox2 + espinho:getWidth()) 
  	  and y <= (espinhoy2 + espinho:getHeight()) 
  	  and y > espinhoy2 -espinho:getHeight() then 
	  	  balao = fogo
 	  	  balaodir = fogo
	  	  balaoesq = fogo
        balaobaixo = fogo
    end
  	if  x >= (espinhox3-52)
  	  and x <= (espinhox3 + espinho:getWidth())
  	  and y <= (espinhoy3 + espinho:getHeight()) 
  	  and y > espinhoy3 -espinho:getHeight() then 
	  	  balao = fogo
 	  	  balaodir = fogo
	  	  balaoesq = fogo
        balaobaixo = fogo  
  	end
  	if  x >= (espinhox4-52)
  	  and x <= (espinhox4 + espinho:getWidth())
  	  and y <= (espinhoy4 + espinho:getHeight()) 
  	  and y > espinhoy4 -espinho:getHeight() then 
	  	  balao = fogo
 	  	  balaodir = fogo
	  	  balaoesq = fogo
        balaobaixo = fogo
  	end
 	--velocidade do background(antigo)
 	--if nivel ~= 0 then 
    	--ybg=ybg + velo_bg*dt 
    	--ybg2=ybg2 + velo_bg*dt
 	--end
  	--if ybg2>=0 then
    	--ybg=ybg2
    	--ybg2=ybg-1200
  	--end
  
  	--movimento do balão
  	if  gambiarra == 0 then
    	
    	if (love.keyboard.isDown("s") or love.keyboard.isDown("down")) and y < love.graphics.getHeight()-90 then
      		y = y + velo*dt
      		balaoestado = 3
    	elseif (love.keyboard.isDown("w") or love.keyboard.isDown("up")) and y > 5 then
          y = y - velo*dt
          balaoestado = 0
    	elseif (love.keyboard.isDown("a") or  love.keyboard.isDown("left")) and x > -1 then
      		x = x - velo*dt
      		balaoestado = 2
    	elseif (love.keyboard.isDown("d")  or love.keyboard.isDown("right")) and x < love.graphics.getWidth()-55 then
      		x = x + velo*dt
      		balaoestado = 1
    	else
      		balaoestado = 0
    	end
    end	
--MODO FACIL  
  	if pontos >= 5 then
    	nivel = 250
  	end
  	if pontos >= 10 then
  		nivel = 280
  	end
-- MODO MEDIO
  	if pontos >= 30 then
    	nivel = 350
  	end
  	if pontos >= 45 then
    	nivel = 400
  	end
  	if pontos >= 60 then
    	nivel = 450
  	end
--MODO DIFICIL
  	if pontos >= 75 then
    	nivel = 500
  	end
--MODO BALÃO MUST DIE
  	if pontos >= 80 then
        nivel = 600
    end   
  end
end  
function love.keypressed(key)
  if key == " " and gambiarra > 1 then
    menustates = 0
    restart()
  end
  if key == "escape" then
    love.event.quit()
  end
end
function restart()
   pontos = 0
    balaoestado = 0
    nivel= 200
    velo_bg= 200
    x = 380 
    y = 300
    ximg=300
    yimg=300
    mouse = {}
    mouse.x = 0
    mouse.y = 0
    velo = 350
    menustates=0
    gambiarra = 0
    fundo = love.graphics.setBackgroundColor(87,194,221)
    balao = love.graphics.newImage("imagens/balao_ver.png")
    balaobaixo = love.graphics.newImage("imagens/balao_bai.png")
    balaodir = love.graphics.newImage("imagens/balao_dir.png")
    balaoesq = love.graphics.newImage("imagens/balao_esq.png")
    fogo = love.graphics.newImage("imagens/fogo.png")
    music= love.audio.newSource("audio/musica.wav")
    musicmenu = love.audio.newSource("audio/badass.mp3")
    nux1 = math.random( 0,200)
    nux2 = math.random( 200,500)
    nux3 = math.random( 500,700)
    nux4 = math.random( 0,700 )
    nuy1 = math.random(-400,-100 - nuvens:getWidth())
    nuy2 = math.random(-300,-100 - nuvens:getWidth())
    nuy3 = math.random(-200,-100 - nuvens:getWidth())
    nuy4 = math.random(-500,-100 - nuvens:getWidth())
    espinhoy4 = math.random(-10,-300)
    espinhoy3 = math.random(-10,-200)
    espinhoy2 = math.random(-10,-100) 
    espinhoy1 = math.random(-10,-100) 
    espinhox1 = math.random(0,800 - espinho:getWidth())
    espinhox2 = math.random(0,800 - espinho:getWidth())
    espinhox3 = math.random(0,800 - espinho:getWidth())
    espinhox4 = math.random(0,800 - espinho:getWidth())
end
function love.mousepressed(x,y,button)
  if button == "l" and menustates == 0 then
    mouse.x = x
    mouse.y = y
  end
end