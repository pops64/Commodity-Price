local a=0;
local b=''
local function c(d,e,f,g)
  if g then 
    return{d/255,e/255,f/255,g}
  end;
  return{d/255,e/255,f/255}
end;
local h={white=c(255,255,255,1.00),blue=c(77,176,217,1.00),green=c(142,211,79,1.00),red=c(232,22,22,1.00),background={0.7454,0.7454,0.7454,1.0}}
function getColorEx(d,e,f,g)
  local i=type(d)if i=='table'then 
    d,e,f,g=unpack(d)
  end;
  if i=='string'and h and h[d]then 
    d,e,f,g=unpack(h[d])
  elseif i=='number'then 
  else 
    d,e,f,g=unpack(h.white)
  end;
  return d,e,f,g 
end;
local function j()
  local k={}
  local l=Class(k)
  k.CHANGED_CURRENTPRICELOCATIONNAME=1;
  k.CHANGED_CURRENTPRICE=2;
  k.CHANGED_MEANPRICESUM=4;
  k.CHANGED_MEANPRICECOUNT=8;
  k.CHANGED_HIGHESTPRICE=16;
  k.CHANGED_LOWESTPRICE=32;
  k.CHANGED_CURRENTTREND=64;
  k.POPULATED_ALL=127;
  k.TRENDING_DOWN=2;
  k.TRENDING_UP=4;
  k.GREATDEMAND=32;
  function k:new(m,n)
    local self={}setmetatable(self,n or l)
    self.changeFlags=0;
    self.populatedFlags=0;
    self.fillTypeId=m;
    return self 
  end;
  function k:setCurrentPriceLocationName(o)
    local p=false;
    if self.currentPriceLocationName~=o then
      self.currentPriceLocationName=o;
      self.changeFlags=bitOR(self.changeFlags,k.CHANGED_CURRENTPRICELOCATIONNAME)
      if self.currentPriceLocationName~=nil then
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_CURRENTPRICELOCATIONNAME)
      else 
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_CURRENTPRICELOCATIONNAME)
      end;
      p=true 
    end;
    return p 
  end;
  function k:setCurrentPrice(q,r)
    local p=false;
    if self.currentPrice~=q then 
      self.currentPrice=q;
      elf.changeFlags=bitOR(self.changeFlags,k.CHANGED_CURRENTPRICE)
      if self.currentPrice~=nil then 
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_CURRENTPRICE)
      else 
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_CURRENTPRICE)
      end;
      self:calculateHighestPrice()self:calculateLowestPrice()
      if r==true or r==nil then 
        self:addCurrentPriceToMean()
      end;
      p=true 
    end;
    return p 
  end;
  function k:setCurrentTrend(s)
    local p=false;
    if self.currentTrend~=s then 
      self.currentTrend=s;self.changeFlags=bitOR(self.changeFlags,k.CHANGED_CURRENTTREND)
      if self.currentTrend~=nil then
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_CURRENTTREND)
      else 
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_CURRENTTREND)
      end;
      p=true 
    end;
    return p 
  end;
  function k:getIsTrendingUp()
    local t=self.currentTrend~=nil and bitAND(self.currentTrend,k.TRENDING_UP)~=0;
    return t 
  end;
  function k:getIsTrendingDown()
    local u=self.currentTrend~=nil and bitAND(self.currentTrend,k.TRENDING_DOWN)~=0;
    return u 
  end;
  function k:getIsGreatDemand()
    local v=self.currentTrend~=nil and bitAND(self.currentTrend,k.GREATDEMAND)~=0;
    return v
  end;
  function k:addCurrentPriceToMean()
    self:setMeanPriceSumAndCount((self.meanPriceSum or 0)+self.currentPrice,(self.meanPriceCount or 0)+1)
  end;
  function k:setMeanPriceSumAndCount(w,x)
    local p=false;
    if self.meanPriceSum~=w then 
      self.meanPriceSum=w;
      self.changeFlags=bitOR(self.changeFlags,k.CHANGED_MEANPRICESUM)
      if self.meanPriceSum~=nil then 
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_MEANPRICESUM)
      else self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_MEANPRICESUM)
      end;
      p=true 
    end;
    if self.meanPriceCount~=x then
      self.meanPriceCount=x;self.changeFlags=bitOR(self.changeFlags,k.CHANGED_MEANPRICECOUNT)
      if self.meanPriceCount~=nil then
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_MEANPRICECOUNT)
      else 
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_MEANPRICECOUNT)
      end;
      p=true 
    end;
    return p 
  end;
  function k:setHighestPrice(y)
    local p=false;
    if self.highestPrice~=y then
      self.highestPrice=y;
      self.changeFlags=bitOR(self.changeFlags,k.CHANGED_HIGHESTPRICE)
      if self.highestPrice~=nil then 
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_HIGHESTPRICE)
      else
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_HIGHESTPRICE)
      end;
      p=true 
    end;
    return p 
  end;
  function k:calculateHighestPrice()
    if self.currentPrice~=nil and(self.highestPrice==nil or self.currentPrice>self.highestPrice)then
      self:setHighestPrice(self.currentPrice)
    end
  end;
  function k:setLowestPrice(z)
    local p=false;
    if self.lowestPrice~=z then 
      self.lowestPrice=z;
      self.changeFlags=bitOR(self.changeFlags,k.CHANGED_LOWESTPRICE)
      if self.lowestPrice~=nil then 
        self.populatedFlags=bitOR(self.populatedFlags,k.CHANGED_LOWESTPRICE)
      else 
        self.populatedFlags=bitAND(self.populatedFlags,k.POPULATED_ALL-k.CHANGED_LOWESTPRICE)
      end;
      p=true
    end;
    return p
  end;
  function k:calculateLowestPrice()
    if self.currentPrice~=nil and(self.lowestPrice==nil or self.currentPrice<self.lowestPrice)then
      self:setLowestPrice(self.currentPrice)
    end
  end;
  function k:update(o,q,A)
    if o~=nil then 
      self:setCurrentPriceLocationName(o)
    end;
    if q~=nil then
      self:setCurrentPrice(q,not A)
    end 
  end;
  return k
