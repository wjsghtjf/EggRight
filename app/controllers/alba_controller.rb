class AlbaController < ApplicationController
  
  def create
    @a=0
  end
  
  
  def edit
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
  
  def delete
    
    @alba=Alba.find(params[:alba_id])
    @alba.destroy
    redirect_to '/'
    
  end
  def modify
    @a=0
    @alba=Alba.find(params[:alba_id])
    @alba.s_hour=params[:alba_s_hour]
    @alba.s_minute=params[:alba_s_minute]
    @alba.e_hour=params[:alba_e_hour]
    @alba.e_minute=params[:alba_e_minute]
    @a=@alba.final2
    @alba.save
    @alba.final=@a
    @alba.save
    redirect_to '/alba/edit'
  end
  
  
  
  def create2
    @jsonData = JSON.parse params[:jsonData]
    
    puts "-------------------"
    puts @jsonData
    puts "-------------------"
    
    Alba.where("user_distinguish= :u_id and final!=0", {:u_id => current_user.id}).destroy_all
    @jsonData.each do |obj|
      @day =obj["day"]
      @id = obj["id"]
      @distinguish = @id
      
      
      @alba=Alba.find(@distinguish)
      @alba2=Alba.new
      @alba.user_distinguish=current_user.id
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
      @alba2.dateDistinguish = @day
      @alba2.color=@alba.color
      @alba2.nightalpha=@alba.nightalpha
      @alba2.holidayalpha=@alba.holidayalpha
      @alba2.save
    end
    redirect_to '/'
  end
  
end
