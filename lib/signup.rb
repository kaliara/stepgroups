class SignupApp < Sinatra::Base

  Pony.options = { :to => 'info@stepgroups.com', :via => :smtp, :via_options => {
      :address              => 'smtp.gmail.com',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => 'info@stepgroups.com',
      :password             => 'bean0bean0',
      :authentication       => :plain
    } 
  }

  get '/' do
    erb :signup, :layout => :layout_main
  end

  post '/email' do
    Pony.mail(:from => params[:email_address], :subject => 'New signup', :body => erb(:email))
    redirect to('/thanks')
  end

  get '/thanks' do
    erb :thanks, :layout => :layout_main
  end
end