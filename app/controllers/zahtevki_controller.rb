class ZahtevkiController < ApplicationController

  def new
    if !current_user
      redirect_to(prijava_path)
    end

    time = Time.new
    time.strftime("%Y-%m-%d %H:%M:%S")

    #get stuff from form and create new ticket

    if session[:level]==1
      m = Ticket.create problem: params[:kratek_opis], date: time, podrocje: params[:podrocje], description: params[:opis], phone: params[:tel], level: "2", user_id: session[:user_id], state: "1"
      m.save
      redirect_to :controller => "zahtevki", :action => "pregled"
    else
    #find user / escalate / set solved status
      @ticket_user = User.where(["username = ?", params[:username]]).first
      if @ticket_user

        level=2
        state="2"

        if params[:expert]=="Da"
          level=3
        end
        if params[:closed]=="Da"
          state="4"
        end
        m = Ticket.create problem: params[:kratek_opis], date: time, podrocje: params[:podrocje], description: params[:opis], phone: params[:tel], level: level,admin: session[:user_id], user_id: @ticket_user.id, state: state
        m.save
        redirect_to :controller => "zahtevki", :action => "pregled"
      else
        redirect_to :controller => "zahtevki", :action => "dodaj_admin"
    end
    end
  end

  def dodaj
    if !current_user
      redirect_to(prijava_path)
    end
  end

  def dodaj_admin
    if !current_user
      redirect_to(prijava_path)
    end
  end

  def uredi
    if !current_user
      redirect_to(prijava_path)
    end
    @users = User.all
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

    @users = User.all
    if session[:level] == 2 or session[:level] == 3
      #@tickets = Ticket.all
      if(params[:search])
        @tickets = Ticket.where(["id = ?  OR problem = ? OR date = ? OR podrocje = ? OR description = ? OR phone = ? OR admin = ? OR state  = ?", params[:search],params[:search],params[:search],params[:search],params[:search],params[:search],params[:search],params[:search]])
      else
        @tickets = Ticket.where(["level = ?", session[:level]])
      end

    else
      if(params[:search])
        @tickets = Ticket.where(["(id = ?  OR problem = ? OR date = ? OR podrocje = ? OR description = ? OR phone = ? OR admin = ? OR state  = ?) AND user_id = ?", params[:search],params[:search],params[:search],params[:search],params[:search],params[:search],params[:search],params[:search],session[:user_id]])
      else
      @tickets = Ticket.find_all_by_user_id(session[:user_id])
      end
    end
  end

  def izbrisi
    @ticket_num=params[:id]
    Ticket.find(@ticket_num).destroy
    redirect_to :controller => "zahtevki", :action => "pregled"
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
