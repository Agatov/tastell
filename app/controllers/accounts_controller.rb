class AccountsController < ApplicationController

  layout 'account'

  def login

  end

  def authenticate
    @account = Account.find_by_login(params[:account][:login])

    if @account.can_authorize? params[:account]
      sign_in @account
      redirect_to account_places_path
    else
      render :login
    end
  end

  def logout
    sign_out
    redirect_to login_accounts_path
  end

  private

  def sign_in(account)
    session[:account_id] = account.id
  end

  def sign_out
    session.delete(:account_id)
  end

  def current_account
    if account_signed_in?
      @current_account ||= Account.find(session[:account_id])
    end
  end

  def account_signed_in?
    !session[:account_id].nil?
  end

  def autheticate_account!
    redirect_to places_path unless account_signed_in?
  end

  helper_method :current_account
  helper_method :account_signed_in?
end