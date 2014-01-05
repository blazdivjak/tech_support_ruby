class ZahtevkiController < ApplicationController

  def dodaj
    if !current_user
      redirect_to(prijava_path)
    end
  end

  def uredi
    if !current_user
      redirect_to(prijava_path)
    end

    if session[:level] == 2 or session[:level] == 3
      #@tickets = Ticket.all
      @tickets = Ticket.where(["level = ?", session[:level]])
    else
      @tickets = Ticket.find_all_by_user_id(session[:user_id])
    end
    @edited_ticket = Ticket.where(["id = ?", params[:id]]).first
    @ticket_user = User.where(["id = ?", @edited_ticket.user_id]).first
    @messages = Message.where(["ticket_id = ?", params[:id]])
    @test = "bla"
  end

  def potrdi
    ticket = Ticket.where(["id = ?", params[:id]]).first
    ticket.state=4
    ticket.save
    redirect_to :controller => "zahtevki", :action => "uredi", :id => params[:id]
  end

  def odpri
    ticket = Ticket.where(["id = ?", params[:id]]).first
    ticket.state=1
    ticket.save
    redirect_to :controller => "zahtevki", :action => "uredi", :id => params[:id]
  end

  def prevzemi
    ticket = Ticket.where(["id = ?", params[:id]]).first
    ticket.admin=session[:user_id]
    ticket.state=2
    ticket.save
    redirect_to :controller => "zahtevki", :action => "uredi", :id => params[:id]
  end

  def eskaliraj
    ticket = Ticket.where(["id = ?", params[:id]]).first
    ticket.level=3
    ticket.save
    redirect_to :controller => "zahtevki", :action => "pregled"
  end

  def pregled
    if !current_user
        redirect_to(prijava_path)
    end

    if session[:level] == 2 or session[:level] == 3
      #@tickets = Ticket.all
      @tickets = Ticket.where(["level = ?", session[:level]])
    else
      @tickets = Ticket.find_all_by_user_id(session[:user_id])
    end
  end

  def izbrisi
    @ticket_num=params[:id]
    Ticket.find(@ticket_num).destroy

  end

  def poslji
    #redirect_to(uredi(params[:id]))

    time = Time.new
    time.strftime("%Y-%m-%d %H:%M:%S")
    id = params[:id]

    @ticket = Ticket.where(["id = ?", params[:id]]).first
    if session[:level]==2 or session[:level]==3
      @ticket.state="3"
    else
      @ticket.state="1"
    end
    @ticket.save
    #@ticket_user = User.where(["id = ?", @edited_ticket.user_id]).first

    #m = Message.new content: params[:message], date: time, user: session[:user], privilegelvl: session[:level], ticket_id: params[:id]
    m = Message.create content: params[:message], date: time, user: session[:name], privilegelvl: session[:level], ticket_id: params[:id]
    m.save

    #Message.create()

    redirect_to :controller => "zahtevki", :action => "uredi", :id => params[:id]
  end

end
