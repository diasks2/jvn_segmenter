# -*- encoding : utf-8 -*-
#
# Sinatra route mapping
#

## POST curl http://still-taiga-9764.herokuapp.com/?text="Nó là một bản tuyên ngôn đặc sắc của chủ nghĩa nhân đạo , một tiếng chuông cảnh tỉnh trước hiểm họa lớn lao của hành tinh trước sự điên rồ của những kẻ cuồng tín ."
post "/?" do
  new_params = accept_params(params :text)
  segmented_sentence = JvnSegmenter.new(new_params).segment
  "Here is your sentence: #{segmented_sentence}"
end