end;
local function B(k)
  local function C(D)
    return math.floor(D+0.5)
  end;
  local E={}
  local F=Class(E,k)
  E.displayNameColor={getColorEx('white')}
  E.lowestPriceColor={getColorEx('white')}
  E.meanPriceColor={getColorEx('white')}
  E.highestPriceColor={getColorEx('white')}
  function E:new(m)
    local self=E:superClass():new(m,F)
    local G=FillUtil.fillTypeIndexToDesc[m]
    if G~=nil then 
      self.name=G.name;
      self:setDisplayName(G.nameI18N)
    end;
    self:calculateFruitType()
    return self 
  end;
  function E:setDisplayName(H)
    local p=false;
    if self.displayName~=H then 
      self.displayName=H;
      self:calculateDisplayNameNormalized()
      p=true 
    end;
    return p
  end;
  function E:setCurrentPriceLocationName(o)
    local p=E:superClass().setCurrentPriceLocationName(self,o)
    if p then 
      self:calculateCurrentPriceLocationDisplayName()
    end;
    return p
  end;
  function E:setCurrentPrice(q,r)
    local p=E:superClass().setCurrentPrice(self,q,r)
    if p then
      self:calculateCurrentPriceNormalized()
      self:calculateDeviationPercent()
    end;
    return p 
  end;
  function E:setDisplayNameNormalized(I)
    local p=false;
    if self.displayNameNormalized~=I then 
      self.displayNameNormalized=I;
      p=true 
    end;
    return p
  end;
  function E:calculateDisplayNameNormalized()
    local p=false;
    local I;
    if self.displayName~=nil and self.literPerSqm~=nil then 
      I=string.format("%s (x%0.2f)",self.displayName,self.literPerSqm)
    else 
      I=self.displayName 
    end;
    self:setDisplayNameNormalized(I)
    return p
  end;
  function E:setLiterPerSqm(J)
    local p=false;
    if self.literPerSqm~=J then 
      self.literPerSqm=J;
      self:calculateDisplayNameNormalized()
      self:calculateCurrentPriceNormalized()
      self:calculateMeanPriceNormalized()
      self:calculateHighestPriceNormalized()
      self:calculateLowestPriceNormalized()
      p=true
    end;
    return p 
  end;
  function E:setSeedUsagePerSqm(K)
    local p=false;
    if self.seedUsagePerSqm~=K then 
      self.seedUsagePerSqm=K;
      p=true 
    end;
    return p
  end;
  function E:calculateFruitType()
    local L=FruitUtil.fillTypeToFruitType[self.fillTypeId]
    if L~=nil then 
      local M=FruitUtil.fruitIndexToDesc[L]
      if M~=nil then
        self:setLiterPerSqm(M.literPerSqm)
        self:setSeedUsagePerSqm(M.seedUsagePerSqm)
      end 
    end 
  end;
  function E:setCurrentPriceNormalized(N)
    local p=false;
    if self.currentPriceNormalized~=N then 
      self.currentPriceNormalized=N;
      p=true
    end;
    return p
  end;
  function E:calculateCurrentPriceNormalized()
    local N;
    if self.currentPrice~=nil and self.literPerSqm~=nil then
      N=self.currentPrice*self.literPerSqm 
    else 
      N=self.currentPrice or 0
    end;
    self:setCurrentPriceNormalized(N)
  end;
  function E:addCurrentPriceToMean()
    E:superClass().addCurrentPriceToMean(self)
    self:calculateMeanPrice()
  end;
  function E:setMeanPrice(O)
    local p=false;
    if self.meanPrice~=O then
      self.meanPrice=O;
      self:calculateMeanPriceNormalized()
      self:calculateDeviationPercent()
      p=true 
    end;
    return p 
  end;
  function E:calculateMeanPrice()
    local O;
    if self.meanPriceSum~=nil and self.meanPriceCount~=nil then
      O=self.meanPriceSum/self.meanPriceCount 
    else 
      O=0 
    end;
    self:setMeanPrice(O)
  end;
  function E:setMeanPriceNormalized(P)
    local p=false;
    if self.meanPriceNormalized~=P then
      self.meanPriceNormalized=P;
      p=true
    end;
    return p 
  end;
  function E:calculateMeanPriceNormalized()
    local P;
    if self.meanPrice~=nil and self.literPerSqm~=nil then
      P=self.meanPrice*self.literPerSqm 
    else 
      P=self.meanPrice or 0 
    end;
    self:setMeanPriceNormalized(P)
  end;
  function E:setCurrentPriceLocationDisplayName(Q)
    local p=false;
    if self.currentPriceLocationDisplayName~=Q then 
      self.currentPriceLocationDisplayName=Q;
      p=true
    end;
    return p
  end;
  function E:calculateCurrentPriceLocationDisplayName()
    local Q;
    if self.currentPriceLocationName~=nil then 
      Q=g_i18n:getText(self.currentPriceLocationName)
    else
      Q=g_i18n:getText("COMMODITYPRICES_NOLOCATIONS")
    end;
    self:setCurrentPriceLocationDisplayName(Q)
  end;
  function E:setMeanPriceSumAndCount(w,x)
    local p=E:superClass().setMeanPriceSumAndCount(self,w,x)
    if p then 
      self:calculateMeanPrice()
    end;
    return p
  end;
  function E:setHighestPrice(y)
    local p=E:superClass().setHighestPrice(self,y)
    if p then 
      self:calculateHighestPriceNormalized()
      self:calculateDeviationPercent()
    end;
    return p 
  end;
  function E:setHighestPriceNormalized(R)
    local p=false;
    if self.highestPriceNormalized~=R then 
      self.highestPriceNormalized=R;
      p=true 
    end;
    return p 
  end;
  function E:calculateHighestPriceNormalized()
    local R;
    if self.highestPrice~=nil and self.literPerSqm~=nil then 
      R=self.highestPrice*self.literPerSqm 
    else
      R=self.highestPrice or 0
    end;
    self:setHighestPriceNormalized(R)
  end;
  function E:setLowestPrice(z)
    local p=E:superClass().setLowestPrice(self,z)
    if p then 
      self:calculateLowestPriceNormalized()
      self:calculateDeviationPercent()
    end;
    return p
  end;
  function E:setLowestPriceNormalized(S)
    local p=false;
    if self.lowestPriceNormalized~=S then 
      self.lowestPriceNormalized=S;
      p=true
    end;
    return p
  end;
  function E:calculateLowestPriceNormalized()
    local S;
    if self.lowestPrice~=nil and self.literPerSqm~=nil then
      S=self.lowestPrice*self.literPerSqm 
    else 
      S=self.lowestPrice or 0 
    end;
    self:setLowestPriceNormalized(S)
  end;
  function E:setDeviationPercent(T)
    local p=false;
    if self.deviationPercent~=T then 
      self.deviationPercent=T;
      self:calculateDeviationPercentColor()
      p=true 
    end;
    return p
  end;
  function E:calculateDeviationPercent()
    local T;
    if self.currentPrice~=nil and self.meanPrice~=nil and self.highestPrice~=nil and self.lowestPrice~=nil then 
      if self.currentPrice>self.meanPrice then 
        T=C((self.currentPrice-self.meanPrice)/(self.highestPrice-self.meanPrice)*100)
      elseif self.currentPrice<self.meanPrice then 
        T=C((self.currentPrice-self.meanPrice)/(self.meanPrice-self.lowestPrice)*100)
      else 
        T=0 
      end 
    else 
      T=0 
    end;
    self:setDeviationPercent(T)
  end;
  function E:setCurrentTrend(s)
    local p=E:superClass().setCurrentTrend(self,s)
    if p then 
      self:calculateCurrentPriceColor()
      self:calculateCurrentPriceLocationDisplayNameColor()
    end;
    return p
  end;
  function E:setCurrentPriceLocationDisplayNameColor(U)
    local p=false;
    if self.currentPriceLocationDisplayNameColor~=U then 
      self.currentPriceLocationDisplayNameColor=U;
      p=true 
    end;
    return p 
  end;
  function E:calculateCurrentPriceLocationDisplayNameColor()
    local U;
    if self:getIsGreatDemand()then
      U={getColorEx('blue')}
    else U={getColorEx('white')}
    end;
    self:setCurrentPriceLocationDisplayNameColor(U)
  end;
  function E:setCurrentPriceColor(V)
    local p=false;if self.currentPriceColor~=V then self.currentPriceColor=V;p=true end;return p end;function E:calculateCurrentPriceColor()local V;if self:getIsTrendingUp()then V={getColorEx('green')}elseif self:getIsTrendingDown()then V={getColorEx('red')}else V={getColorEx('white')}end;self:setCurrentPriceColor(V)end;function E:setDeviationPercentColor(W)local p=false;if self.deviationPercentColor~=W then self.deviationPercentColor=W;p=true end;return p end;function E:calculateDeviationPercentColor()local W;if self.deviationPercent<0 then W={getColorEx('red')}elseif self.deviationPercent>0 then W={getColorEx('green')}else W={getColorEx('white')}end;self:setDeviationPercentColor(W)end;return E end;local function X(Y)local function C(D)return math.floor(D+0.5)end;function Y:parseX(Z)local _='l'local a0=nil;local a1=self.ParentAbsoluteWidth or 1;if type(Z)=='string'then Z=Z:gsub("^%s*(.-)%s*$","%1")_=Z:sub(-1):lower()if _=='r'or _=='c'or _=='l'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")else _='l'end;if Z:sub(-1)=='%'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")a0=a1*tonumber(Z)/100 elseif Z:sub(-2):lower()=='px'then Z=Z:sub(1,Z:len()-2):gsub("^%s*(.-)%s*$","%1")a0=self:pxToNormal(tonumber(Z),'x')else a0=tonumber(Z)end elseif Z~=nil then a0=tonumber(Z)end;if _=='r'then a0=a1+a0 elseif _=='c'then a0=a1*0.5+a0 end;return a0 end;function Y:parseWidth(Z)local a2=nil;if type(Z)=='string'then Z=Z:gsub("^%s*(.-)%s*$","%1")if Z:sub(-1)=='%'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")a2=(self.ParentAbsoluteWidth or 1)*tonumber(Z)/100 elseif Z:sub(-2):lower()=='px'then Z=Z:sub(1,Z:len()-2):gsub("^%s*(.-)%s*$","%1")a2=self:pxToNormal(tonumber(Z),'x')else a2=tonumber(Z)end elseif Z~=nil then a2=tonumber(Z)end;return a2 end;function Y:parseY(Z)local _='b'local a3=nil;local a4=Z;local a5=self.ParentAbsoluteHeight or 1;if type(Z)=='string'then Z=Z:gsub("^%s*(.-)%s*$","%1")_=Z:sub(-1):lower()if _=='t'or _=='m'or _=='b'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")else _='b'end;if Z:sub(-1)=='%'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")a3=a5*tonumber(Z)/100 elseif Z:sub(-2):lower()=='px'then Z=Z:sub(1,Z:len()-2):gsub("^%s*(.-)%s*$","%1")a3=self:pxToNormal(tonumber(Z),'y')else a3=tonumber(Z)end elseif Z~=nil then a3=tonumber(Z)end;if _=='t'then a3=a5+a3 elseif _=='m'then a3=a5*0.5+a3 end;return a3 end;function Y:parseHeight(Z)local a6=nil;if type(Z)=='string'then Z=Z:gsub("^%s*(.-)%s*$","%1")if Z:sub(-1)=='%'then Z=Z:sub(1,Z:len()-1):gsub("^%s*(.-)%s*$","%1")a6=(self.ParentAbsoluteHeight or 1)*tonumber(Z)/100 elseif Z:sub(-2):lower()=='px'then Z=Z:sub(1,Z:len()-2):gsub("^%s*(.-)%s*$","%1")a6=self:pxToNormal(tonumber(Z),'y')else a6=tonumber(Z)end elseif Z~=nil then a6=tonumber(Z)end;return a6 end;local a7=1920;local a8=1080;local a9=a7/a8;local aa=g_screenAspectRatio/a9;local ab=1;if g_screenWidth>a7 then ab=a7/g_screenWidth end;function Y:pxToNormal(ac,ad,ae)local af;if ad=='x'then af=ac/a7*ab else af=ac/a8*ab*aa end;if ae==nil or ae then af=self:getFullPx(af,ad)end;return af end;function Y:getFullPx(ag,ad)if ad=='x'then return C(ag*g_screenWidth)/g_screenWidth else return C(ag*g_screenHeight)/g_screenHeight end end;function Y:getPxToNormalConstant(ah,ai)return ah/g_screenWidth,ai/g_screenHeight end;function Y:getPxToNormalConstant(ah,ai)return ah/g_screenWidth,ai/g_screenHeight end end;local function aj(Y)Y.sorts={}Y.sorts["displayName"]=function(self,g,f)if g.displayName==f.displayName then return 0 elseif g.displayName<f.displayName then return 1 else return-1 end end;Y.sorts["currentPriceLocationDisplayName"]=function(self,g,f)if g.currentPriceLocationDisplayName==f.currentPriceLocationDisplayName then return 0 elseif g.currentPriceLocationDisplayName<f.currentPriceLocationDisplayName then return 1 else return-1 end end;Y.sorts["lowestPrice"]=function(self,g,f)local ak;local al;if self.player.normalizePrices then ak=g.lowestPriceNormalized else ak=g.lowestPrice end;if self.player.normalizePrices then al=f.lowestPriceNormalized else al=f.lowestPrice end;if ak==al then return 0 elseif ak>al then return 1 else return-1 end end;Y.sorts["meanPrice"]=function(self,g,f)local am;local an;if self.player.normalizePrices then am=g.meanPriceNormalized else am=g.meanPrice end;if self.player.normalizePrices then an=f.meanPriceNormalized else an=f.meanPrice end;if am==an then return 0 elseif am>an then return 1 else return-1 end end;Y.sorts["highestPrice"]=function(self,g,f)local ao;local ap;if self.player.normalizePrices then ao=g.highestPriceNormalized else ao=g.highestPrice end;if self.player.normalizePrices then ap=f.highestPriceNormalized else ap=f.highestPrice end;if ao==ap then return 0 elseif ao>ap then return 1 else return-1 end end;Y.sorts["currentPrice"]=function(self,g,f)local aq;local ar;if self.player.normalizePrices then aq=g.currentPriceNormalized else aq=g.currentPrice end;if self.player.normalizePrices then ar=f.currentPriceNormalized else ar=f.currentPrice end;if aq==ar then return 0 elseif aq>ar then return 1 else return-1 end end;Y.sorts["deviationPercent"]=function(self,g,f)if g.deviationPercent==f.deviationPercent then return 0 elseif g.deviationPercent>f.deviationPercent then return 1 else return-1 end end;Y.columnOrders={{"displayName"},{"currentPriceLocationDisplayName","displayName"},{"lowestPrice","deviationPercent","displayName"},{"meanPrice","deviationPercent","displayName"},{"highestPrice","deviationPercent","displayName"},{"currentPrice","deviationPercent","displayName"},{"deviationPercent","currentPrice"}}end;local function as(Y)function Y:mouseEvent(at,au,av,aw,ax)end;function Y:keyEvent(ay,az,aA,av)if az==Input.KEY_lshift then self.rightControlDown=av end;if az==Input.KEY_ralt then self.rightAltDown=av end;if az==Input.KEY_rshift then self.rightShiftDown=av end;if az==Input.KEY_rctrl and av and(aA==0 or self.rightControlDown)then self.accessKeyDownDt=self.dt;if self.isVisibleState==0 then self.isVisibleState=1 end elseif az==Input.KEY_rctrl and not av and self.accessKeyDownDt>0 then if self.isVisibleState==1 then if self.dt-self.accessKeyDownDt<=500 then self.isVisibleState=2 else self.isVisibleState=0 end elseif self.isVisibleState==2 and self.dt-self.accessKeyDownDt<=500 and not self.otherFunctionClicked then self.isVisibleState=0 end;self.accessKeyDownDt=0;InputBinding.setShowMouseCursor(false)self.otherFunctionClicked=false elseif az==Input.KEY_delete and self.accessKeyDownDt>0 and av then self:setNormalizePrices(not self.player.normalizePrices)self.otherFunctionClicked=true elseif az==Input.KEY_insert and self.accessKeyDownDt>0 and av then if self.player.orderBy>=7 then self:setOrderBy(1)else self:setOrderBy(self.player.orderBy+1)end;self.otherFunctionClicked=true elseif az==Input.KEY_right and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setHAlignment("right")elseif self.rightShiftDown then self:setBasePosX(self.player.basePosX+self:parseWidth('1px'))else self:setBasePosX(self.player.basePosX+self:parseWidth('10px'))end;self.otherFunctionClicked=true elseif az==Input.KEY_left and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setHAlignment("left")elseif self.rightShiftDown then self:setBasePosX(self.player.basePosX-self:parseWidth('1px'))else self:setBasePosX(self.player.basePosX-self:parseWidth('10px'))end;self.otherFunctionClicked=true elseif az==Input.KEY_up and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setVAlignment("top")elseif self.rightShiftDown then self:setBasePosY(self.player.basePosY+self:parseHeight('1px'))else self:setBasePosY(self.player.basePosY+self:parseHeight('10px'))end;self.otherFunctionClicked=true elseif az==Input.KEY_down and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setVAlignment("bottom")elseif self.rightShiftDown then self:setBasePosY(self.player.basePosY-self:parseHeight('1px'))else self:setBasePosY(self.player.basePosY-self:parseHeight('10px'))end;self.otherFunctionClicked=true elseif az==Input.KEY_pageup and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setBackgroundAlpha(self.player.backgroundAlpha+0.05)else self:setFontSize(self.player.fontSize+self:parseHeight('1px'))end;self.otherFunctionClicked=true elseif az==Input.KEY_pagedown and self.accessKeyDownDt>0 and av then if self.rightControlDown then self:setBackgroundAlpha(self.player.backgroundAlpha-0.05)else if self.player.fontSize>self:parseHeight('10px')then self:setFontSize(self.player.fontSize-self:parseHeight('1px'))end end;self.otherFunctionClicked=true end end end;local function aB(Y)Y.sortedCommodities={}Y.accessKeyDownDt=0;Y.isVisibleState=2;function Y:uiInit()self:setFontSize(0.01)self:setBasePosX(0.97708)self:setBasePosY(0.89583)self:setHAlignment("right")self:setVAlignment("top")self:setBackgroundAlpha(0.7)self:setNormalizePrices(true)self:setOrderBy(7)end;function Y:setNormalizePrices(aC)if self.player:setNormalizePrices(aC)then self.commoditiesDirty=true end end;function Y:setBackgroundAlpha(aD)if aD<0 then aD=0 elseif aD>1 then aD=1 end;if self.player:setBackgroundAlpha(aD)then self:calculateOverlayColor()end end;function Y:setBasePosX(at)if self.player:setBasePosX(at)then self:calculateAbsoluteX()end end;function Y:setHAlignment(aE)if self.player:setHAlignment(aE)then self:calculateAbsoluteX()end end;function Y:calculateAbsoluteX()local aF=self.player.basePosX;if self.player.hAlignment=="right"then aF=aF-self.width end;if self.absolutePosX~=aF then self.absolutePosX=aF;self:calculateOverlay()end end;function Y:setBasePosY(au)if self.player:setBasePosY(au)then self:calculateAbsoluteY()end end;function Y:setVAlignment(aG)if self.player:setVAlignment(aG)then self:calculateAbsoluteY()end end;function Y:calculateAbsoluteY()local aH=self.player.basePosY;if self.player.vAlignment=="top"then aH=aH-self.height end;if self.absolutePosY~=aH then self.absolutePosY=aH;self:calculateOverlay()end end;function Y:setFontSize(aI)if self.player:setFontSize(aI)then self:setOverlayPaddingX(getTextWidth(self.player.fontSize,'M')*0.5)self:setOverlayPaddingY(getTextHeight(self.player.fontSize,'M')*0.5)self:setColumnPaddingWidth(getTextWidth(self.player.fontSize,'   '))self:setLineHeight(getTextHeight(self.player.fontSize,'Wy'))self:calculateColumnWidths()end end;function Y:setOverlayPaddingX(aJ)if self.overlayPaddingX~=aJ then self.overlayPaddingX=aJ;self:calculateOverlay()end end;function Y:setOverlayPaddingY(aK)if self.overlayPaddingY~=aK then self.overlayPaddingY=aK;self:calculateOverlay()end end;function Y:setLineHeight(aL)if self.lineHeight~=aL then self.lineHeight=aL;self:calculateHeight()end end;function Y:setColumnPaddingWidth(aM)if self.columnPaddingWidth~=aM then self.columnPaddingWidth=aM;self:calculateWidth()end end;function Y:calculateWidth()local a2=0;for aN,aO in ipairs(self.columns)do a2=a2+(aO.width or 0)end;a2=a2+self.columnPaddingWidth*(#self.columns-1)if self.width~=a2 then self.width=a2;self:calculateAbsoluteX()self:calculateOverlay()end end;function Y:calculateHeight()local a6=self.lineHeight*(#self.sortedCommodities+1)if self.height~=a6 then self.height=a6;self:calculateAbsoluteY()self:calculateOverlay()end end;function Y:resetOverlay()if self.overlay~=nil then self.overlay:delete()self.overlay=nil end end;function Y:setOrderBy(aP)if self.player:setOrderBy(aP)then self.commoditiesDirty=true end end;function Y:calculateSortedCommodities()local aQ=null;if self.sortedCommodities~=nil then aQ=#self.sortedCommodities end;self.sortedCommodities={}for m,k in pairs(self.commodities)do table.insert(self.sortedCommodities,k)end;table.sort(self.sortedCommodities,function(g,f)for aN,aR in ipairs(self.columnOrders[self.player.orderBy])do local aS=self.sorts[aR](self,g,f)if aS~=0 then return aS<0 end end;return false end)if aQ~=#self.sortedCommodities then self:calculateHeight()end end;function Y:calculateColumnWidths()setTextBold(true)for aN,aO in ipairs(self.columns)do aO.width=getTextWidth(self.player.fontSize,aO.title)end;setTextBold(false)for aN,k in ipairs(self.sortedCommodities)do for aN,aO in ipairs(self.columns)do local a2=getTextWidth(self.player.fontSize,aO.displayValue(k))if a2>aO.width then aO.width=a2 end end end;self:calculateWidth()end;function Y:calculateOverlay()if self.overlay~=nil then self:resetOverlay()end;if self.absolutePosX~=nil and self.overlayPaddingX~=nil and self.absolutePosY~=nil and self.overlayPaddingY~=nil and self.width~=nil and self.height~=nil and self.player.backgroundAlpha~=nil then self.overlay=Overlay:new('CommodityPricesOverlay',self.path..'img/white.dds',self.absolutePosX-self.overlayPaddingX,self.absolutePosY-self.overlayPaddingY,self.width+self.overlayPaddingX*2,self.height+self.overlayPaddingY*1.25)setOverlayUVs(self.overlay.overlayId,0,0,0,1,1,0,1,1)self:calculateOverlayColor()end end;function Y:calculateOverlayColor()if self.overlay~=nil and self.player.backgroundAlpha~=nil then self.overlay:setColor(0.025,0.025,0.025,self.player.backgroundAlpha)end end;function Y:draw()if self.isVisibleState>0 then if self.commoditiesDirty then self:calculateSortedCommodities()self:calculateColumnWidths()self.commoditiesDirty=false end;if self.overlay~=nil then self.overlay:render()end;setTextBold(false)local aT=0;local aU=self.absolutePosY;for aN,k in ipairs(self.sortedCommodities)do local aV=self.absolutePosX;for aW,aO in ipairs(self.columns)do if aW>1 then aV=aV+self.columnPaddingWidth end;setTextColor(unpack(aO.color(k)))setTextAlignment(aO.alignment)if aO.alignment==RenderText.ALIGN_LEFT then renderText(aV,aU,self.player.fontSize,aO.displayValue(k))else renderText(aV+aO.width,aU,self.player.fontSize,aO.displayValue(k))end;aV=aV+aO.width end;aT=aT+1;aU=aU+self.lineHeight end;setTextBold(true)local aV=self.absolutePosX;for aW,aO in ipairs(self.columns)do if aW>1 then aV=aV+self.columnPaddingWidth end;if aW==self.player.orderBy then setTextColor(getColorEx('blue'))else setTextColor(getColorEx('white'))end;setTextAlignment(aO.alignment)if aO.alignment==RenderText.ALIGN_LEFT then renderText(aV,aU,self.player.fontSize,aO.title)else renderText(aV+aO.width,aU,self.player.fontSize,aO.title)end;aV=aV+aO.width end;aT=aT+1;aU=aU+self.lineHeight end end;Y.columns={{name="displayName",title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_COMMODITY"),displayValue=function(k)if Y.player.normalizePrices then return k.displayNameNormalized else return k.displayName end end,alignment=RenderText.ALIGN_LEFT,color=function(k)return k.displayNameColor end},{name="currentPriceLocationDisplayName",displayValue=function(k)return k.currentPriceLocationDisplayName end,alignment=RenderText.ALIGN_LEFT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_LOCATION"),color=function(k)return k.currentPriceLocationDisplayNameColor end},{name="lowestPrice",displayValue=function(k)if Y.player.normalizePrices then return g_i18n:formatMoney(k.lowestPriceNormalized,0,false)else return g_i18n:formatMoney(k.lowestPrice,0,false)end end,alignment=RenderText.ALIGN_RIGHT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_LOW"),color=function(k)return k.lowestPriceColor end},{name="meanPrice",displayValue=function(k)if Y.player.normalizePrices then return g_i18n:formatMoney(k.meanPriceNormalized,0,false)else return g_i18n:formatMoney(k.meanPrice,0,false)end end,alignment=RenderText.ALIGN_RIGHT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_MEAN"),color=function(k)return k.meanPriceColor end},{name="highestPrice",displayValue=function(k)if Y.player.normalizePrices then return g_i18n:formatMoney(k.highestPriceNormalized,0,false)else return g_i18n:formatMoney(k.highestPrice,0,false)end end,alignment=RenderText.ALIGN_RIGHT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_HIGH"),color=function(k)return k.highestPriceColor end},{name="currentPrice",displayValue=function(k)if Y.player.normalizePrices then return g_i18n:formatMoney(k.currentPriceNormalized,0,false)else return g_i18n:formatMoney(k.currentPrice,0,false)end end,alignment=RenderText.ALIGN_RIGHT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_CURRENT"),color=function(k)return k.currentPriceColor end},{name="deviationPercent",displayValue=function(k)return string.format("%0.0f",k.deviationPercent)end,alignment=RenderText.ALIGN_RIGHT,title=g_i18n:getText("COMMODITYPRICES_COLUMN_TITLE_PERCENTDEVIATION"),color=function(k)return k.deviationPercentColor end}}Y:uiInit()end;local function aX(aY,aZ,a_,b0,b1)local E=B(a_)local Y={path=aY,commodities={},commoditiesDirty=false,gameTime=0,dt=0,firstLoad=true,lastSyncTime=0,player=b1:new(''),clientToServerUpdateInterval=1000}function Y:getExistingCommodity(m)return self.commodities[m]end;function Y:getCommodity(m)local k=self.commodities[m]if k==nil then k=E:new(m)self.commodities[m]=k end;return k end;function Y:syncCommodity(m,o,q,w,x,y,z,s,b2)local k=self:getCommodity(m)k:update(o,q,true)if s~=nil then k:setCurrentTrend(s)end;if w~=nil and x~=nil then k:setMeanPriceSumAndCount(w,x)end;if y~=nil then k:setHighestPrice(y)end;if z~=nil then k:setLowestPrice(z)end;if s~=nil then k:setCurrentTrend(s)end;if k.changeFlags~=0 then self.commoditiesDirty=true end;k.changeFlags=0;return k end;function Y:updateCommodities()local b3=true;for m,G in pairs(FillUtil.fillTypeIndexToDesc)do if G.showOnPriceTable then local k=self:getExistingCommodity(m)if k==nil then aZ:sendRequest(m)b3=false end end end;if b3 then self.initialSyncDone=true end end;function Y:initialServerUpdates()if not self.initialSyncDone then self:updateCommodities()end end;function Y:serverUpdates()if self.player.nickname==''then self.player.changeFlags=self.player.populatedFlags end;if self.player.changeFlags~=0 then b0:sendUpdate(self.player,self.clientToServerUpdateInterval,false)self.player.changeFlags=0 end end;function Y:update(b4)self.dt=self.dt+b4;self.gameTime=g_currentMission.environment.dayTime+g_currentMission.environment.currentDay*24*60*60*1000;self.lastSyncTime=self.lastSyncTime+b4;if self.lastSyncTime>=self.clientToServerUpdateInterval then self:initialServerUpdates()self:serverUpdates()self.lastSyncTime=0 end end;function Y:minuteChanged()self:updateCommodities()end;function Y:deleteMap()end;function Y:loadMap(b5)self.isClient=g_currentMission:getIsClient()self.isServer=g_currentMission:getIsServer()self.isDedicated=g_dedicatedServerInfo~=nil end;function Y:updatePlayer(b6,aI,b7,b8,aE,aG,aD,aC,aP)if b6~=nil then self.player.nickname=b6 end;if aI~=nil then self:setFontSize(aI)end;if b7~=nil then self:setBasePosX(b7)end;if b8~=nil then self:setBasePosY(b8)end;if aE~=nil then self:setHAlignment(aE)end;if aG~=nil then self:setVAlignment(aG)end;if aD~=nil then self:setBackgroundAlpha(aD)end;if aC~=nil then self:setNormalizePrices(aC)end;if aP~=nil then self:setOrderBy(aP)end;self.player.changeFlags=0 end;X(Y)aj(Y)as(Y)aB(Y)addModEventListener(Y)return Y end;local function b9(ba,b1)function ba:saveCommodity(bb,bc,bd,k)local be=string.format(bc..".Commodity(%d)",bd)setXMLInt(bb,be.."#fillTypeId",k.fillTypeId)setXMLFloat(bb,be.."#meanPriceSum",k.meanPriceSum)setXMLFloat(bb,be.."#meanPriceCount",k.meanPriceCount)setXMLFloat(bb,be.."#highestPrice",k.highestPrice)setXMLFloat(bb,be.."#lowestPrice",k.lowestPrice)end;function ba:saveCommodities(bb,bf)local bc=bf..".Commodities"local bd=0;for aN,k in pairs(self.commodities)do self:saveCommodity(bb,bc,bd,k)bd=bd+1 end end;function ba:savePlayer(bb,bg,bh,bi)local bj=string.format(bg..".Player(%d)",bh)setXMLString(bb,bj.."#nickname",bi.nickname)setXMLFloat(bb,bj.."#fontSize",bi.fontSize)setXMLFloat(bb,bj.."#basePosX",bi.basePosX)setXMLFloat(bb,bj.."#basePosY",bi.basePosY)setXMLString(bb,bj.."#hAlignment",bi.hAlignment)setXMLString(bb,bj.."#vAlignment",bi.vAlignment)setXMLFloat(bb,bj.."#backgroundAlpha",bi.backgroundAlpha)setXMLInt(bb,bj.."#orderBy",bi.orderBy)setXMLBool(bb,bj.."#normalizePrices",bi.normalizePrices)end;function ba:savePlayers(bb,bf)local bg=bf..".Players"local bh=0;for aN,bi in pairs(self.players)do self:savePlayer(bb,bg,bh,bi)bh=bh+1 end end;function ba:saveSavegameToFile(bb)local bf="CommodityPrices"setXMLInt(bb,bf.."#serverToClientUpdateInterval",self.serverToClientUpdateInterval)setXMLInt(bb,bf.."#clientToServerUpdateInterval",self.clientToServerUpdateInterval)self:savePlayers(bb,bf)self:saveCommodities(bb,bf)end;function ba:saveSavegame()local bf="CommodityPrices"local bb=createXMLFile("CommodityPrices.xml",g_currentMission.missionInfo.savegameDirectory..'/CommodityPrices.xml',bf)self:saveSavegameToFile(bb)saveXMLFile(bb)end;function ba:loadCommodity(bb,bc,bd)local be=string.format(bc..".Commodity(%d)",bd)local bk=false;local m=getXMLInt(bb,be.."#fillTypeId")if m~=nil then self:syncCommodity(m,getXMLFloat(bb,be.."#currentPriceLocationName"),getXMLFloat(bb,be.."#currentPrice"),getXMLFloat(bb,be.."#meanPriceSum"),getXMLFloat(bb,be.."#meanPriceCount"),getXMLFloat(bb,be.."#highestPrice"),getXMLFloat(bb,be.."#lowestPrice"))bk=true end;return bk end;function ba:loadCommodities(bb,bf)local bc=bf..".Commodities"self.commodities={}local bd=0;while self:loadCommodity(bb,bc,bd)do bd=bd+1 end end;function ba:loadPlayer(bb,bg,bh)local bj=string.format(bg..".Player(%d)",bh)local bk=false;local b6=getXMLString(bb,bj.."#nickname")if b6~=nil then local bi=b1:new(b6)bi:setFontSize(Utils.getNoNil(getXMLFloat(bb,bj.."#fontSize"),0.01))bi:setBasePosX(Utils.getNoNil(getXMLFloat(bb,bj.."#basePosX"),0.97708))bi:setBasePosY(Utils.getNoNil(getXMLFloat(bb,bj.."#basePosY"),0.89583))bi:setHAlignment(Utils.getNoNil(getXMLString(bb,bj.."#hAlignment"),"right"))bi:setVAlignment(Utils.getNoNil(getXMLString(bb,bj.."#vAlignment"),"top"))bi:setBackgroundAlpha(Utils.getNoNil(getXMLFloat(bb,bj.."#backgroundAlpha"),0.7))bi:setNormalizePrices(Utils.getNoNil(getXMLBool(bb,bj.."#normalizePrices"),true))bi:setOrderBy(Utils.getNoNil(getXMLInt(bb,bj.."#orderBy"),7))self.players[bi.nickname]=bi;bk=true end;return bk end;function ba:loadPlayers(bb,bf)local bg=bf..".Players"self.players={}local bh=0;while self:loadPlayer(bb,bg,bh)do bh=bh+1 end end;function ba:loadSavegameFromFile(bb)local bf="CommodityPrices"self.serverToClientUpdateInterval=Utils.getNoNil(getXMLInt(bb,bf.."#serverToClientUpdateInterval"),1000)self.clientToServerUpdateInterval=Utils.getNoNil(getXMLInt(bb,bf.."#clientToServerUpdateInterval"),1000)self:loadPlayers(bb,bf)self:loadCommodities(bb,bf)self.firstLoad=true end;function ba:loadSavegame()local bf="CommodityPrices"local bk=false;if g_currentMission.missionInfo.savegameDirectory and fileExists(g_currentMission.missionInfo.savegameDirectory..'/CommodityPrices.xml')then local bb=loadXMLFile("CommodityPrices.xml",g_currentMission.missionInfo.savegameDirectory..'/CommodityPrices.xml')self:loadSavegameFromFile(bb)bk=true end;return bk end;g_careerScreen.saveSavegame=Utils.appendedFunction(g_careerScreen.saveSavegame,function()ba:saveSavegame()end)end;local function bl(aY,bm,a_,b0,b1)local ba={path=aY,commodities={},players={},gameTime=0,dt=0,firstLoad=true,serverToClientUpdateInterval=1000,clientToServerUpdateInterval=1000}function ba:getBestLocationInfo(m)local q=0;local o=nil;local s=nil;for bn,aN in pairs(g_currentMission.tipTriggers)do if bn.acceptedFillTypes[m]then local bo=bn:getEffectiveFillTypePrice(m)*1000;if bo>q then q=bo;o=bn.stationName;s=bn:getCurrentPricingTrend(m)end end end;return math.floor(q),o,s end;function ba:getExistingCommodity(m)local k=self.commodities[m]return k end;function ba:getCommodity(m)local k=self.commodities[m]if k==nil then k=a_:new(m)self.commodities[m]=k end;return k end;function ba:syncCommodity(m,o,q,w,x,y,z,b2)local k=self:getCommodity(m)if o~=nil and q~=nil then k:update(o,q,true)end;if w~=nil and x~=nil then k:setMeanPriceSumAndCount(w,x)end;if y~=nil then k:setHighestPrice(y)end;if z~=nil then k:setLowestPrice(z)end;return k end;function ba:updateCommodity(m)local p=false;local k=self:getCommodity(m)local q,o,s=self:getBestLocationInfo(m)k:update(o,q)k:setCurrentTrend(s)end;function ba:updateCommodities()for m,G in pairs(FillUtil.fillTypeIndexToDesc)do if G.showOnPriceTable then self:updateCommodity(m)elseif self.commodities[m]~=nil then self.commodities[m]=nil end end end;function ba:update(b4)self.dt=self.dt+b4;self.gameTime=g_currentMission.environment.dayTime+g_currentMission.environment.currentDay*24*60*60*1000;if self.lastSyncTime~=nil then self.lastSyncTime=self.lastSyncTime+b4 end;if self.firstLoad then if self.lastUpdateTime==nil then self.lastUpdateTime=self.gameTime end;if self.gameTime-self.lastUpdateTime>=500 then self.firstLoad=nil;self.lastUpdateTime=self.gameTime;self:updateCommodities()self.lastSyncTime=0 end elseif self.lastSyncTime~=nil and self.lastSyncTime>=self.serverToClientUpdateInterval then for aN,k in pairs(self.commodities)do if k.changeFlags>0 then bm:sendUpdate(k)k.changeFlags=0 end end;for aN,bi in pairs(self.players)do if bi.changeFlags~=0 then b0:sendUpdate(bi,self.clientToServerUpdateInterval,true)bi.changeFlags=0 end end;self.lastSyncTime=0 end end;function ba:updatePlayer(b6,aI,b7,b8,aE,aG,aD,aC,aP,bp)local bi=self.players[b6]local bq=false;if bi==nil then bi=b1:new(b6)self.players[bi.nickname]=bi;bq=true end;if bq or not bp then if aI~=nil then bi:setFontSize(aI)end;if b7~=nil then bi:setBasePosX(b7)end;if b8~=nil then bi:setBasePosY(b8)end;if aE~=nil then bi:setHAlignment(aE)end;if aG~=nil then bi:setVAlignment(aG)end;if aD~=nil then bi:setBackgroundAlpha(aD)end;if aC~=nil then bi:setNormalizePrices(aC)end;if aP~=nil then bi:setOrderBy(aP)end end;if bp then bi.changeFlags=bi.POPULATED_ALL elseif not bq then bi.changeFlags=0 end end;function ba:minuteChanged()self:updateCommodities()end;function ba:deleteMap()end;function ba:loadMap(b5)self.isClient=g_currentMission:getIsClient()self.isServer=g_currentMission:getIsServer()self.isDedicated=g_dedicatedServerInfo~=nil;self:loadSavegame()g_currentMission.environment:addMinuteChangeListener(self)end;function ba:draw()end;function ba:mouseEvent(at,au,av,aw,ax)end;function ba:keyEvent(ay,az,aA,av)end;addModEventListener(ba)b9(ba,b1)return ba end;local function br()local bs={}local bt=Class(bs,Event)function bs:emptyNew()local self=Event:new(bt)return self end;function bs:new(m)local self=bs:emptyNew()self.fillTypeId=m;return self end;function bs:readStream(bu,bv)self.fillTypeId=streamReadFloat32(bu)self:run(bv)end;function bs:writeStream(bu,bv)streamWriteFloat32(bu,self.fillTypeId)end;function bs:run(bv)local k=CommodityPricesServer:getExistingCommodity(self.fillTypeId)if k~=nil then k.changeFlags=k.populatedFlags end end;function bs:sendRequest(m)local bw=bs:new(m)g_client:getServerConnection():sendEvent(bw)end;InitEventClass(bs,"CommodityPricesRequestEvent")return bs end;local function bx(aZ,a_)local by={}local bz=Class(by,Event)function by:emptyNew()local self=Event:new(bz)return self end;function by:readStream(bu,bv)self.fillTypeId=streamReadFloat32(bu)self.changeFlags=streamReadInt32(bu)if bitAND(self.changeFlags,a_.CHANGED_CURRENTPRICELOCATIONNAME)~=0 then self.currentPriceLocationName=streamReadString(bu)end;if bitAND(self.changeFlags,a_.CHANGED_CURRENTPRICE)~=0 then self.currentPrice=streamReadFloat32(bu)end;if bitAND(self.changeFlags,a_.CHANGED_MEANPRICESUM)~=0 then self.meanPriceSum=streamReadFloat32(bu)end;if bitAND(self.changeFlags,a_.CHANGED_MEANPRICECOUNT)~=0 then self.meanPriceCount=streamReadFloat32(bu)end;if bitAND(self.changeFlags,a_.CHANGED_HIGHESTPRICE)~=0 then self.highestPrice=streamReadFloat32(bu)end;if bitAND(self.changeFlags,a_.CHANGED_LOWESTPRICE)~=0 then self.lowestPrice=streamReadFloat32(bu)end;if bitAND(self.changeFlags,a_.CHANGED_CURRENTTREND)~=0 then self.currentTrend=streamReadFloat32(bu)end;self:run(bv)end;function by:writeStream(bu,bv)streamWriteFloat32(bu,self.fillTypeId)streamWriteInt32(bu,self.changeFlags)if bitAND(self.changeFlags,a_.CHANGED_CURRENTPRICELOCATIONNAME)~=0 then streamWriteString(bu,self.currentPriceLocationName)end;if bitAND(self.changeFlags,a_.CHANGED_CURRENTPRICE)~=0 then streamWriteFloat32(bu,self.currentPrice)end;if bitAND(self.changeFlags,a_.CHANGED_MEANPRICESUM)~=0 then streamWriteFloat32(bu,self.meanPriceSum)end;if bitAND(self.changeFlags,a_.CHANGED_MEANPRICECOUNT)~=0 then streamWriteFloat32(bu,self.meanPriceCount)end;if bitAND(self.changeFlags,a_.CHANGED_HIGHESTPRICE)~=0 then streamWriteFloat32(bu,self.highestPrice)end;if bitAND(self.changeFlags,a_.CHANGED_LOWESTPRICE)~=0 then streamWriteFloat32(bu,self.lowestPrice)end;if bitAND(self.changeFlags,a_.CHANGED_CURRENTTREND)~=0 then streamWriteFloat32(bu,self.currentTrend)end end;function by:run(bv)if g_dedicatedServerInfo==nil then local k=CommodityPricesClient:getExistingCommodity(self.fillTypeId)if k~=nil and k.populatedFlags==a_.POPULATED_ALL or self.changeFlags==a_.POPULATED_ALL then CommodityPricesClient:syncCommodity(self.fillTypeId,self.currentPriceLocationName,self.currentPrice,self.meanPriceSum,self.meanPriceCount,self.highestPrice,self.lowestPrice,self.currentTrend)else aZ:sendRequest(self.fillTypeId)end end end;function by:sendUpdate(k,bv,bA)local bw=by:emptyNew()bw.fillTypeId=k.fillTypeId;bw.changeFlags=k.changeFlags;if bA then bw.changeFlags=k.populatedFlags end;if bw.changeFlags~=0 and k.populatedFlags==a_.POPULATED_ALL then if bitAND(bw.changeFlags,a_.CHANGED_CURRENTPRICELOCATIONNAME)~=0 then bw.currentPriceLocationName=k.currentPriceLocationName end;if bitAND(bw.changeFlags,a_.CHANGED_CURRENTPRICE)~=0 then bw.currentPrice=k.currentPrice end;if bitAND(bw.changeFlags,a_.CHANGED_MEANPRICESUM)~=0 then bw.meanPriceSum=k.meanPriceSum end;if bitAND(bw.changeFlags,a_.CHANGED_MEANPRICECOUNT)~=0 then bw.meanPriceCount=k.meanPriceCount end;if bitAND(bw.changeFlags,a_.CHANGED_HIGHESTPRICE)~=0 then bw.highestPrice=k.highestPrice end;if bitAND(bw.changeFlags,a_.CHANGED_LOWESTPRICE)~=0 then bw.lowestPrice=k.lowestPrice end;if bitAND(bw.changeFlags,a_.CHANGED_CURRENTTREND)~=0 then bw.currentTrend=k.currentTrend end;if bv==nil then g_server:broadcastEvent(bw,g_dedicatedServerInfo==nil)else bv:sendEvent(bw)end end end;InitEventClass(by,"CommodityPricesUpdateEvent")return by end;local function bB()local bi={}local bC=Class(bi)bi.CHANGED_FONTSIZE=1;bi.CHANGED_BASEPOSX=2;bi.CHANGED_BASEPOSY=4;bi.CHANGED_HALIGNMENT=8;bi.CHANGED_VALIGNMENT=16;bi.CHANGED_BACKGROUNDALPHA=32;bi.CHANGED_NORMALIZEPRICES=64;bi.CHANGED_ORDERBY=128;bi.POPULATED_ALL=255;function bi:new(b6,n)local self={}setmetatable(self,n or bC)self.changeFlags=0;self.populatedFlags=0;self.nickname=b6;return self end;function bi:setFontSize(aI)local p=false;if self.fontSize~=aI then self.fontSize=aI;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_FONTSIZE)if self.fontSize~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_FONTSIZE)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_FONTSIZE)end;p=true end;return p end;function bi:setBasePosX(b7)local p=false;if self.basePosX~=b7 then self.basePosX=b7;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_BASEPOSX)if self.basePosX~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_BASEPOSX)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_BASEPOSX)end;p=true end;return p end;function bi:setBasePosY(b8)local p=false;if self.basePosY~=b8 then self.basePosY=b8;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_BASEPOSY)if self.basePosY~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_BASEPOSY)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_BASEPOSY)end;p=true end;return p end;function bi:setHAlignment(aE)local p=false;if self.hAlignment~=aE then self.hAlignment=aE;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_HALIGNMENT)if self.hAlignment~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_HALIGNMENT)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_HALIGNMENT)end;p=true end;return p end;function bi:setVAlignment(aG)local p=false;if self.vAlignment~=aG then self.vAlignment=aG;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_VALIGNMENT)if self.vAlignment~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_VALIGNMENT)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_VALIGNMENT)end;p=true end;return p end;function bi:setBackgroundAlpha(aD)local p=false;if self.backgroundAlpha~=aD then self.backgroundAlpha=aD;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_BACKGROUNDALPHA)if self.backgroundAlpha~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_BACKGROUNDALPHA)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_BACKGROUNDALPHA)end;p=true end;return p end;function bi:setNormalizePrices(aC)local p=false;if self.normalizePrices~=aC then self.normalizePrices=aC;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_NORMALIZEPRICES)if self.normalizePrices~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_NORMALIZEPRICES)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_NORMALIZEPRICES)end;p=true end;return p end;function bi:setOrderBy(aP)local p=false;if self.orderBy~=aP then self.orderBy=aP;self.changeFlags=bitOR(self.changeFlags,bi.CHANGED_ORDERBY)if self.orderBy~=nil then self.populatedFlags=bitOR(self.populatedFlags,bi.CHANGED_ORDERBY)else self.populatedFlags=bitAND(self.populatedFlags,bi.POPULATED_ALL-bi.CHANGED_ORDERBY)end;p=true end;return p end;return bi end;local function bD(b1)local b0={}local bE=Class(b0,Event)function b0:emptyNew()local self=Event:new(bE)return self end;function b0:new(b6,bF,bG,aI,b7,b8,aE,aG,aD,aC,aP,bH,bI)local self=b0:emptyNew()self.nickname=b6;self.changeFlags=bF;self.populatedFlags=bG;self.fontSize=aI;self.basePosX=b7;self.basePosY=b8;self.hAlignment=aE;self.vAlignment=aG;self.backgroundAlpha=aD;self.normalizePrices=aC;self.orderBy=aP;self.clientToServerUpdateInterval=bH;self.isFromServer=bI;return self end;function b0:readStream(bu,bv)self.isFromServer=streamReadBool(bu)self.clientToServerUpdateInterval=streamReadInt32(bu)self.nickname=streamReadString(bu)self.changeFlags=streamReadInt32(bu)if bitAND(self.changeFlags,b1.CHANGED_FONTSIZE)~=0 then self.fontSize=streamReadFloat32(bu)end;if bitAND(self.changeFlags,b1.CHANGED_BASEPOSX)~=0 then self.basePosX=streamReadFloat32(bu)end;if bitAND(self.changeFlags,b1.CHANGED_BASEPOSY)~=0 then self.basePosY=streamReadFloat32(bu)end;if bitAND(self.changeFlags,b1.CHANGED_HALIGNMENT)~=0 then self.hAlignment=streamReadString(bu)end;if bitAND(self.changeFlags,b1.CHANGED_VALIGNMENT)~=0 then self.vAlignment=streamReadString(bu)end;if bitAND(self.changeFlags,b1.CHANGED_BACKGROUNDALPHA)~=0 then self.backgroundAlpha=streamReadFloat32(bu)end;if bitAND(self.changeFlags,b1.CHANGED_NORMALIZEPRICES)~=0 then self.normalizePrices=streamReadBool(bu)end;if bitAND(self.changeFlags,b1.CHANGED_ORDERBY)~=0 then self.orderBy=streamReadInt32(bu)end;self:run(bv)end;function b0:writeStream(bu,bv)streamWriteBool(bu,self.isFromServer)streamWriteInt32(bu,self.clientToServerUpdateInterval or 1000)streamWriteString(bu,self.nickname)streamWriteInt32(bu,self.changeFlags)if bitAND(self.changeFlags,b1.CHANGED_FONTSIZE)~=0 then streamWriteFloat32(bu,self.fontSize)end;if bitAND(self.changeFlags,b1.CHANGED_BASEPOSX)~=0 then streamWriteFloat32(bu,self.basePosX)end;if bitAND(self.changeFlags,b1.CHANGED_BASEPOSY)~=0 then streamWriteFloat32(bu,self.basePosY)end;if bitAND(self.changeFlags,b1.CHANGED_HALIGNMENT)~=0 then streamWriteString(bu,self.hAlignment)end;if bitAND(self.changeFlags,b1.CHANGED_VALIGNMENT)~=0 then streamWriteString(bu,self.vAlignment)end;if bitAND(self.changeFlags,b1.CHANGED_BACKGROUNDALPHA)~=0 then streamWriteFloat32(bu,self.backgroundAlpha)end;if bitAND(self.changeFlags,b1.CHANGED_NORMALIZEPRICES)~=0 then streamWriteBool(bu,self.normalizePrices)end;if bitAND(self.changeFlags,b1.CHANGED_ORDERBY)~=0 then streamWriteInt32(bu,self.orderBy)end end;function b0:run(bv)if self.isFromServer then if g_currentMission:getIsClient()and g_dedicatedServerInfo==nil then CommodityPricesClient.clientToServerUpdateInterval=self.clientToServerUpdateInterval;CommodityPricesClient:updatePlayer(self.nickname,self.fontSize,self.basePosX,self.basePosY,self.hAlignment,self.vAlignment,self.backgroundAlpha,self.normalizePrices,self.orderBy)end else local bp=false;if self.nickname==nil or self.nickname==''then for aN,bJ in ipairs(g_currentMission.users)do if bJ.connection==bv then self.nickname=bJ.nickname;break end end;bp=true end;CommodityPricesServer:updatePlayer(self.nickname,self.fontSize,self.basePosX,self.basePosY,self.hAlignment,self.vAlignment,self.backgroundAlpha,self.normalizePrices,self.orderBy,bp)end end;function b0:sendUpdate(bi,bH,bI)local bF=bi.changeFlags;if bF~=0 or bi.nickname==''then local aI,b7,b8,aE,aG,aD,aC,aP;if bitAND(bF,b1.CHANGED_FONTSIZE)~=0 then aI=bi.fontSize end;if bitAND(bF,b1.CHANGED_BASEPOSX)~=0 then b7=bi.basePosX end;if bitAND(bF,b1.CHANGED_BASEPOSY)~=0 then b8=bi.basePosY end;if bitAND(bF,b1.CHANGED_HALIGNMENT)~=0 then aE=bi.hAlignment end;if bitAND(bF,b1.CHANGED_VALIGNMENT)~=0 then aG=bi.vAlignment end;if bitAND(bF,b1.CHANGED_BACKGROUNDALPHA)~=0 then aD=bi.backgroundAlpha end;if bitAND(bF,b1.CHANGED_NORMALIZEPRICES)~=0 then aC=bi.normalizePrices end;if bitAND(bF,b1.CHANGED_ORDERBY)~=0 then aP=bi.orderBy end;local bw=b0:new(bi.nickname,bF,bi.populatedFlags,aI,b7,b8,aE,aG,aD,aC,aP,bH,bI)if bw.isFromServer then for aN,bJ in ipairs(g_currentMission.users)do if bJ.nickname==bw.nickname then bJ.connection:sendEvent(bw)break end end else g_client:getServerConnection():sendEvent(bw)end end end;InitEventClass(b0,"CommodityPricesUpdatePlayerEvent")return b0 end;local function bK()local a_=j()local aZ=br()local bm=bx(aZ,a_)local b1=bB()local b0=bD(b1)local bL={path=g_currentModDirectory}function bL:update(b4)end;function bL:deleteMap()end;function bL:loadMap(b5)if g_currentMission:getIsServer()then CommodityPricesServer=bl(self.path,bm,a_,b0,b1)end;if g_currentMission:getIsClient()and g_dedicatedServerInfo==nil then CommodityPricesClient=aX(self.path,aZ,a_,b0,b1)end;for bM,bN in ipairs(g_modEventListeners)do if bN==bL then g_modEventListeners[bM]=nil;break end end end;function bL:draw()end;function bL:mouseEvent(at,au,av,aw,ax)end;function bL:keyEvent(ay,az,aA,av)end;addModEventListener(bL)end;bK()
