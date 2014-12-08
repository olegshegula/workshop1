require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

post '/result' do
  @data = params[:data]
  @new_array = check_capitalize
  @my_array = edit_phones
  haml :result
end

def edit_phones
  my_array = []
  my_line = @data.lines
  my_line.each do |line|
    new_content = line.sub('000', '093').sub('+38-', '')
    my_array << new_content
  end
  my_array.sort_by { |line| line.split[1].capitalize }.each do |i|
    puts i
  end
  my_array
end

def check_capitalize
  new_array = []
  my_line = @data.lines
  my_line.each do |line|
    new_line = line.split
    new_array << new_line.each { |e| puts "The name #{e} is not capitalize! " unless e == e.capitalize }
  end
  new_array
end

