# _*_ coding: utf-8 _*_

require 'sinatra'
require 'json'
require 'net/http'
require 'uri'

if development?
	require 'sinatra/reloader'
end

#
# 初期設定
#
# Kampa! ユーザーのカンパページ一覧取得
# http://kampa.me/api/queue/zDBw3jKYuP5xhZCzXSsdrUf4.json
$KAMPA_API_LIST_URL = "http://kampa.me/api/queue/"

# Kampa! カンパ状況取得
# http://kampa.me/t/d.json
$KAMPA_API_DETAIL_URL = "http://kampa.me/t/"

def get_json(location, limit = 10)
	raise ArgumentError, 'too many HTTP redirects' if limit == 0
	uri = URI.parse(location);

	begin
		response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
			http.open_timeout = 5;
			http.read_timeout = 10;
			http.get(uri.request_uri);
		end

		case response
		when Net::HTTPSuccess
			json = response.body;
			JSON.parse(json);
		when Net::HTTPRedirection
			location = response['location'];
			warn "redirected to #{location}";
			get_json(location, limit - 1);
		else
			puts [ uri.to_s, response.value ].json(" : ");
			# handle error
		end
	rescue => e
		puts [ uri.to_s, e.class, e].join(" : ");
		# handle error
	end
end


# 指定されたURLを表示
get '/kampa/:key' do
	content_type :json, :charset => 'utf-8';
	consumer_key = params[:key];

	# カンパ一覧取得
	request_uri = $KAMPA_API_LIST_URL + consumer_key + '.json';
	kampa_list = get_json(request_uri);

	result = Array.new();

	kampa_list.each do |list|
		request_uri = $KAMPA_API_DETAIL_URL + list['kmpid'] + '.json';
		kampa = get_json(request_uri);
		result.push(kampa);
	end

	output = { :status_code => '200', :data => result, :status_text => 'OK' }
	JSON.pretty_generate(output);
end


get '/' do
	"見たな…"
end
