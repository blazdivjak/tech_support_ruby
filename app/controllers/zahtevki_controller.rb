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
      @tickets = Ticket.all
    else
      @tickets = Ticket.find_all_by_user_id(session[:user_id])
    end
    @edited_ticket = Ticket.where(["id = ?", params[:id]]).first

    @test = "bla"
  end

  def potrdi
  end

  def prevzemi
  end

  def eskaliraj
  end

  def pregled
    if !current_user
        redirect_to(prijava_path)
    end

    if session[:level] == 2 or session[:level] == 3
      @tickets = Ticket.all
    else
      @tickets = Ticket.find_all_by_user_id(session[:user_id])
    end
  end

  def izbrisi
    @ticket_num=params[:id]
    Ticket.find(@ticket_num).destroy

  end
end
