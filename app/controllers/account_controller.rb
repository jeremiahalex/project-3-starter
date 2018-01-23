class AccountController < ApplicationController
  def home
  end

  def signup
    @new_account = Account.new
  end

  def create
    @new_account = Account.new(account_params)
    @new_account.save
    redirect_to account_home_url
  end

  def login
    @login = Account.new
  end

  def authenticate
    @login = Account.find_by(email: account_params[:email])
    redirect_to account_home_url
  end

  def edit
    @edit_account = Account.find(params[:id])
  end

  def update
    @edit_account = Account.find(params[:id])

    if @edit_account.update(account_params)
      redirect_to account_home_url
    else
      render 'edit'
    end
  end

  # def delete
  # end

  private
  def account_params
    params.require(:account).permit(:first_name, :last_name, :email, :password)
  end
end
