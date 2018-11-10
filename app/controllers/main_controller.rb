class MainController < ApplicationController
  before_action :authenticate_user!
  
  @@origin_color = ['#d54e21','#78a300','#0e76a8','#9cc2cb','#73716e','#ff7700','#ffcc00','#ff66b5','#6a5a8c']
  
  def _index
    # 이거슨 그냥 계산하기위한 것...지금은 index에서 하지만, \나중엔 home에서.
    # 옮기기만하면될듯..?!
    # home 화면에서 블록띄울떄, 블록개수를 세주는 변수 count 수 설정.. 주급,월급계산은 그걸로다가..
    @count=params[:alba_count]
    @albas=Alba.where("user_distinguish= :u_id", {:u_id => current_user.id})
    @a=0;
    @a_fix=0;
    @b_fix=0;
    @a10=0;
    @b10=0;
    @b=0;
    @c=1.5;
    @d=0;
    @e1=0;
    @e=0;
    @final=0;
    
    @money=0;
  end
  
  def home
    
   
    @albas=Alba.where("user_distinguish= :u_id", {:u_id => current_user.id})
    @a=0;
    @a_fix=0;
    @b_fix=0;
    @a10=0;
    @b10=0;
    @b=0;
    @c=1.5;
    @d=0;
    @e1=0;
    @e=0;
    @final=0;
    
    @money=0;
  end
  
  def create
    
    puts "-----------------------"
    puts params
    puts "-----------------------"
    @alba=Alba.new
    @alba.user_distinguish=params[:user_id]
    @alba.name=params[:alba_name]     
    @alba.money_hour=params[:alba_money_hour]
    @alba.place=params[:alba_place]
    @alba.s_hour=params[:alba_s_hour]
    @alba.s_minute=params[:alba_s_minute]
    @alba.e_hour=params[:alba_e_hour]
    @alba.e_minute=params[:alba_e_minute]
    @alba.nightbonus=params[:alba_nightbonus]
    @alba.weekbonus=params[:alba_weekbonus]
    @alba.holidaybonus=params[:alba_holidaybonus]
    @alba.extendbonus=params[:alba_extendbonus]
    @alba.color=params[:alba_color]
    
    
    
    # @alba.tax=""
    @alba.save
    @alba.distinguish=@alba.id
    @alba.picked=false
    @alba.save
    
    @hasColor = false
    @@origin_color.each do |c|
      if(c==params[:alba_color])
        @hasColor=true
        break
      end
    end
    if @hasColor==false
      @p =Palette.new
      @p.user_id=current_user.id
      @p.color=params[:alba_color]
      @p.save
    end
    
    
    
    redirect_to '/'
    
  end
  
  def delete
    @alba=Alba.find(params[:alba_id])
    @alba.destroy
    redirect_to '/'
    
  end
  
  def copy
     @albas=Alba.all
     @a=0
     
    @albas.each do |a|
      if(a.picked==true)
       @a=a.id
       
      end
    end
     @alba2=Alba.find(@a)
     @alba2.picked=false
     @alba=Alba.find(params[:alba_count])
     @alba.user_distinguish=params[:user_id]
     @alba.picked=true
     @alba.final2=params[:final_money]
     @alba.save
      @alba2.save
    redirect_to '/'
  end
  
  
  def create2
    @alba=Alba.find(params[:distinguish_id])
    @alba2=Alba.new
    @alba.user_distinguish=params[:user_id]
    @alba2.name=@alba.name
    @alba2.money_hour=@alba.money_hour
    @alba2.place=@alba.place
    @alba2.s_hour=@alba.s_hour
    @alba2.s_minute=@alba.s_minute
    @alba2.e_hour=@alba.e_hour
    @alba2.e_minute=@alba.e_minute
    @alba2.nightbonus=@alba.nightbonus
    @alba2.weekbonus=@alba.weekbonus
    @alba2.holidaybonus=@alba.holidaybonus
    @alba2.extendbonus=@alba.extendbonus
    @alba2.final=@alba.final2
    @alba2.distinguish=@alba.distinguish
    @alba2.user_distinguish=@alba.user_distinguish
    @alba2.save
    redirect_to '/'
  end
  
end
