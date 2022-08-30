class App < Sinatra::Base
	get '/' do
		{foo: 'hello world!'}
	end
end