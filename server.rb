# -*- encoding : utf-8 -*-
#
# Sinatra route mapping
#

require 'jvn_segmenter'
## curl -d 'text=Nó là một bản tuyên ngôn đặc sắc của chủ nghĩa nhân đạo , một tiếng chuông cảnh tỉnh trước hiểm họa lớn lao của hành tinh trước sự điên rồ của những kẻ cuồng tín .' http://still-taiga-9764.herokuapp.com
post "/?" do
  JvnSegmenter.new(params[:text]).segment
end