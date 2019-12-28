class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: %i[rum_config]

  User = Struct.new(:id, :email, :username)

  INDEX_FILE =
    File.read(Rails.root.join('frontend', 'build', 'index.html'))

  def index
    respond_to do |format|
      format.html do
        render plain: inject_rum_config(INDEX_FILE)
      end
    end
  end

  private

end
