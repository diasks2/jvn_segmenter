#
# Sinatra route mapping
#

get '/' do
  JvnSegmenter.new("Nó là một bản tuyên ngôn đặc sắc của chủ nghĩa nhân đạo , một tiếng chuông cảnh tỉnh trước hiểm họa lớn lao của hành tinh trước sự điên rồ của những kẻ cuồng tín ."
=> "Nó là một bản tuyên ngôn đặc sắc của chủ nghĩa nhân đạo , một tiếng chuông cảnh tỉnh trước hiểm họa lớn lao của hành tinh trước sự điên rồ của những kẻ cuồng tín .").segment
end
