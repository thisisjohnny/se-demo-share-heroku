require 'sinatra'
require 'restforce'

enable :sessions
salesforce = Restforce.new

get '/' do
  @page_title = 'Home'
  erb :index
end

post '/send' do
  @company          = params[:company]
  @company_phone    = params[:company_phone]
  @company_website  = params[:company_website]
  @first_name       = params[:first_name]
  @last_name        = params[:last_name]
  @email            = params[:email]

  #salesforce custom REST callout
  salesforce.post('/services/apexrest/Onboarding/registerPartner',
                 company:         "#{@company}",
                 companyWebsite:  "#{@company_website}",
                 companyPhone:    "#{@company_phone}",
                 firstName:       "#{@first_name}",
                 lastName:        "#{@last_name}",
                 email:           "#{@email}"
  )

  session[:name]    = @first_name
  session[:email]   = @email
  session[:company] = @company
  redirect to('/thanks')
end

get '/thanks' do
  @page_title       = 'Thank You!'
  @name             = session[:name]
  @email            = session[:email]
  @company          = session[:company]
  erb :thanks
end

get '/*' do
  @page_title = 'Home'
  erb :index
end
